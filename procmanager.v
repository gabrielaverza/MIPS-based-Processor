module procmanager (clk, reset, opcode, nextPC, newPC, inputLCD, stop, PCwrite, preemp, execStore, execLoad, currProc, prevProc, nextProc, counter,
proc1, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, proc10);

input clk, reset, PCwrite;
input [5:0] opcode;
input [31:0] nextPC;
input [31:0] proc1, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, proc10;

output reg [31:0] newPC;
output reg [15:0] inputLCD;

output reg stop, preemp;
output reg execStore, execLoad;

output reg [3:0] currProc, prevProc, nextProc;
output reg [4:0] counter;

reg initialized;
reg [9:0] procQueue, procQueue_temp; // inicia em 0, preenche com 1 se finalizado
reg [3:0] active_processes, active_processes_temp;
reg [31:0] StoreProc1, StoreProc2, StoreProc3, StoreProc4, StoreProc5, StoreProc6, StoreProc7, StoreProc8, StoreProc9, StoreProc10; // enderecos store
reg [31:0] LoadProc1, LoadProc2, LoadProc3, LoadProc4, LoadProc5, LoadProc6, LoadProc7, LoadProc8, LoadProc9, LoadProc10; // enderecos load
reg [31:0] PcProcSO, PcProcSOend, PcProc1, PcProc2, PcProc3, PcProc4, PcProc5, PcProc6, PcProc7, PcProc8, PcProc9, PcProc10; // PC prox instrucao

initial
begin
	newPC = 32'd0;
	currProc = 4'b0;
	prevProc = 4'd11; // nao existe, para saber que eh o inicio do SO
	nextProc = 4'b0;
		
	preemp = 1'b0; // 0 sem preempcao, 1 com preempcao
	
	procQueue = 10'b0000000000;
	active_processes = 4'd0;
	initialized = 1'b0;
		
	stop = 1'b0;
	counter = 5'd0;
		 
	PcProcSO = 32'd1250; //mainSO
	PcProcSOend = 32'd1035; // endMainSo
	PcProc1 = 32'd1;
	PcProc2 = 32'd101;
	PcProc3 = 32'd201;
	PcProc4 = 32'd301;
	PcProc5 = 32'd401;
	PcProc6 = 32'd501;
	PcProc7 = 32'd601;
	PcProc8 = 32'd701;
	PcProc9 = 32'd801;
	PcProc10 = 32'd901;
	
	StoreProc1 = 32'd1192;
	StoreProc2 = 32'd1196;
	StoreProc3 = 32'd1200;
	StoreProc4 = 32'd1204;
	StoreProc5 = 32'd1208;
	StoreProc6 = 32'd1212;
	StoreProc7 = 32'd1216;
	StoreProc8 = 32'd1220;
	StoreProc9 = 32'd1224;
	StoreProc10 = 32'd1228;
	
	LoadProc1 = 32'd1194;
	LoadProc2 = 32'd1198;
	LoadProc3 = 32'd1202;
	LoadProc4 = 32'd1206;
	LoadProc5 = 32'd1210;
	LoadProc6 = 32'd1214;
	LoadProc7 = 32'd1218;
	LoadProc8 = 32'd1222;
	LoadProc9 = 32'd1226;
	LoadProc10 = 32'd1230;
		
	execLoad = 1'b0;
	execStore = 1'b0;
end

