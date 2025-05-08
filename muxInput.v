module muxInput (In, Out, inputFPGA, inputMUX, result, outputFPGA);

input wire In, Out;
input wire [16:0] inputFPGA;
input wire [31:0] inputMUX;
output reg [31:0] result, outputFPGA;

always @ (*)
begin
	case(In)
		1'b0: result = inputMUX;
		1'b1: result = {15'b0, inputFPGA};
	endcase

	case(Out)
		1'b0: outputFPGA = 32'd0;
		1'b1: 
			begin
				if(In) outputFPGA = {15'b0, inputFPGA};
				else outputFPGA = inputMUX;
			end
	endcase
end

endmodule