module BCD (binary, Thousands, Hundreds, Tens, Ones);

	input [12:0] binary;
	output wire [3:0] Thousands;
	output wire [3:0] Hundreds;
	output wire [3:0] Tens;
	output wire [3:0] Ones;
	
	assign Ones = binary%10;
	assign Tens = (binary/10)%10;
	assign Hundreds = (binary/100)%10;
	assign Thousands = (binary/1000)%10;

endmodule