`timescale 1ns / 100ps

module clk_tick2500(
clock,
tick,
enable
);
parameter BIT_SZ=9;
input clock;
input	enable;
output tick;

reg [BIT_SZ-1:0] count;
reg tick; 

initial count=0;
initial tick = 0;

always @ (posedge clock)
	if (count == 500 && enable == 1'b1)
	begin
		tick = 1;
		count = 0;
	end
	else if (count != 500 && enable == 1'b1)
	begin
		count = count + 1'b1;
		tick = 0;
	end

endmodule 