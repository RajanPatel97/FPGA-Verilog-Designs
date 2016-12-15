module lfsr7 (data_out, clk);

	output [6:0]	data_out;
	input		clk;
	
	reg[6:0]	sreg;
	
	initial sreg = 6'b1;

	always @ (posedge clk)
		sreg <= {sreg[6:0], sreg[5] ^ sreg[0]};
		
	assign data_out = sreg;

endmodule 
