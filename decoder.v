module decoder(In, Out);

    input [0:3]In;
    output [0:6]Out;
    reg [0:6] segments;
	 
    always @(*)
    begin
    case ({In[0],In[1],In[2],In[3]})
        4'b0000: segments = 7'b0000001;
        4'b0001: segments = 7'b1001111;
        4'b0010: segments = 7'b0010010;
        4'b0011: segments = 7'b0000110;
        4'b0100: segments = 7'b1001100;
        4'b0101: segments = 7'b0100100;
        4'b0110: segments = 7'b0100000;
        4'b0111: segments = 7'b0001111;
        4'b1000: segments = 7'b0000000;
        4'b1001: segments = 7'b0000100;
        default: segments = 7'b1111111;
    endcase
    end
	 
    assign {Out[0],Out[1],Out[2],Out[3],Out[4],Out[5],Out[6]} = segments;
endmodule