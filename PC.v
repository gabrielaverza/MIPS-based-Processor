module PC (nextPC, reset, program_counter, PCwrite);

input reset, PCwrite;
input [31:0] nextPC;
output [31:0] program_counter;

reg [31:0] curr_PC;

always @ (nextPC)
begin
	if (reset) curr_PC = 32'b0;
	else if (PCwrite) curr_PC = nextPC;
end

assign program_counter = curr_PC;

endmodule