// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// separate read/write clocks

module data_memory
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] read_addr, write_addr,
	input we, read_clock, write_clock,
	output reg [(DATA_WIDTH-1):0] q,
	output reg [(DATA_WIDTH-1):0] proc1,
	output reg [(DATA_WIDTH-1):0] proc2,
	output reg [(DATA_WIDTH-1):0] proc3,
	output reg [(DATA_WIDTH-1):0] proc4,
	output reg [(DATA_WIDTH-1):0] proc5,
	output reg [(DATA_WIDTH-1):0] proc6,
	output reg [(DATA_WIDTH-1):0] proc7,
	output reg [(DATA_WIDTH-1):0] proc8,
	output reg [(DATA_WIDTH-1):0] proc9,
	output reg [(DATA_WIDTH-1):0] proc10
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	
	always @ (negedge write_clock)
	begin
		// Write
		if (we) begin
			ram[write_addr] <= data;
		end
	end
	
	always @ (posedge read_clock)
	begin
		// Read 
		q <= ram[read_addr];
			
		// Atualizar saídas proc1 a proc10 com o conteúdo das posições ram[54] a ram[63]
		proc1 <= ram[54];
		proc2 <= ram[55];
		proc3 <= ram[56];
		proc4 <= ram[57];
		proc5 <= ram[58];
		proc6 <= ram[59];
		proc7 <= ram[60];
		proc8 <= ram[61];
		proc9 <= ram[62];
		proc10 <= ram[63];
	end
	
endmodule
	
/* divisão memoria de dados ram[0..734]

ram[0] a ram[63] - uso S0
ram[54] a ram[63] - processos preempcao

ram[64] a ram[95] - uso proc1
ram[96] a ram[127] - contexto proc1 

ram[128] a ram[159] - uso proc2
ram[160] a ram[191] - contexto proc2

ram[192] a ram[223] - uso proc3
ram[224] a ram[255] - contexto proc3

ram[256] a ram[287] - uso proc4
ram[288] a ram[319] - contexto proc4

ram[320] a ram[351] - uso proc5
ram[352] a ram[383] - contexto proc5

ram[384] a ram[415] - uso proc6
ram[416] a ram[447] - contexto proc6

ram[448] a ram[479] - uso proc7
ram[480] a ram[511] - contexto proc7

ram[512] a ram[543] - uso proc8
ram[544] a ram[575] - contexto proc8

ram[576] a ram[607] - uso proc9
ram[608] a ram[639] - contexto proc9

ram[640] a ram[671] - uso proc10
ram[672] a ram[703] - contexo proc10

*/