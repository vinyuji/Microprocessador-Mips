`timescale 1ns/1ps

module Cpu_tb;

    // Sinais de teste
    reg clk;
    reg reset;

    // Instancia a CPU
    Cpu uut (
        .clk(clk),
        .reset(reset)
    );

    // ===== GERAÇÃO DO CLOCK =====
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock de 10ns
    end

    // ===== SEQUÊNCIA DE TESTE =====
    initial begin
        $display("Iniciando simulação...");
        $dumpfile("cpu.vcd");   // Para GTKWave
        $dumpvars(0, Cpu_tb);

        // Reset inicial
        reset = 1;
        #20;

        reset = 0;

        // Deixa rodar por vários ciclos
        #500;

        $display("=================================");
        $display("Fibonacci(10) = %d", uut.reg_file.regs[4]);
        $display("=================================");
        $display("Finalizando simulação.");
        $finish;
    end

endmodule