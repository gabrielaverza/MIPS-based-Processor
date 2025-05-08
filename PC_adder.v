module PC_adder(X, result);

input wire [31:0] X;
output [31:0] result;

assign result = X + 32'b1;

endmodule