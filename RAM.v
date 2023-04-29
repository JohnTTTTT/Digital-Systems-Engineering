module RAM (input clk, write, input [8:0] addr, input [31:0] d, output reg [31:0] q);

reg [31:0] ram [511:0];

initial begin
	ram[0] <= 32'h08800002;
	ram[1] <= 32'h08080000;
	ram[2] <= 32'h01000068;
	ram[3] <= 32'h0917FFFC;
	ram[4] <= 32'h00900001;
	ram[5] <= 32'h09800069;
	ram[6] <= 32'h99980004;
	ram[7] <= 32'h09980002;
	ram[8] <= 32'h039FFFFD;
	ram[9] <= 32'hD0000000;
	ram[10] <= 32'h9B900002;
	ram[11] <= 32'h09000005;
	ram[12] <= 32'h09880002;
	ram[13] <= 32'h19918000;
	ram[14] <= 32'h63B80002;
	ram[15] <= 32'h8BB80000;
	ram[16] <= 32'h93B80000;
	ram[17] <= 32'h6BB8000F;
	ram[18] <= 32'h50880000;
	ram[19] <= 32'h7388001C;
	ram[20] <= 32'h43B80000;
	ram[21] <= 32'h39180000;
	ram[22] <= 32'h11000052;
	ram[23] <= 32'h59100000;
	ram[24] <= 32'h31180000;
	ram[25] <= 32'h28908000;
	ram[26] <= 32'h11880060;
	ram[27] <= 32'h21918000;
	ram[28] <= 32'h48900000;
	ram[29] <= 32'h0A000006;
	ram[30] <= 32'h0A800032;
	ram[31] <= 32'h7AA00000;
	ram[32] <= 32'hC3800000;
	ram[33] <= 32'hCB000000;
	ram[34] <= 32'h82A00000;
	ram[35] <= 32'h0C27FFFF;
	ram[36] <= 32'h0CAFFFED;
	ram[37] <= 32'h0D300000;
	ram[38] <= 32'h0DB80000;
	ram[39] <= 32'hAD000000;
	ram[40] <= 32'hD8000000;
	ram[300] <= 32'h1EC50000;
	ram[301] <= 32'h264D8000;
	ram[302] <= 32'h26EE0000;
	ram[303] <= 32'hA7800000;
	ram[104] <= 32'h55;
	ram[82] <= 32'h26;
	
	
end

always @ (posedge clk) begin
		if(!write) begin
			q = ram[addr];
		end else begin
			ram[addr] = d;
		end
	end
	
endmodule