module ALU (input [31:0] A, B, input [4:0] ALU_ctl, input IncPC, output [31:0] Zhigh, Zlow);

parameter		Load = 5'b00000, Load_imm = 5'b00001, Store = 5'b00010, Addition = 5'b00011, Subtraction = 5'b00100,
					AND = 5'b00101, OR = 5'b00110, ShiftR = 5'b00111, SHRA = 5'b01000, ShiftL = 5'b01001, ROR = 5'b01010, ROL = 5'b01011,
					Add_imm = 5'b01100, AND_imm = 5'b01101, OR_imm = 5'b01110, Multiply = 5'b01111, Divide = 5'b10000,
					Negate = 5'b10001, NOT = 5'b10010, Branch = 5'b10011;	

wire [31:0] Adder_out, Subtracter_out, Shr_out, Shl_out, Ror_out, Rol_out,
				And_out, Or_out, Neg_out, Not_out, Div_out, Div_rem, IncPC_out, Shra_out;
				
wire [63:0] Mult_out;
wire Adder_cout, Subtracter_cout, IncPC_cout;

reg [31:0] Zltemp;
reg [31:0] Zhtemp;

assign Zlow = Zltemp;
assign Zhigh = Zhtemp;

AND_32 Ander (A, B, And_out);
OR_32 Orer (A, B, Or_out);
Adder_32 Adder (A, B, 1'b0, Adder_out, Adder_cout);
Adder_32 PC_inc (32'b1, B, 1'b0, IncPC_out, IncPC_cout);
Subtraction Subtracter (A, B, 1'b0, Subtracter_out, Subtracter_cout);
Multiplier Mult (A, B, Mult_out);
Division Divider (A, B, Div_out, Div_rem);
SHR ShifterR (A, B, Shr_out);
SHRA ShifterArithmetic (A, B, Shra_out);
SHL ShifterL (A, B, Shl_out);
ROR RoR (A, B, Ror_out);
ROL RoL (A, B, Rol_out);
NEG Negater (A, Neg_out);
NOT_32 Notter (A, Not_out);

always @ (*) begin
		case (ALU_ctl)
			Addition, Add_imm, Load, Load_imm, Store, Branch: begin
				Zltemp <= Adder_out;
				Zhtemp <= {31'b0, Adder_cout};
			end
			Subtraction: begin
				Zltemp <= Subtracter_out;
				Zhtemp <= {31'b0, Subtracter_cout};
			end
			ShiftR: begin
				Zltemp <= Shr_out;
				Zhtemp <= 32'b0;
			end
			ShiftL: begin
				Zltemp <= Shl_out;
				Zhtemp <= 32'b0;
			end
			ROR: begin
				Zltemp <= Ror_out;
				Zhtemp <= 32'b0;
			end
			ROL: begin
				Zltemp <= Rol_out;
				Zhtemp <= 32'b0;
			end
			AND, AND_imm: begin
				Zltemp <= And_out;
				Zhtemp <= 32'b0;
			end
			OR, OR_imm: begin
				Zltemp <= Or_out;
				Zhtemp <= 32'b0;
			end
			Multiply: begin
				Zltemp <= Mult_out[31:0];
				Zhtemp <= Mult_out[63:32];
			end
			Divide: begin
				Zltemp <= Div_out;
				Zhtemp <= Div_rem;
			end
			Negate: begin
				Zltemp <= Neg_out;
				Zhtemp <= 32'b0;
			end
			NOT: begin
				Zltemp <= Not_out;
				Zhtemp <= 32'b0;
			end
			default: begin
				Zltemp <= Adder_out;
				Zhtemp <= 32'b0;
			end
			SHRA: begin
				Zltemp <= Shra_out;
				Zhtemp <= 32'b0;
			end
		endcase
		
		if (IncPC) begin
			Zltemp <= IncPC_out;
			Zhtemp <= 32'b0;
		end			
end
endmodule