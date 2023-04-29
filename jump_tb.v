`timescale 1ns/1ns
module jump_tb;

reg Clear;
reg PCout, Zlowout, Zhiout, MDRout, HIout, LOout;
reg MARin, Zin, PCin, MDRin, IRin, Yin, HIin, LOin, R15in;
reg IncPC, Read, Write; 
reg Clock, CONin, Gra, Grb, Grc, Rin, Rout, BAout, Cout, InPortout;
wire [31:0] Busout, Zlow_out, Zhi_out, R1_out, R0_out;
	
parameter	T0 = 4'b0000,
				T1 = 4'b0001,
				T2 = 4'b0010,
				T3 = 4'b0011,
				T4 = 4'b0100;
					
reg [3:0] Present_state = T0;
	
Datapath DUT (Clock, Clear, Read, Write, HIin, LOin, PCin, IRin, Yin, Zin, MARin, MDRin, IncPC, Out_Portin, In_Portin,
					  HIout, LOout, Zhiout, Zlowout,	PCout, MDRout, Cout, InPortout,
					  Gra, Grb, Grc, BAout, Rin, Rout, CONin, R15in,
					  Busout, Zlow_out, Zhi_out, R1_out, R0_out);
	
initial 
	begin
		Clock = 0;
		forever #10 Clock = ~ Clock;
	end
		
always @(posedge Clock)//finite state machine; if clock rising-edge
	begin
		case (Present_state)//#40 was added in week 5, this will cover later time delays
			T0				:	#40	Present_state = T1;
			T1				:	#40	Present_state = T2;
			T2				:	#40	Present_state = T3;
			T3				:	#40	Present_state = T4;
		endcase
	end
	
always @(Present_state)// do the required job in each state
	begin
		case (Present_state)              //assert the required signals in each clock cycle
			T0: begin			//see if you need to de-assertthese signals
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
			end
			T1: begin
				Zlowout<= 1; 
				PCin <= 1; 
				Read <= 1;
				MDRin <= 1; 
				#25 Zlowout <= 0; PCin <= 0; Read <= 0; MDRin <= 0;
			end
			T2: begin
				MDRout<= 1; 
				IRin <= 1;
				#25 MDRout <= 0; IRin <= 0;
			end
			T3: begin
				PCout <= 1;
				R15in <= 1; 
				#25 R15in <= 0; PCout <= 0;
			end
			T4: begin
				Rout <= 1;
				PCin <= 1;
				Gra <= 1;
				#25 Gra <= 0; PCin <= 0; Rout <= 0;
			end		
	endcase
end
endmodule