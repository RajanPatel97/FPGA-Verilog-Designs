module ex13_top (
CLOCK_50,
DAC_CS,
DAC_SDI,
DAC_LD,
DAC_SCK,
PWM_OUT
);	
	input CLOCK_50;
	output DAC_CS, DAC_SDI,DAC_LD, DAC_SCK;
	output PWM_OUT;
	wire	tick;
	wire [9:0] A;
	wire [9:0] D;
	
	clk_tick		clockdivider(CLOCK_50, count, tick);
	counter_10  counter10(CLOCK_50,tick,A,0);
	ROM         rom1(A, tick, D);
	spi2dac 		dac1(CLOCK_50, D, tick, DAC_SDI,DAC_CS,DAC_SCK,DAC_LD);
	pwm			pwm1(CLOCK_50, D, tick, PWM_OUT);

	endmodule 