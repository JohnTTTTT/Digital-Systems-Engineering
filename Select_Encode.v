module Select_Encode (input Gra, Grb, Grc, Rin, Rout, BAout, input [31:0] IR, output reg R0out, R1out, R2out, R3out, 
							R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
							R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in);
			
reg [3:0] Decoder_in;
initial
	begin
		R0out = 0;
		R1out = 0;
		R2out = 0;
		R3out = 0;
		R4out = 0;
		R5out = 0;
		R6out = 0;
		R7out = 0;
		R8out = 0;
		R9out = 0;
		R10out = 0;
		R11out = 0;
		R12out = 0;
		R13out = 0;
		R14out = 0;
		R15out= 0;
		R0in = 0;
		R1in = 0;
		R2in = 0;
		R3in = 0;
		R4in = 0;
		R5in = 0;
		R6in = 0;
		R7in = 0;
		R8in = 0;
		R9in = 0;
		R10in = 0;
		R11in = 0;
		R12in = 0;
		R13in = 0;
		R14in = 0;
		R15in = 0;
	end

always @(*) begin
	if (Gra) begin
		Decoder_in <= IR [26:23];
	end else if (Grb) begin
		Decoder_in <= IR [22:19];
	end else if (Grc) begin
		Decoder_in <= IR [18:15];
	end 
	R0out = 0;
	R1out = 0;
	R2out = 0;
	R3out = 0;
	R4out = 0;
	R5out = 0;
	R6out = 0;
	R7out = 0;
	R8out = 0;
	R9out = 0;
	R10out = 0;
	R11out = 0;
	R12out = 0;
	R13out = 0;
	R14out = 0;
	R15out= 0;
	R0in = 0;
	R1in = 0;
	R2in = 0;
	R3in = 0;
	R4in = 0;
	R5in = 0;
	R6in = 0;
	R7in = 0;
	R8in = 0;
	R9in = 0;
	R10in = 0;
	R11in = 0;
	R12in = 0;
	R13in = 0;
	R14in = 0;
	R15in = 0;

	case (Decoder_in)
		4'b0000: begin
						if (Rin) begin
							R0in = 1;
							R0out = 0;
						end else if (Rout | BAout) begin
							R0out = 1;
							R0in = 0;
						end
					end
		4'b0001: begin
					 if (Rin) begin
							R1in = 1;
							R1out = 0;
						end else if (Rout | BAout) begin
							R1out = 1;
							R1in = 0;
						end
					end
		4'b0010: begin
					 if (Rin) begin
							R2in = 1;
							R2out = 0;
						end else if (Rout | BAout) begin
							R2out = 1;
							R2in = 0;
						end
					end
		4'b0011: begin
					 if (Rin) begin
							R3in = 1;
							R3out = 0;
						end else if (Rout | BAout) begin
							R3out = 1;
							R3in = 0;
						end
					end
		4'b0100: begin
					 if (Rin) begin
							R4in = 1;
							R4out = 0;
						end else if (Rout | BAout) begin
							R4out = 1;
							R4in = 0;
						end
					end
		4'b0101: begin
					 if (Rin) begin
							R5in = 1;
							R5out = 0;
						end else if (Rout | BAout) begin
							R5out = 1;
							R5in = 0;
						end
					end
		4'b0110: begin
					 if (Rin) begin
							R6in = 1;
							R6out = 0;
						end else if (Rout | BAout) begin
							R6out = 1;
							R6in = 0;
						end
					end
		4'b0111: begin
					 if (Rin) begin
							R7in = 1;
							R7out = 0;
						end else if (Rout | BAout) begin
							R7out = 1;
							R7in = 0;
						end
					end
		4'b1000: begin
					 if (Rin) begin
							R8in = 1;
							R8out = 0;
						end else if (Rout | BAout) begin
							R8out = 1;
							R8in = 0;
						end
					end
		4'b1001: begin
					 if (Rin) begin
							R9in = 1;
							R9out = 0;
						end else if (Rout | BAout) begin
							R9out = 1;
							R9in = 0;
						end
					end
		4'b1010: begin
					 if (Rin) begin
							R10in = 1;
							R10out = 0;
						end else if (Rout | BAout) begin
							R10out = 1;
							R10in = 0;
						end
					end
		4'b1011: begin
					 if (Rin) begin
							R11in = 1;
							R11out = 0;
						end else if (Rout | BAout) begin
							R11out = 1;
							R11in = 0;
						end
					end
		4'b1100: begin
					 if (Rin) begin
							R12in = 1;
							R12out = 0;
						end else if (Rout | BAout) begin
							R12out = 1;
							R12in = 0;
						end
					end
		4'b1101: begin
					 if (Rin) begin
							R13in = 1;
							R13out = 0;
						end else if (Rout | BAout) begin
							R13out = 1;
							R13in = 0;
						end
					end
		4'b1110: begin
					 if (Rin) begin
							R14in = 1;
							R14out = 0;
						end else if (Rout | BAout) begin
							R14out = 1;
							R14in = 0;
						end
					end
		4'b1111: begin
					 if (Rin) begin
							R15in = 1;
							R15out = 0;
						end else if (Rout | BAout) begin
							R15out = 1;
							R15in = 0;
						end
					end
	endcase
end	
endmodule