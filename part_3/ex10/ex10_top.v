module ex10_top (
SW,
CLOCK_50,
DAC_CS,
DAC_SDI,
DAC_LD,
DAC_SCK
);	
	input CLOCK_50;
	input [9:0] SW;
	output DAC_CS, DAC_SDI,DAC_LD, DAC_SCK;
	wire	tick;
	
	
	clk_tick		clockdivider(CLOCK_50, count, tick);
	spi2dac 		dac1(CLOCK_50, SW, tick, DAC_SDI,DAC_CS,DAC_SCK,DAC_LD);

	endmodule 