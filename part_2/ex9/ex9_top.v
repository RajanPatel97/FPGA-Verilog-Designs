module ex9_top(
CLOCK_50,
KEY,
HEX0,
HEX1,
HEX2,
HEX3,
HEX4,
LEDR
);

input		CLOCK_50; 
input		[3:0] KEY;
output	[9:0] LEDR;
output 	[6:0] HEX0,HEX1,HEX2,HEX3,HEX4;

wire		tick_ms, tick_hs, en_lfsr, start_delay, time_out;
wire		[13:0] prbs;
wire		[4:0]	BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;
wire		react;
wire		[13:0] count_time;

clk_tick50000  clk1(CLOCK_50,tick_ms);
clk_tick2500	clk2(CLOCK_50,tick_hs,tick_ms);
fsm 				fsm1(tick_ms,tick_hs,KEY[3],time_out,en_lfsr,start_delay, LEDR[9:0], react);
rcounter			rc1(tick_ms, react, count_time, KEY[0]);
lfsr6 			lfsr1(prbs, tick_ms, en_lfsr);
delay 			delay1(tick_ms,start_delay,prbs,time_out);
bin2bcd_16 		converter(count_time, BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
hex_to_7seg  	SEG0(HEX0,BCD_0);
hex_to_7seg  	SEG1(HEX1,BCD_1);
hex_to_7seg  	SEG2(HEX2,BCD_2);
hex_to_7seg  	SEG3(HEX3,BCD_3);
hex_to_7seg  	SEG4(HEX4,BCD_4);

endmodule 