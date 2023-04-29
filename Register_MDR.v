module Register_MDR (input clk, clr, enable, Read, input [31:0] Busout, Mdatain, output [31:0] q);

wire [31:0] MDMux_out;
assign MDMux_out = Read ? Mdatain : Busout;

Register32 MDRreg (.clk(clk), .clr(clr), .enable(enable), .d(MDMux_out), .q(q));

endmodule
