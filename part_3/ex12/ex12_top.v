module ex12_top(
	SW,
	CLOCK_50,
	HEX0,
	HEX1,
	HEX2
);

	input [9:0] SW;
	input CLOCK_50;
	output	[6:0]	HEX0, HEX1, HEX2;
	wire		[9:0] q;
	
	ROM 	ROM1(SW, CLOCK_50, q);
	hex_to_7seg SEG0(HEX0, q[3:0]);
	hex_to_7seg SEG1(HEX1, q[7:4]);
	hex_to_7seg SEG2(HEX2, q[9:8]);
	
endmodule 