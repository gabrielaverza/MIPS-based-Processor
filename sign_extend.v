module sign_extend(extend, extended);

input [15:0] extend;
output [31:0] extended;

assign extended = {16'b0000000000000000, extend};

endmodule