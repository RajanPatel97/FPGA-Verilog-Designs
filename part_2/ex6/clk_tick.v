`timescale 1ns / 100ps

module clk_tick (
clock,
tick
);
parameter BIT_SZ=16;
input clock;
output tick;

reg [BIT_SZ-1:0] count;
reg tick; 

initial count=0;
initial tick = 0;

always @ (posedge clock)
	if (count == 50000)
	begin
		tick = 1;
		count = 0;
	end
	else if (count != 50000)
	begin
		count = count + 1'b1;
		tick = 0;
	end

endmodule

