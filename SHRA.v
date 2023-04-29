module SHRA (input [31:0] a, b, output [31:0] result);

	assign result = a >> b | {a[31], 31'b0};
	
endmodule
