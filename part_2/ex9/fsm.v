module fsm (
tick_ms,
tick_hs,
trigger,
time_out,
en_lfsr,
start_delay,
ledr,
react
);


input tick_ms, tick_hs, trigger, time_out;
output en_lfsr, start_delay;
output [9:0] ledr;
output reg react;


reg [3:0] state;
reg [9:0] ledr;
reg en_lfsr, start_delay;

initial state = 0;
initial react = 0;


always @(posedge tick_ms)
	case (state)
		0: 	if (trigger==1'b0)
							state <= 1;
		1:		if (tick_hs == 1)
							state <= 2;
		2:		if (tick_hs == 1)
							state <= 3;
		3:		if (tick_hs == 1)
							state <= 4;
		4:		if (tick_hs == 1)
							state <= 5;
		5:		if (tick_hs == 1)
							state <= 6;
		6:		if (tick_hs == 1)
							state <= 7;
		7:		if (tick_hs == 1)
							state <= 8;
		8:		if (tick_hs == 1)
							state <= 9;
		9:		if (tick_hs == 1)
							state <= 10;
		10:	if (time_out == 1)
							begin
							state <= 0;
							react <= 1; 
							end
		default:		;
	endcase 
	
always @ (*)
	case(state)
		
		0:		begin 
		en_lfsr <= 1'b0; start_delay <= 1'b0; ledr <= 10'b0000000000; 
		end
		
		1:		begin 
		en_lfsr <= 1'b1; start_delay <= 1'b0; ledr <= 10'b1000000000; 
		end
	
		2:		begin 
		en_lfsr <= 1'b1; start_delay <= 1'b0; ledr <= 10'b1100000000;	
		end
		
		3:		begin 
		en_lfsr <= 1'b1; start_delay <= 1'b0; ledr <= 10'b1110000000;	
		end
		
		4:		begin 
		en_lfsr <= 1'b1; start_delay <= 1'b0; ledr <= 10'b1111000000;	
		end
		
		5:		begin	
		en_lfsr <= 1'b1; start_delay <= 1'b0;	ledr <= 10'b1111100000;	
		end
		
		6:		begin	
		en_lfsr <= 1'b1; start_delay <= 1'b0; ledr <= 10'b1111110000;	
		end
		
		7:		begin 
		en_lfsr <= 1'b1; start_delay <= 1'b0; ledr <= 10'b1111111000;
		end
		
		8:		begin 
		en_lfsr <= 1'b1; start_delay <= 1'b0; ledr <= 10'b1111111100;	
		end
		
		9:		begin	
		en_lfsr <= 1'b0; start_delay <= 1'b0; ledr <= 10'b1111111110;
		end
		
		10:			begin
		en_lfsr <= 1'b0; start_delay <= 1'b1; ledr <= 10'b1111111111;
						end
		default: ;
	
endcase	
	
endmodule 