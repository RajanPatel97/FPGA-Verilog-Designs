module ex14_top (
CLOCK_50,
DAC_CS,
DAC_SDI,
DAC_LD,
DAC_SCK,
PWM_OUT,
SW,
HEX0,
HEX1,
HEX2,
HEX3,
HEX4
);	
	input	[9:0] SW;
	input CLOCK_50;
	output DAC_CS, DAC_SDI,DAC_LD, DAC_SCK;
	output PWM_OUT;
	wire	tick;
	wire [9:0] A;
	wire [9:0] D;
	wire	[23:0] result;
	wire	[3:0]	BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;
	output	[6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	
	
	
	clk_tick		clockdivider(CLOCK_50, count, tick);
	mult		m1(result, SW, 14'd10000);
	dflip 		dflip1(tick, SW, A);
	ROM         rom1(A, tick, D);
	spi2dac 		dac1(CLOCK_50, D, tick, DAC_SDI,DAC_CS,DAC_SCK,DAC_LD);
	pwm			pwm1(CLOCK_50, D, tick, PWM_OUT);
	bin2bcd_16  converter(result[23:10], BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
	hex_to_7seg  SEG0(HEX0, BCD_0);
	hex_to_7seg  SEG1(HEX1, BCD_1);
	hex_to_7seg  SEG2(HEX2, BCD_2);
	hex_to_7seg  SEG3(HEX3, BCD_3);
	hex_to_7seg  SEG4(HEX4, BCD_4);
	

	endmodule 