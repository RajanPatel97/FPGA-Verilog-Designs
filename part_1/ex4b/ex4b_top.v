module ex4b_top (
SW,
HEX0,
HEX1,
HEX2,
HEX3,
HEX4
);

	input [9:0] SW;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	wire [3:0] BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;

	bin2bcd_16 CONVERTER({6'b0, SW[9:0]}, BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
	hex_to_7seg SEG0(HEX0, BCD_0);
	hex_to_7seg SEG1(HEX1, BCD_1);
	hex_to_7seg SEG2(HEX2, BCD_2);
	hex_to_7seg SEG3(HEX3, BCD_3);
	hex_to_7seg SEG4(HEX4, BCD_4);
	
endmodule 