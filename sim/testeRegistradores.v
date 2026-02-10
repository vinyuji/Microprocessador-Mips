`timescale 1ns/1ps

module testeRegistradores;

    reg         clk;
    reg         regWrite;
    reg  [2:0]  readReg1;
    reg  [2:0]  readReg2;
    reg  [2:0]  writeReg;
    reg  [15:0] writeData;
    wire [15:0] readData1;
    wire [15:0] readData2;

    registradores dut (
        .clk(clk),
        .regWrite(regWrite),
        .readReg1(readReg1),
        .readReg2(readReg2),
        .writeReg(writeReg),
        .writeData(writeData),
        .readData1(readData1),
        .readData2(readData2)
    );


    always #5 clk = ~clk;

    initial begin
        // Inicialização
        clk = 0;
        regWrite = 0;
        readReg1 = 0;
        readReg2 = 0;
        writeReg = 0;
        writeData = 0;

        $display("Tempo | Reg | Dado escrito | RD1 | RD2");
        $display("--------------------------------------");

        // =========================
        // Teste 1: escreve 5 em R1
        // =========================
        #10;
        regWrite  = 1;
        writeReg  = 3'd1;
        writeData = 16'd5;

        #10;
        regWrite = 0;
        readReg1 = 3'd1;
        readReg2 = 3'd0;

        #5;
        $display("%4t  | R1  | 5             | %d  | %d",
                 $time, readData1, readData2);

        // =========================
        // Teste 2: escreve 10 em R2
        // =========================
        #10;
        regWrite  = 1;
        writeReg  = 3'd2;
        writeData = 16'd10;

        #10;
        regWrite = 0;
        readReg1 = 3'd1;
        readReg2 = 3'd2;

        #5;
        $display("%4t  | R2  | 10            | %d  | %d",
                 $time, readData1, readData2);

        // =========================
        // Teste 3: tenta escrever em R0
        // =========================
        #10;
        regWrite  = 1;
        writeReg  = 3'd0;
        writeData = 16'd99;

        #10;
        regWrite = 0;
        readReg1 = 3'd0;
        readReg2 = 3'd1;

        #5;
        $display("%4t  | R0  | 99 (bloqueado)| %d  | %d",
                 $time, readData1, readData2);

        // =========================
        // Fim
        // =========================
        #20;
        $finish;
    end

endmodule
