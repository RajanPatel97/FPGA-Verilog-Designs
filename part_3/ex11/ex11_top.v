module ex11_top (
SW,
CLOCK_50,
DAC_CS,
DAC_SDI,
DAC_LD,
DAC_SCK,
PWM_OUT
);	
	input CLOCK_50;
	input [9:0] SW;
	output DAC_CS, DAC_SDI,DAC_LD, DAC_SCK;
	output PWM_OUT;
	wire	tick;
	
	
	clk_tick		clockdivider(CLOCK_50, count, tick);
	spi2dac 		dac1(CLOCK_50, SW, tick, DAC_SDI,DAC_CS,DAC_SCK,DAC_LD);
	pwm			pwm1(CLOCK_50, SW, tick, PWM_OUT);

	endmodule 