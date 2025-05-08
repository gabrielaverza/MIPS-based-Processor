module mux32b (in1, in2, control, result);

input wire [31:0] in1, in2;
input wire control; //ALUSrc, MemToReg, etc
output reg [31:0] result;

always @ (*)
begin
	if(control) result = in2;
	else result = in1;
end

endmodule