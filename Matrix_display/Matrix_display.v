	module Matrix_display(clock50MHz, run, reset, row, column, frame);
		input run; 
		input reset; 
		input clock50MHz;
		output reg [7:0] row,column; 
		
		 wire  row_clock;
		 wire frame_clock;

		output reg [3:0] frame;
		wire [7:0] temp;

		 reg [2:0] count1;
	
		clock_divider #(50000) row_clock_gen(clock50MHz, row_clock);		
		clock_divider #(4000000) frame_clock_gen(clock50MHz, frame_clock);
		
		display_rom c0(frame,count1, temp);
		
		// clock
		//reg [25:0] count = 0;
	
			//always@(posedge clock50MHz)begin
		//		count = count + 1; 
		//		if(count == 50000) begin
		//				count <= 0;
		//				row_clock <= ~row_clock;
		//		end
		//	end
			
				
		//reg [25:0] count2 = 0;
	
		//	always@(posedge clock50MHz)begin
		//		count2 = count2 + 1; 
			//	if(count2 == 4000000) begin
		//				count2 <= 0;
		//				frame_clock <= ~frame_clock;
		//		end
		//	end
			
			
		always @(posedge frame_clock) begin
				if( run == 1)
					begin
					
						if(frame == 4'b1111 || reset==0) 
						begin
							frame  = 4'b0000;		
						end
						else
						frame = frame + 4'b0001;
					end
				else if(reset==0)
					frame  = 4'b0000;	
		end
		
			
		always @(posedge row_clock)
	
		begin
			if(count1 == 3'b111)
				count1  = 3'b000;		
			else
				count1 = count1 + 3'b001;
			
		end
		
	
		always @(count1,temp)
		begin
			case (count1)
				3'b000: begin row = 8'b11111110;column = temp;  end
				3'b001: begin row = 8'b11111101;column = temp;  end
				3'b010: begin row = 8'b11111011;column = temp;  end 
				3'b011: begin row = 8'b11110111;column = temp;  end
				3'b100: begin row = 8'b11101111;column = temp;  end
				3'b101: begin row = 8'b11011111;column = temp;  end
				3'b110: begin row = 8'b10111111;column = temp;  end
				3'b111: begin row = 8'b01111111;column = temp;  end
			endcase 
		end
	endmodule
	
	
	
module display_rom(frame, address, data_out);
	input [2:0] address;
	output [7:0] data_out;
	reg [7:0] data_out;
	input [3:0] frame;
	
	always @ (address,frame)
	begin
	if(frame == 4'b0000)
		begin
		case (address)
						
			3'b000: data_out = 8'b11111111;
			3'b001: data_out = 8'b10000000;
			3'b010: data_out = 8'b10000000;
			3'b011: data_out = 8'b10000000;
			3'b100: data_out = 8'b10000000;
			3'b101: data_out = 8'b10000000;
			3'b110: data_out = 8'b10000000;
			3'b111: data_out = 8'b11111111;
		endcase
	end
	else if(frame == 4'b0001)
		begin
			case(address)
			
				3'b000: data_out = 8'b11111100;
				3'b001: data_out = 8'b00000000;
				3'b010: data_out = 8'b00000000;
				3'b011: data_out = 8'b00000000;
				3'b100: data_out = 8'b00000000;
				3'b101: data_out = 8'b00000000;
				3'b110: data_out = 8'b00000000;
				3'b111: data_out = 8'b11111100;
			endcase
		end	
		
		else if(frame == 4'b0010)
		begin
			case(address)
			
				3'b000: data_out = 8'b11110011;
				3'b001: data_out = 8'b00000010;
				3'b010: data_out = 8'b00000010;
				3'b011: data_out = 8'b00000011;
				3'b100: data_out = 8'b00000000;
				3'b101: data_out = 8'b00000000;
				3'b110: data_out = 8'b00000000;
				3'b111: data_out = 8'b11110011;
			endcase
		end	
		
		else if(frame == 4'b0011)
		begin
			case(address)
			
				3'b000: data_out = 8'b11001111;
				3'b001: data_out = 8'b00001000;
				3'b010: data_out = 8'b00001000;
				3'b011: data_out = 8'b00001111;
				3'b100: data_out = 8'b00000000;
				3'b101: data_out = 8'b00000000;
				3'b110: data_out = 8'b00000000;
				3'b111: data_out = 8'b11001111;
			endcase
		end
				else if(frame == 4'b0100)
		begin
			case(address)
			
				
				3'b000: data_out = 8'b00111111;
				3'b001: data_out = 8'b00100000;
				3'b010: data_out = 8'b00100000;
				3'b011: data_out = 8'b00111111;
				3'b100: data_out = 8'b00000000;
				3'b101: data_out = 8'b00000000;
				3'b110: data_out = 8'b00000000;
				3'b111: data_out = 8'b00111111;
			endcase
		end
		else if(frame == 4'b0101)
		begin
			case(address)
			
				3'b000: data_out = 8'b11111111;
				3'b001: data_out = 8'b10000000;
				3'b010: data_out = 8'b10000000;
				3'b011: data_out = 8'b11111111;
				3'b100: data_out = 8'b00000001;
				3'b101: data_out = 8'b00000001;
				3'b110: data_out = 8'b00000001;
				3'b111: data_out = 8'b11111111;
			endcase
		end
		else if(frame == 4'b0110)
		begin
			case(address)
			
				3'b000: data_out = 8'b11111100;
				3'b001: data_out = 8'b00000000;
				3'b010: data_out = 8'b00000000;
				3'b011: data_out = 8'b11111100;
				3'b100: data_out = 8'b00000100;
				3'b101: data_out = 8'b00000100;
				3'b110: data_out = 8'b00000100;
				3'b111: data_out = 8'b11111100;
			endcase
		end
		else if(frame == 4'b0111)
		begin
			case(address)
			
				
				3'b000: data_out = 8'b11110010;
				3'b001: data_out = 8'b00000010;
				3'b010: data_out = 8'b00000010;
				3'b011: data_out = 8'b11110010;
				3'b100: data_out = 8'b00010010;
				3'b101: data_out = 8'b00010010;
				3'b110: data_out = 8'b00010010;
				3'b111: data_out = 8'b11110011;
			endcase
		end
		else if(frame == 4'b1000)
		begin
			case(address)
			
				3'b000: data_out = 8'b11001000;
				3'b001: data_out = 8'b00001000;
				3'b010: data_out = 8'b00001000;
				3'b011: data_out = 8'b11001000;
				3'b100: data_out = 8'b01001000;
				3'b101: data_out = 8'b01001000;
				3'b110: data_out = 8'b01001000;
				3'b111: data_out = 8'b11001111;
			endcase
		end
		
		else if(frame == 4'b1001)
		begin
			case(address)
			
				3'b000: data_out = 8'b00100000;
				3'b001: data_out = 8'b00100000;
				3'b010: data_out = 8'b00100000;
				3'b011: data_out = 8'b00100000;
				3'b100: data_out = 8'b00100000;
				3'b101: data_out = 8'b00100000;
				3'b110: data_out = 8'b00100000;
				3'b111: data_out = 8'b00111111;
			endcase
		end
		
		else if(frame == 4'b1010)
		begin
			case(address)
			
				3'b000: data_out = 8'b10000001;
				3'b001: data_out = 8'b10000001;
				3'b010: data_out = 8'b10000001;
				3'b011: data_out = 8'b10000001;
				3'b100: data_out = 8'b10000001;
				3'b101: data_out = 8'b10000001;
				3'b110: data_out = 8'b10000001;
				3'b111: data_out = 8'b11111111;
			endcase
		end
		
		else if(frame == 4'b1011)
		begin
			case(address)
			
				3'b000: data_out = 8'b00000100;
				3'b001: data_out = 8'b00000100;
				3'b010: data_out = 8'b00000100;
				3'b011: data_out = 8'b00000100;
				3'b100: data_out = 8'b00000100;
				3'b101: data_out = 8'b00000100;
				3'b110: data_out = 8'b00000100;
				3'b111: data_out = 8'b11111100;
			endcase
		end
		else if(frame == 4'b1100)
		begin
			case(address)
			
				3'b000: data_out = 8'b00010011;
				3'b001: data_out = 8'b00010010;
				3'b010: data_out = 8'b00010010;
				3'b011: data_out = 8'b00010010;
				3'b100: data_out = 8'b00010010;
				3'b101: data_out = 8'b00010010;
				3'b110: data_out = 8'b00010010;
				3'b111: data_out = 8'b11110011;
			endcase
		end
		else if(frame == 4'b1101)
		begin
			case(address)
			
				3'b000: data_out = 8'b01001111;
				3'b001: data_out = 8'b01001000;
				3'b010: data_out = 8'b01001000;
				3'b011: data_out = 8'b01001000;
				3'b100: data_out = 8'b01001000;
				3'b101: data_out = 8'b01001000;
				3'b110: data_out = 8'b01001000;
				3'b111: data_out = 8'b11001111;
			endcase
		end
		else if(frame == 4'b1110)
		begin
			case(address)
			
				3'b000: data_out = 8'b00111111;
				3'b001: data_out = 8'b00100000;
				3'b010: data_out = 8'b00100000;
				3'b011: data_out = 8'b00100000;
				3'b100: data_out = 8'b00100000;
				3'b101: data_out = 8'b00100000;
				3'b110: data_out = 8'b00100000;
				3'b111: data_out = 8'b00111111;
			endcase
		end
		else if(frame == 4'b1111)
		begin
			case(address)
			
				3'b000: data_out = 8'b11111111;
				3'b001: data_out = 8'b10000000;
				3'b010: data_out = 8'b10000000;
				3'b011: data_out = 8'b10000000;
				3'b100: data_out = 8'b10000000;
				3'b101: data_out = 8'b10000000;
				3'b110: data_out = 8'b10000000;
				3'b111: data_out = 8'b11111111;
			endcase
		end
		
	end
endmodule


module clock_divider(
    input input_clock,
    output reg output_clock
    );

	parameter limit;	// used as the clock divider
	reg [25:0] count = 0;
	
	always@(posedge input_clock)begin
		count = count + 1; 
		if(count == limit) begin
				count <= 0;
				output_clock <= ~output_clock;
		end
	end
endmodule
