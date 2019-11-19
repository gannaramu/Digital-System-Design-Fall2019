module THREE_BIT_ALU(F,fun_select,A,B,HEX0,HEX2,HEX4);
	input[1:0] fun_select; // Input for function selector
	input[2:0] A,B; // 3-Bit Input for A and B
	output[3:0] F; // Output of 4 bit assuming carry.
	reg[3:0] F;
//	reg[3:0] F1;
	output[13:0] HEX2,HEX4,HEX0;
	reg s;

	DISP_7_SEG dispA(A,HEX0);
	DISP_7_SEG dispB(B,HEX2);
	DISP_7_SEG dispF(F,HEX4,s);

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

