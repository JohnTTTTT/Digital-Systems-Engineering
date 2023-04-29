`timescale 1ns/10ps
module shra_tb;
	reg PCout, Zlowout, MDRout, HIout, LOout, Zhiout, InPortout, Cout;
	reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
	reg R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in;
 	reg MARin, Zin, PCin, MDRin, IRin, Yin, HIin, LOin;
 	reg IncPC, Read;
 	reg Clock, Clear;
  	reg [31:0] Mdatain;
	reg [4:0] IRout;
	wire [31:0] Busout;
	wire[31:0] R0_out;

Datapath DUT(.clk(Clock), .Clear(Clear), .Read(Read), .HIin(HIin), .LOin(LOin), .PCin(PCin), .IRin(IRin), .Yin(Yin), 
				 .Zin(Zin), .MARin(MARin), .MDRin(MDRin), .IncPC(IncPC), .HIout(HIout), .LOout(LOout), .Zhiout(Zhiout), 
				 .Zlowout(Zlowout), .PCout(PCout), .MDRout(MDRout), .InPortout(InPortout), .Cout(Cout), .R0in(R0in), .R1in(R1in), .R2in(R2in), .R3in(R3in), .R4in(R4in), .R5in(R5in), .R6in(R6in), .R7in(R7in), 
				 .R0out(R0out), .R1out(R1out), .R2out(R2out), .R3out(R3out), .R4out(R4out), .R5out(R5out), .R6out(R6out), .R7out(R7out), .R8out(R8out), .R9out(R9out), .R10out(R10out), .R11out(R11out), .R12out(R12out), .R13out(R13out), .R14out(R14out), .R15out(R15out), .Mdatain(Mdatain), .IRout(IRout), .Busout(Busout), 
				 .R0_out(R0_out));
always #10 Clock = ~Clock;

initial begin 
	 PCout = 0; 
	 Zlowout = 0;
	 MDRout = 0; 
	 HIout = 0; 
	 LOout = 0;
	 Zhiout = 0;
	 InPortout = 0;
	 Cout = 0;
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
	 R15out = 0;
	 R0in = 0;
	 R1in = 0;
	 R2in = 0;
	 R3in = 0;
	 R4in = 0;
	 R5in = 0;
	 R6in = 0;
	 R7in = 0;
 	 MARin = 0;
	 Zin = 0;
	 PCin = 0;
	 MDRin = 0;
	 IRin = 0;
	 Yin = 0;
	 HIin = 0;
	 LOin = 0;
 	 IncPC = 0;
	 Read = 0;
 	 Clock = 0;
	 Clear = 0;
  	 Mdatain = 0;
	 IRout = 0;
	 #10
	 Read = 1;
	 Mdatain = 1;
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
	 IRout = 5'b10010;
	 #20
	 $stop;
	 /*11110 SHRA 1 = 1111*/
end
endmodule