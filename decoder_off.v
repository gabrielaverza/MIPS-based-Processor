module decoder_off(Out);

	output [0:6] Out;
	 
   assign {Out[0],Out[1],Out[2],Out[3],Out[4],Out[5],Out[6]} = 7'b1111111;
	
endmodule