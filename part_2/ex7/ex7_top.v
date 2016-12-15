module ex7_top (
	KEY,
	HEX0,
	HEX1
);
		input		[3:0] KEY;
		output 	[6:0]	HEX0, HEX1;
		wire		[6:0] data_out;
		
		
		lfsr7				SHIFT1 (data_out, KEY[3]); 
		hex_to_7seg		SEG0 (HEX0, data_out[3:0]);
		hex_to_7seg		SEG1 (HEX1, data_out[6:4]);
		
endmodule 