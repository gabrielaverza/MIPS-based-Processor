module adder(X, Y, result);

input [31:0] X, Y;
output [31:0] result;

assign result = X + Y;

endmodule