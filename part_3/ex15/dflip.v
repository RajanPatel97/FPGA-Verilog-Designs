module dflip(clock, in, out);

input		clock;
input 	[9:0] in;
output 	reg [9:0] out;

always @ (posedge clock)
begin
	
	out <= in + out;

	
end 

endmodule 