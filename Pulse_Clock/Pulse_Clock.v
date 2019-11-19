module Pulse_Clock(clock, clk2,clk4,p1,p2,p3,p4,p23,enable,clear);

input clock,enable,clear;
output reg clk2,clk4;
output reg p1, p2, p3, p4, p23;
reg flag=0;

always @(negedge clock)
	begin
	case({enable,clear})
		2'b10:begin clk2=~clk2; flag=1; end
		default: begin clk2 = 0;flag=0; end
	endcase
	end
	
always @(posedge clk2)
	begin
	case({enable,clear})
		2'b10:clk4=~clk4;
		default: clk4 = 0;
		endcase
	end	

always @(enable,clear,clock,clk2,clk4)
	begin
		case({flag,enable,clear,clock,clk2})
			5'b11000: begin p1=0;p2=0;p3=1;p4=0;p23=1;  end
			5'b11001: begin p1=1;p2=0;p3=0;p4=0;p23=0;  end
			5'b11010: begin p1=0;p2=0;p3=0;p4=1;p23=0;  end
			5'b11011: begin p1=0;p2=1;p3=0;p4=0;p23=1;  end
			default: begin p1=0;p2=0;p3=0;p4=0;p23=0;  end
		
		endcase
	end


endmodule 