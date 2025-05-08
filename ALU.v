module ALU(ALU_control, result, X, Y, Zero);

input wire [3:0] ALU_control;
input wire [31:0] X, Y;

output reg [31:0] result;
output Zero;

assign Zero = (result == 0); // Zero is true if result = 0

always@(*) begin
	case(ALU_control)
		4'b0000: result = X + Y;         //add
		4'b0001: result = X - Y;         //sub
		4'b0010: result = X * Y;         //mult
		4'b0011: result = X / Y;         //div
		4'b0100: result = X & Y;         //and
		4'b0101: result = X | Y;         //or
		4'b0110: result = ~(X | Y);      //nor
		4'b0111: result = X < Y ? 1 : 0; // slt e slti
		default: result = 0;
	endcase
end

endmodule