module mux32b_v2 (in1, in2, in3, control, result);

input wire [31:0] in1, in2, in3;
input wire [1:0] control; //MemToReg, Jump
output reg [31:0] result;

always @ (*)
begin
	case(control)
		2'b00: begin result = in1; end
		2'b01: begin result = in2; end
		2'b10: begin result = in3; end
	endcase
end

endmodule