module ex15_top (CLOCK_50,DAC_CS,DAC_SDI,DAC_LD,DAC_SCK,PWM_OUT,HEX0,HEX1,HEX2,
HEX3,HEX4,DAC_SDI, DAC_SCK, DAC_CS, DAC_LD,ADC_SDI, ADC_SCK, ADC_CS, ADC_SDO
);	
	input	 CLOCK_50;
	output 	DAC_CS, DAC_SDI,DAC_LD, DAC_SCK;
	output 	PWM_OUT;
	wire	tick;
	wire 	[9:0] A;
	wire 	[9:0] D;
	wire	[23:0] result;
	wire	[3:0]	BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;
	output	[6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	wire 	[9:0] 	data_in;		// converted data from ADC
	wire			data_valid;
	wire			DAC_SCK, ADC_SCK;
	output 		ADC_SDI;			//Serial data out to SDI of the ADC
	output 		ADC_SCK;		// ADC Clock signal
	output		ADC_CS;			//Chip select to the ADC, low active
	input 		ADC_SDO;			//Converted serial data from ADC	
	
	spi2adc SPI_ADC (												// perform a A-to-D conversion
		.sysclk (CLOCK_50), 										// order of parameters do not matter
		.channel (1'b0), 											// use only CH1
		.start (tick),
		.data_from_adc (data_in),
		.data_valid (data_valid),
		.sdata_to_adc (ADC_SDI),
		.adc_cs (ADC_CS),
		.adc_sck (ADC_SCK),
		.sdata_from_adc (ADC_SDO));
	
	clk_tick	clockdivider(CLOCK_50, count, tick);
	mult		m1(data_in, result);
	dflip 		dflip1(tick, data_in, A);
	ROM         rom1(A, tick, D);
	spi2dac dac1(CLOCK_50, D, tick, DAC_SDI,DAC_CS,DAC_SCK,DAC_LD);
	pwm	pwm1(CLOCK_50, D, tick, PWM_OUT);
	bin2bcd_16  converter(result[23:10], BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
	hex_to_7seg  SEG0(HEX0, BCD_0);
	hex_to_7seg  SEG1(HEX1, BCD_1);
	hex_to_7seg  SEG2(HEX2, BCD_2);
	hex_to_7seg  SEG3(HEX3, BCD_3);
	hex_to_7seg  SEG4(HEX4, BCD_4);
	
endmodule 
