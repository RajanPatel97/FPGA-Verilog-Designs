module rcounter (
clock,
trigger,
count_time,
detect
);


input	clock, trigger, detect; 
output reg [13:0] count_time;

reg state;

initial state = 0;
initial count_time = 0;

always @(posedge clock)

	case(state)
	
	0:		if(trigger == 1 && detect == 1)
				count_time <= count_time + 1;
			else if(detect == 0)
				state <= 1;
	1:		count_time <= count_time;
				
				
	default: ;
	
	endcase
	
endmodule
 