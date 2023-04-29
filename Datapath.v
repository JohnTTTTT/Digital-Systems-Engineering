module Datapath (input clk, CU_clk, Reset, Stop, 
					  output [31:0] Busout);
					  
wire Run, Read, Write, Clear;

wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
					  
wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;

wire CONout, HIout, LOout, Zhiout, Zlowout,	PCout, MDRout, Cout, InPortout;

wire Gra, Grb, Grc, BAout, Rin, Rout, CONin;

wire HIin, LOin, PCin, IRin, Yin, Zin, MARin, MDRin, IncPC, Out_Portin, In_Portin;
	  
wire [31:0] R0_out, R1_out, R2_out, R3_out, R4_out, R5_out, R6_out, R7_out,
				R8_out, R9_out, R10_out, R11_out, R12_out, R13_out, R14_out, R15_out;
				
wire [31:0] IR_out, PC_out, Zlow_out, Zhi_out, Y_out, HI_out, LO_out, MAR_out, MDR_out, Z_out, InPort_out, OutPort_out,
				C_out, MDMux_out, ALU_low, ALU_high;
				
wire [31:0] Mdatain;

wire [4:0] bus_select;

Register_R0 R0 (clk, Clear, R0in, BAout, Busout, R0_out);
Register32 R1 (clk, Clear, R1in, Busout, R1_out);
Register32 R2 (clk, Clear, R2in, Busout, R2_out);
Register32 R3 (clk, Clear, R3in, Busout, R3_out);
Register32 R4 (clk, Clear, R4in, Busout, R4_out);
Register32 R5 (clk, Clear, R5in, Busout, R5_out);
Register32 R6 (clk, Clear, R6in, Busout, R6_out);
Register32 R7 (clk, Clear, R7in, Busout, R7_out);
Register32 R8 (clk, Clear, R8in, Busout, R8_out);
Register32 R9 (clk, Clear, R9in, Busout, R9_out);
Register32 R10 (clk, Clear, R10in, Busout, R10_out);
Register32 R11 (clk, Clear, R11in, Busout, R11_out);
Register32 R12 (clk, Clear, R12in, Busout, R12_out);
Register32 R13 (clk, Clear, R13in, Busout, R13_out);
Register32 R14 (clk, Clear, R14in, Busout, R14_out);
Register32 R15 (clk, Clear, R15in, Busout, R15_out);

Register32 IR (clk, Clear, IRin, Busout, IR_out);
Register32 PC (clk, Clear, PCin, Busout, PC_out);
Register32 Zlow (clk, Clear, Zin, ALU_low, Zlow_out);
Register32 Zhigh (clk, Clear, Zin, ALU_high, Zhi_out);
Register32 Y (clk, Clear, Yin, Busout, Y_out);
Register32 HI (clk, Clear, HIin, Busout, HI_out);
Register32 LO (clk, Clear, LOin, Busout, LO_out);
Register32 MAR (clk, Clear, MARin, Busout, MAR_out);
Register_MDR MDR (clk, Clear, MDRin, Read, Busout, Mdatain, MDR_out);

BusMux BM (.BusMuxin_R0(R0_out), .BusMuxin_R1(R1_out), .BusMuxin_R2(R2_out), .BusMuxin_R3(R3_out),
			  .BusMuxin_R4(R4_out), .BusMuxin_R5(R5_out), .BusMuxin_R6(R6_out), .BusMuxin_R7(R7_out),
			  .BusMuxin_R8(R8_out), .BusMuxin_R9(R9_out), .BusMuxin_R10(R10_out), .BusMuxin_R11(R11_out),
			  .BusMuxin_R12(R12_out), .BusMuxin_R13(R13_out), .BusMuxin_R14(R14_out), .BusMuxin_R15(R15_out),
			  .BusMuxin_HI(HI_out), .BusMuxin_LO(LO_out), .BusMuxin_ZHI(Zhi_out), .BusMuxin_ZLO(Zlow_out),
			  .BusMuxin_PC(PC_out), .BusMuxin_MDR(MDR_out), .BusMuxin_InPort(InPort_out), .C_sign_extended(C_out),
			  .select(bus_select), .BusMuxout(Busout));
			  
Encoder BusEncoder (.Code(bus_select), .Data({8'b0, Cout, InPortout, MDRout, PCout, Zlowout, Zhiout, LOout, HIout, 
							R15out, R14out, R13out, R12out, R11out, R10out, R9out, R8out, R7out, R6out, R5out, R4out, R3out, R2out, R1out, R0out}));

ALU alu (Y_out, Busout, IR_out[31:27], IncPC, ALU_high, ALU_low);

RAM ram (clk, Write, MAR_out, MDR_out, Mdatain);

Select_Encode SE (Gra, Grb, Grc, Rin, Rout, BAout, IR_out, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
						R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in);
						
C_SignExtended CSE (IR_out, C_out);
						
CON_FF conff (CONin, Busout, IR_out[20:19], CON_out);

Out_Port op (clk, Clear, Out_Portin, Busout, OutPort_out);

In_Port #(10) ip (clk, Clear, 1'b0, Busout, InPort_out);

Control CU(Gra, Grb, Grc, Rin, Rout, R15in, HIin, LOin, CONin, PCin, IRin, Yin, Zin, MARin, MDRin, OutPortin, Cout, BAout,
			  PCout, MDRout, Zhiout, Zlowout, HIout, LOout, InPortout, IncPC, Read, Write, Clear, Run, IR_out, CU_clk, Reset, Stop, CON_out);

endmodule	