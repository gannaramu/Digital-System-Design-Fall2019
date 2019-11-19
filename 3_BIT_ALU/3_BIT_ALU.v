module 3_BIT_ALU
{
	Input[1:0] fun_sel; // Input for function selector
	Input[2:0] A,B; // 3-Bit Input for A and B
	Output[2:0] F; // Output of 4 bit assuming carry.
	Output [6:0] HEX),HEX1;
	
	always 
		begin
		case(fun_select)
			2’b00: F <= A+B; // Addition
			2’b01: F <= A-B; // Subtraction
			2’b10: F <= A^B; // A XOR B
			2’b11: F <= A<<1;  // Left Shift on A
		endcase
endmodule
