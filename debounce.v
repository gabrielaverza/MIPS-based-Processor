//fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog code for button debouncing on FPGA
// debouncing module without creating another clock domain
// by using clock enable signal

// Módulo de debounce usando clock enable
module debounce(
    input pb_1,
    input clk,    // Clock de 50MHz
    output pb_out
);
    wire slow_clk_en;
    wire Q1, Q2, Q2_bar, Q0;
    
    clock_enable u1(clk, slow_clk_en);
    my_dff_en d0(clk, slow_clk_en, pb_1, Q0);
    my_dff_en d1(clk, slow_clk_en, Q0, Q1);
    my_dff_en d2(clk, slow_clk_en, Q1, Q2);
    
    assign Q2_bar = ~Q2;
    assign pb_out = Q1 & Q2_bar;
endmodule

// Slow clock enable for debouncing button
module clock_enable(input Clk_5M, output slow_clk_en);
    reg [2:0] counter = 0; // Contador para 5 ciclos (0 a 4)
    always @(posedge Clk_5M)
    begin
        counter <= (counter >= 4) ? 0 : counter + 1; // Conta 5 ciclos 
    end
    assign slow_clk_en = (counter == 4) ? 1'b1 : 1'b0;
endmodule


// D-flip-flop with clock enable signal for debouncing module
module my_dff_en(
    input DFF_CLOCK,
    input clock_enable,
    input D,
    output reg Q = 0
);
    always @(posedge DFF_CLOCK) begin
        if(clock_enable == 1) 
            Q <= D;
    end
endmodule