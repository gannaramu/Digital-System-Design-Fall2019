module RAM_t_b_a(fun_select,A,B,HEX0,HEX2,HEX4);
	input[1:0] fun_select; // Input for function selector
	input[2:0] A,B; // 3-Bit Input for A and B
	//output[3:0] F; // Output of 4 bit assuming carry.
	reg[3:0] F;
//	reg[3:0] F1;
	output[13:0] HEX2,HEX4,HEX0;
	reg s;

	display dispA(A,HEX0);
	display dispB(B,HEX2);
	display dispF(F,HEX4,s);

	always @(*)
	begin
		case(fun_select)
			2'b00:begin F=A+B; s=1; end // Addition
			2'b01:begin F=A-B; s=0;end // Subtraction
			2'b10:begin F=A^B; s=1;end // A XOR B
			2'b11:begin F=A<<1; s=1;end  // Left Shift on A
		endcase
		end
endmodule

module display(In,Out,s);
	input [3:0] In;
	input s;
	output [13:0] Out;
	reg [13:0] Out;
	always @(*)
	begin
	if(s==1)
	begin
		case(In)
			4'b0000: Out=14'b11111111000000; //0
			4'b0001: Out=14'b11111111111001; //1
			4'b0010: Out=14'b11111110100100; //2
			4'b0011: Out=14'b11111110110000; //3
			4'b0100: Out=14'b11111110011001; //4
			4'b0101: Out=14'b11111110010010; //5
			4'b0110: Out=14'b11111110000010; //6
			4'b0111: Out=14'b11111111111000; //7  		   
			4'b1000: Out=14'b11111110000000; //8
			4'b1001: Out=14'b11111110011000;  //9
			4'b1010: Out=14'b11110011000000;  //10
			4'b1011: Out=14'b11110011111001;  //11
			4'b1100: Out=14'b11110010100100;  //12
			4'b1101: Out=14'b11110010110000;  //13
			4'b1110: Out=14'b11110010011001;  //14
			4'b1111: Out=14'b11110010010010;  //15

		endcase
	end
	else
	begin
		case(In)
			4'b0000: Out=14'b11111111000000; //0
			4'b0001: Out=14'b11111111111001; //1
			4'b0010: Out=14'b11111110100100; //2
			4'b0011: Out=14'b11111110110000; //3
			4'b0100: Out=14'b11111110011001; //4
			4'b0101: Out=14'b11111110010010; //5
			4'b0110: Out=14'b11111110000010; //6
			4'b0111: Out=14'b11111111111000; //7  		   
			4'b1000: Out=14'b01111111111000; //8
			4'b1001: Out=14'b01111111111000;  //9
			4'b1010: Out=14'b01111110000010;  //10
			4'b1011: Out=14'b01111110010010;  //11
			4'b1100: Out=14'b01111110011001;  //12
			4'b1101: Out=14'b01111110110000;  //13
			4'b1110: Out=14'b01111110100100;  //14
			4'b1111: Out=14'b01111111111001;  //15

		endcase
	end
	end
endmodule
