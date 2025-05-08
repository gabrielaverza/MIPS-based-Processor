module InputFPGA (SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9, SW10, SW11, SW12, SW13, SW14, SW15, SW16, Data);

	input SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9, SW10, SW11, SW12, SW13, SW14, SW15, SW16;
	output reg [16:0] Data;
	
	
	always @(*)
	    begin
			Data[16] = SW16;
        	Data[15] = SW15;
        	Data[14] = SW14;
        	Data[13] = SW13;
        	Data[12] = SW12;
        	Data[11] = SW11;
        	Data[10] = SW10;
        	Data[9] = SW9;
        	Data[8] = SW8;
        	Data[7] = SW7;
        	Data[6] = SW6;
        	Data[5] = SW5;
        	Data[4] = SW4;
        	Data[3] = SW3;
        	Data[2] = SW2;
        	Data[1] = SW1;
        	Data[0] = SW0;
    	end

endmodule