`timescale 1ns/1ns
module load_tb;

reg Clear;
reg PCout, Zlowout, Zhiout, MDRout, HIout, LOout;// add any other signals to see in your simulation
reg MARin, Zin, PCin, MDRin, IRin, Yin, HIin, LOin;
reg IncPC, Read, Write; 
reg Clock, CONin, Gra, Grb, Grc, Rin, Rout, BAout, Cout, InPortout;
wire [31:0] Busout, Zlow_out, Zhi_out, R1_out, R0_out;

Datapath DUT (Clock, Clear, Read, Write, HIin, LOin, PCin, IRin, Yin, Zin, MARin, MDRin, IncPC, Out_Portin, In_Portin,
					  HIout, LOout, Zhiout, Zlowout,	PCout, MDRout, Cout, InPortout,
					  Gra, Grb, Grc, BAout, Rin, Rout, CONin,
					  Busout, Zlow_out, Zhi_out, R1_out, R0_out);
		
always #10 Clock = ~Clock;

initial begin 
	 PCout<= 1; 
	 MARin <= 1; 
	 IncPC <= 1; 
	 Zin <= 1;
	 Zlowout <= 0;
	 Zhiout <= 0;
	 MDRout <= 0;
	 Cout <= 0;
	 Write <= 0;
	 HIout <= 0;
	 LOout <= 0;
	 InPortout <= 0;
	 #25 PCout <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
	 
	 #10
	 Read = 1;
	 Mdatain = 25;
	 MDRin = 1;
	 MDRout = 1;
	 #20
	 R1in = 1;
	 Read = 0;
	 MDRin = 0;
	 MDRout = 0;
	 Mdatain = 0;
	 #20
	 R1in = 0;
	 Read = 1;
	 Mdatain = 30;
	 MDRin = 1;
	 MDRout = 1;
	 #20
	 Yin = 1;
	 Read = 0;
	 MDRin = 0;
	 MDRout = 0;
	 Mdatain = 0;
	 R1out = 1;
	 IRout = 5'b00011;
	 #20
	 $stop;
	 /*11110 ADD 11001 = 110111*/
end
endmodule