// atualizar procQueue com base nas entradas proc1 a proc10
always @ (proc1, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, proc10)
begin
    integer i;
   
    if (proc1 == 0 && proc2 == 0 && proc3 == 0 && proc4 == 0 && proc5 == 0 && proc6 == 0 && proc7 == 0 && proc8 == 0 && proc9 == 0 && proc10 == 0) begin
        procQueue_temp = 10'b0000000000; // nenhum processo finalizado
        active_processes_temp = 4'd0;
    end
    else begin
        procQueue_temp = 10'b0000000000;
        
        // marca como finalizados (1) os processos que não estão na lista
        for (i = 1; i <= 10; i = i + 1) begin
            if (i != proc1 && i != proc2 && i != proc3 && i != proc4 && i != proc5 &&
                i != proc6 && i != proc7 && i != proc8 && i != proc9 && i != proc10) begin
                procQueue_temp[i-1] = 1'b1;
            end
        end
        
        active_processes_temp = 4'd0;
        for (i = 0; i < 10; i = i + 1) begin
            if (procQueue_temp[i] == 1'b0) active_processes_temp = active_processes_temp + 1;
        end
    end
end

always @ (negedge clk)
begin
	if (reset) begin
		inputLCD = 16'd0;
		newPC = 32'b0;
		currProc = 4'b0;
		prevProc = 4'd11;
		nextProc = 4'b0;
		preemp = 1'b0;
		stop = 1'b0;
		counter = 5'd0;
		execLoad = 1'b0;
		execStore = 1'b0;
		
		procQueue = 10'b0000000000;
		active_processes = 4'd0;
		initialized = 1'b0;
		
		PcProc1 = 32'd1;
		PcProc2 = 32'd101;
		PcProc3 = 32'd201;
		PcProc4 = 32'd301;
		PcProc5 = 32'd401;
		PcProc6 = 32'd501;
		PcProc7 = 32'd601;
		PcProc8 = 32'd701;
		PcProc9 = 32'd801;
		PcProc10 = 32'd901;
	end
	// fim do SO
	else begin
		if(!initialized) begin
			procQueue = procQueue_temp;
			active_processes = active_processes_temp;
		end
		
		if(opcode == 6'b010000) begin inputLCD = 16'd14; end 
		else begin
			// entrada
			if (opcode == 6'b000101 && PCwrite == 1'b0) begin inputLCD = 16'd11; end
			else if (opcode == 6'b000101 && PCwrite == 1'b1) begin newPC = nextPC; inputLCD = 16'd15; end
			
			// saida
			if (opcode == 6'b000110 && PCwrite == 1'b0) begin inputLCD = 16'd13; end
			else if (opcode == 6'b000110 && PCwrite == 1'b1) begin newPC = nextPC; inputLCD = 16'd15; end
			
			// fim processo
			if (opcode == 6'b111101 && PCwrite == 1'b0) begin inputLCD = 16'd16; end
			
			else if (PCwrite == 1'b1) begin
				// atualiza stop ao utilizar operador de reducao para verificar se todos os processos finalizaram
				stop = &procQueue;
				// se stop for 1, finaliza execucao do SO
				if (stop == 1'b1) begin inputLCD = 16'd14; newPC = PcProcSOend; end
				else begin
					// executa SO sem preempcao
					if (currProc == 4'd0 && opcode != 6'b111110 && opcode != 6'b111101 && execStore == 1'b0 && execLoad == 1'b0) begin preemp = 1'b0; newPC = nextPC; inputLCD = 16'd15; end
					
					// processo sem preempcao terminou, finaliza execucao SO
					else if (currProc == 4'd0 && opcode == 6'b111101 && prevProc == 4'd11) begin newPC = PcProcSOend; end
					
					// primeiro com preempcao, executa primeiro disponivel da fila
					else if (currProc == 4'd0 && opcode == 6'b111110 && prevProc == 4'd11) begin
						preemp = 1'b1; initialized = 1'b1;
						if (procQueue[0] == 1'b0) begin newPC = PcProc1; prevProc = 4'd0; currProc = 4'd1; inputLCD = 16'd1; end
						else if (procQueue[1] == 1'b0) begin newPC = PcProc2; prevProc = 4'd0; currProc = 4'd2; inputLCD = 16'd2; end							
						else if (procQueue[2] == 1'b0) begin newPC = PcProc3; prevProc = 4'd0; currProc = 4'd3; inputLCD = 16'd3; end								
						else if (procQueue[3] == 1'b0) begin newPC = PcProc4; prevProc = 4'd0; currProc = 4'd4; inputLCD = 16'd4; end								
						else if (procQueue[4] == 1'b0) begin newPC = PcProc5; prevProc = 4'd0; currProc = 4'd5; inputLCD = 16'd5; end								
						else if (procQueue[5] == 1'b0) begin newPC = PcProc6; prevProc = 4'd0; currProc = 4'd6; inputLCD = 16'd6; end
						else if (procQueue[6] == 1'b0) begin newPC = PcProc7; prevProc = 4'd0; currProc = 4'd7; inputLCD = 16'd7; end								
						else if (procQueue[7] == 1'b0) begin newPC = PcProc8; prevProc = 4'd0; currProc = 4'd8; inputLCD = 16'd8; end								
						else if (procQueue[8] == 1'b0) begin newPC = PcProc9; prevProc = 4'd0; currProc = 4'd9; inputLCD = 16'd9; end								
						else if (procQueue[9] == 1'b0) begin newPC = PcProc10; prevProc = 4'd0; currProc = 4'd10; inputLCD = 16'd10; end	
					end			
					
					// escolhe endereco pra fazer o store
					else if (currProc == 4'd0 && execStore == 1'b1 && execLoad == 1'b1) begin
						inputLCD = 16'd12; preemp = 1'b0; execLoad = 1'b0; counter = 5'b0;
								
						case(prevProc)
							4'd1: newPC = StoreProc1;
							4'd2: newPC = StoreProc2;
							4'd3: newPC = StoreProc3;
							4'd4: newPC = StoreProc4;
							4'd5: newPC = StoreProc5;
							4'd6: newPC = StoreProc6;
							4'd7: newPC = StoreProc7;
							4'd8: newPC = StoreProc8;
							4'd9: newPC = StoreProc9;
							4'd10: newPC = StoreProc10;
						endcase
					end
					
					// executando store, segue sem preempcao
					else if (currProc == 4'd0 && opcode != 6'b111110 && execStore == 1'b1 && execLoad == 1'b0) begin 
						inputLCD = 16'd12; preemp = 1'b0; newPC = nextPC;
					end
					
					// acabou o store, faz load
					else if (currProc == 4'd0 && opcode == 6'b111110 && execStore == 1'b1 && execLoad == 1'b0) begin 
						inputLCD = 16'd12; preemp = 1'b0; execStore = 1'b0; execLoad = 1'b1;
							
						// trocou o contexto, decide proximo processo (round robin)
						if (procQueue[0] == 1'b0 && prevProc != 4'd1) begin 
							newPC = LoadProc1; nextProc = 4'd1;
						end
						else if (procQueue[1] == 1'b0 && prevProc != 4'd2) begin 
							newPC = LoadProc2; nextProc = 4'd2;
						end
						else if (procQueue[2] == 1'b0 && prevProc != 4'd3) begin 
							newPC = LoadProc3; nextProc = 4'd3;
						end
						else if (procQueue[3] == 1'b0 && prevProc != 4'd4) begin 
							newPC = LoadProc4; nextProc = 4'd4;
						end
						else if (procQueue[4] == 1'b0 && prevProc != 4'd5) begin 
							newPC = LoadProc5; nextProc = 4'd5;
						end
						else if (procQueue[5] == 1'b0 && prevProc != 4'd6) begin 
							newPC = LoadProc6; nextProc = 4'd6;
						end
						else if (procQueue[6] == 1'b0 && prevProc != 4'd7) begin 
							newPC = LoadProc7; nextProc = 4'd7;
						end
						else if (procQueue[7] == 1'b0 && prevProc != 4'd8) begin 
							newPC = LoadProc8; nextProc = 4'd8;
						end
						else if (procQueue[8] == 1'b0 && prevProc != 4'd9) begin 
							newPC = LoadProc9; nextProc = 4'd9;
						end
						else if (procQueue[9] == 1'b0 && prevProc != 4'd10) begin 
							newPC = LoadProc10; nextProc = 4'd10;
						end
					end
					
					// executando load, segue sem preempcao
					else if (currProc == 4'd0 && opcode != 6'b111110 && execStore == 1'b0 && execLoad == 1'b1) begin
						inputLCD = 16'd12; preemp = 1'b0; newPC = nextPC;
					end
					
					// acabou load, executa proximo processo com preempcao
					else if (currProc == 4'd0 && opcode == 6'b111110 && execStore == 1'b0 && execLoad == 1'b1) begin
						execLoad = 1'b0; preemp = 1'b1; currProc = nextProc; prevProc = 4'b0;
									
						case(currProc)
							4'd1: begin newPC = PcProc1; inputLCD = 16'd1; end
							4'd2: begin newPC = PcProc2; inputLCD = 16'd2; end
							4'd3: begin newPC = PcProc3; inputLCD = 16'd3; end
							4'd4: begin newPC = PcProc4; inputLCD = 16'd4; end
							4'd5: begin newPC = PcProc5; inputLCD = 16'd5; end
							4'd6: begin newPC = PcProc6; inputLCD = 16'd6; end
							4'd7: begin newPC = PcProc7; inputLCD = 16'd7; end
							4'd8: begin newPC = PcProc8; inputLCD = 16'd8; end
							4'd9: begin newPC = PcProc9; inputLCD = 16'd9; end
							4'd10: begin newPC = PcProc10; inputLCD = 16'd10; end
						endcase
					end
					
					// processo com preempcao terminou antes de atingir o quantum, faz troca de contexto
					else if (currProc != 4'd0 && opcode == 6'b111101 && prevProc != 4'd11) begin
						counter = 5'b11111;
						case (currProc) 
							4'd1: begin procQueue[0] = 1'b1; inputLCD = 16'd1; end 
							4'd2: begin procQueue[1] = 1'b1; inputLCD = 16'd2; end
							4'd3: begin procQueue[2] = 1'b1; inputLCD = 16'd3; end 
							4'd4: begin procQueue[3] = 1'b1; inputLCD = 16'd4; end
							4'd5: begin procQueue[4] = 1'b1; inputLCD = 16'd5; end 
							4'd6: begin procQueue[5] = 1'b1; inputLCD = 16'd6; end
							4'd7: begin procQueue[6] = 1'b1; inputLCD = 16'd7; end 
							4'd8: begin procQueue[7] = 1'b1; inputLCD = 16'd8; end
							4'd9: begin procQueue[8] = 1'b1; inputLCD = 16'd9; end 
							4'd10: begin procQueue[9] = 1'b1; inputLCD = 16'd10; end
						endcase
						
//						// atualiza  a qtde de processos executando
						active_processes = 4'd0;
						if (procQueue[0] == 1'b0) active_processes = active_processes + 1;
						if (procQueue[1] == 1'b0) active_processes = active_processes + 1;
						if (procQueue[2] == 1'b0) active_processes = active_processes + 1;
						if (procQueue[3] == 1'b0) active_processes = active_processes + 1;
						if (procQueue[4] == 1'b0) active_processes = active_processes + 1;
						if (procQueue[5] == 1'b0) active_processes = active_processes + 1;
						if (procQueue[6] == 1'b0) active_processes = active_processes + 1;
						if (procQueue[7] == 1'b0) active_processes = active_processes + 1;
						if (procQueue[8] == 1'b0) active_processes = active_processes + 1;
						if (procQueue[9] == 1'b0) active_processes = active_processes + 1;
					end
					
					// processo com preempcao executando, salva endereco do proximo PC pro caso de troca de contexto
					else if(currProc != 4'd0 && opcode != 6'b111101) begin
						case(currProc)
							4'd1: begin PcProc1 = nextPC; newPC = nextPC; inputLCD = 16'd1; end
							4'd2: begin PcProc2 = nextPC; newPC = nextPC; inputLCD = 16'd2; end
							4'd3: begin PcProc3 = nextPC; newPC = nextPC; inputLCD = 16'd3; end
							4'd4: begin PcProc4 = nextPC; newPC = nextPC; inputLCD = 16'd4; end
							4'd5: begin PcProc5 = nextPC; newPC = nextPC; inputLCD = 16'd5; end
							4'd6: begin PcProc6 = nextPC; newPC = nextPC; inputLCD = 16'd6; end
							4'd7: begin PcProc7 = nextPC; newPC = nextPC; inputLCD = 16'd7; end
							4'd8: begin PcProc8 = nextPC; newPC = nextPC; inputLCD = 16'd8; end
							4'd9: begin PcProc9 = nextPC; newPC = nextPC; inputLCD = 16'd9; end
							4'd10: begin PcProc10 = nextPC; newPC = nextPC; inputLCD = 16'd10; end
						endcase
					end
					
					// trata quantum preempcao
					if (counter < 5'd10) begin 
						// so soma quando houver preempcao e mais de um processo executando
						if (preemp == 1'b1 && active_processes > 1) begin counter = counter + 1'd1; end		 
					end
					else begin
						counter = 5'd0; preemp = 1'b0; execStore = 1'b1; execLoad = 1'b1;
						prevProc = currProc; currProc = 4'd0; newPC = PcProcSO;
					end
				end
			end
		end
	end
end

endmodule