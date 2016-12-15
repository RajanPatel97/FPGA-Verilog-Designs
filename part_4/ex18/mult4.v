//------------------------------
// Module name: allpass processor
// Function: Simply to pass input to output
// Creator:  Peter Cheung
// Version:  1.1
// Date:     24 Jan 2014
//------------------------------

module processor (sysclk, pulse, data_in, data_out);

	input			sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 		data_out;	// 10-bit output data
	input			pulse;
	
	wire			sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
	wire			full;
	wire			dout; 
	wire	[9:0]		q;	
	
	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
	// This part should include your own processing hardware 
	// ... that takes x to produce y
	// ... In this case, it is ALL PASS.
	FIFO				fifo1 (sysclk, y, dout && pulse, pulse, full,q);
	dflip				dflip1(sysclk, full, dout);
	
	assign y = x*4 - {q[9], q[9:1]}; 
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;
		
endmodule
	
