module BusMux (input [31:0] BusMuxin_R0, BusMuxin_R1, BusMuxin_R2, BusMuxin_R3, BusMuxin_R4, BusMuxin_R5, BusMuxin_R6, BusMuxin_R7, 
									 BusMuxin_R8, BusMuxin_R9, BusMuxin_R10, BusMuxin_R11, BusMuxin_R12, BusMuxin_R13, BusMuxin_R14, BusMuxin_R15,
									 BusMuxin_HI, BusMuxin_LO, BusMuxin_ZHI, BusMuxin_ZLO, BusMuxin_PC, BusMuxin_MDR, BusMuxin_InPort, C_sign_extended,
									 input [4:0] select,
									 output [31:0] BusMuxout);
reg [31:0] mux_int;					 
always @ (BusMuxin_R0, BusMuxin_R1, BusMuxin_R2, BusMuxin_R3, BusMuxin_R4, BusMuxin_R5, BusMuxin_R6, BusMuxin_R7, 
			 BusMuxin_R8, BusMuxin_R9, BusMuxin_R10, BusMuxin_R11, BusMuxin_R12, BusMuxin_R13, BusMuxin_R14, BusMuxin_R15,
			 BusMuxin_HI, BusMuxin_LO, BusMuxin_ZHI, BusMuxin_ZLO, BusMuxin_PC, BusMuxin_MDR, BusMuxin_InPort, C_sign_extended, select)
	if(select == 0) mux_int = BusMuxin_R0; else
	if(select == 1) mux_int = BusMuxin_R1; else
	if(select == 2) mux_int = BusMuxin_R2; else
	if(select == 3) mux_int = BusMuxin_R3; else
	if(select == 4) mux_int = BusMuxin_R4; else
	if(select == 5) mux_int = BusMuxin_R5; else
	if(select == 6) mux_int = BusMuxin_R6; else
	if(select == 7) mux_int = BusMuxin_R7; else
	if(select == 8) mux_int = BusMuxin_R8; else
	if(select == 9) mux_int = BusMuxin_R9; else
	if(select == 10) mux_int = BusMuxin_R10; else
	if(select == 11) mux_int = BusMuxin_R11; else
	if(select == 12) mux_int = BusMuxin_R12; else
	if(select == 13) mux_int = BusMuxin_R13; else
	if(select == 14) mux_int = BusMuxin_R14; else
	if(select == 15) mux_int = BusMuxin_HI; else
	if(select == 17) mux_int = BusMuxin_LO; else
	if(select == 18) mux_int = BusMuxin_ZHI; else
	if(select == 19) mux_int = BusMuxin_ZLO; else
	if(select == 20) mux_int = BusMuxin_PC; else
	if(select == 21) mux_int = BusMuxin_MDR; else
	if(select == 22) mux_int = BusMuxin_InPort; else
	if(select == 23) mux_int = C_sign_extended; else mux_int = 32'bx;
assign BusMuxout = mux_int;
endmodule
	


	
	