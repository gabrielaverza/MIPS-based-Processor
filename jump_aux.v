module jump_aux (in26b, jumpAddress);

input [25:0] in26b;
output [31:0] jumpAddress;

assign jumpAddress = {6'b0, in26b};

endmodule