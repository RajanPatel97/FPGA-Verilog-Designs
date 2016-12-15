module ex6_top (
	KEY,
	CLOCK_50,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4
);
		input	[1:0] KEY;
		input 	CLOCK_50;
		output 	[6:0]	HEX0, HEX1, HEX2, HEX3, HEX4;
		
		
		wire [15:0]	B;		// binary input number
		wire [3:0]	BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;   // BCD digit LSD to MSD
		wire 		tick;
		
		clk_tick		DIVIDE (CLOCK_50, count, tick);
		counter_16		COUNTER (CLOCK_50, ~KEY[0] && tick, B, ~KEY[1]);
		bin2bcd_16		CONVERTER (B, BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
		hex_to_7seg		SEG0 (HEX0, BCD_0);
		hex_to_7seg		SEG1 (HEX1, BCD_1);
		hex_to_7seg		SEG2 (HEX2, BCD_2);
		hex_to_7seg		SEG3 (HEX3, BCD_3);
		hex_to_7seg		SEG4 (HEX4, BCD_4);
				
endmodule
