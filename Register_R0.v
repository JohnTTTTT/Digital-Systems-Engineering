module Register_R0 #(parameter VAL = 0)(input clk, clr, enable, BAout, input [31:0] d, output [31:0] q);

	reg [31:0] Register;
	reg [31:0] Zero = 32'b0;
	
	initial begin
		Register = VAL;
	end

	always @ (posedge clk)
	begin
				if (clr) begin
							Register[31:0] <= 32'b0;		
				end else if (enable) begin
					if(BAout == 0) begin
							Register[31:0] <= d;
					end else begin
							Register <= 'b0;
					end
				end
	end

	assign q[31:0] = BAout ? Zero: Register[31:0];

endmodule