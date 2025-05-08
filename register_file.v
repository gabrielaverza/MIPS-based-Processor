module register_file(readRegister1, readRegister2, writeRegister, writeData, regWrite, clk, readData1, readData2, rd);

input wire [4:0] readRegister1, readRegister2, writeRegister;
input [31:0] writeData;
input wire regWrite, clk;
output [31:0] readData1, readData2, rd;


reg [31:0] registers [31:0];

always@(posedge clk)
begin
	if(regWrite == 1)
	begin
		registers[writeRegister] = writeData;
	end
end

assign readData1 = registers[readRegister1];
assign readData2 = registers[readRegister2];
assign rd = registers[writeRegister];

endmodule