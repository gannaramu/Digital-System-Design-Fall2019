module Pyramid_Counter(clock,enable,clear,pulse1,pulse2,count);


input clock, enable, clear;
output reg [3:0] count;
reg [3:0] max = 4'b1111;
output reg pulse1;
output reg pulse2;
wire max_reached;
wire max_equal_0;

always @(posedge clock) begin
  if(clear) begin 
    count <= 4'b0000;
    max   <= 4'b1111;
  end
  else if (enable) begin
    if(pulse2) pulse2 <= 'b0;
    else if (max_equal_0) pulse2 <= 1'b1;
  
    if(pulse1) pulse1 <= 'b0;
    else if(max_reached) begin 
      count <= 4'b0000;
      if(max != 4'b0001) max <= max - 'b1;
      else max <= 4'b1111;
      pulse1 <= 'b1;
    end
    else count <= count + 'b1;
  end
end

assign max_reached = (count == max) ? 'b1 : 'b0;
assign max_equal_0 = ((count == max) && (max == 4'b0001)) ? 'b1 : 'b0;


endmodule