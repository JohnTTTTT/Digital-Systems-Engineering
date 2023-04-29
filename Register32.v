module Register32 #(parameter VAL = 0)(input clk, clr, enable, input [31:0] d, output [31:0] q);

//initial q <= VAL;
	reg [31:0] Register;
	
	initial begin
		Register = VAL;
	end

	always @ (posedge clk)
	begin
				if (clr) begin
							Register[31:0] <= 32'b0;		
				end else if (enable) begin
							Register[31:0] <= d;
				end
	end

	assign q[31:0] = Register[31:0];

endmodule