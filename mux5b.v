module mux5b (rt, rd, regDst, rdst);

input wire [4:0] rt, rd;
input wire [1:0] regDst;
output reg [4:0] rdst;

always @ (*)
begin
	case(regDst)
	   2'b00: begin rdst <= rt; end
		2'b01: begin rdst <= rd; end
		2'b10: begin rdst <= 5'b11111; end
	endcase
end

endmodule