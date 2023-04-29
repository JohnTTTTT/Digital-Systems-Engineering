`timescale 1ns/1ns
module control_unit_tb;

reg	Clock, CU_clk, Reset, Stop;
wire	[31:0] Busout;
	
Datapath DUT (Clock, CU_clk, Reset, Stop, Busout);

initial
	begin
		#10
		Reset = 1;
		#10
		Reset = 0;
	end
	
initial 
	begin
		#20
		Clock = 0;
		forever #10 Clock = ~ Clock;
	end

initial
	begin
		#20
		CU_clk = 1;
		forever #20 CU_clk = ~ CU_clk;
	end

initial 
	begin
		#20
		Reset = 0;
		Stop = 0;
	end
	
endmodule

