module Cpu (
    input wire clk,
    input wire reset
);

    // =====================
    // FIOS INTERNOS
    // =====================

    wire [5:0] pc;
    wire [15:0] instruction;

    wire regDst, jump, branch, memRead;
    wire memToReg, memWrite, aluSrc, regWrite, halt;
    wire [3:0] aluOp;

    wire [2:0] aluSelect;

    wire [15:0] readData1, readData2;
    wire [15:0] aluResult;
    wire [15:0] ramReadData;

    wire zero;
    assign zero = (aluResult == 16'b0);

    // =====================
    // PC
    // =====================

    Pc pc_unit (
        .clk(clk),
        .reset(reset),
        .halt(halt),        // 👈 mantém isso
        .branch(branch),
        .zero(zero),
        .jump(jump),
        .immBranch(instruction[5:0]),
        .jumpAddr(instruction[5:0]),
        .pc(pc)
    );

    // =====================
    // ROM
    // =====================

    Rom rom_unit (
        .addr(pc),
        .instr(instruction)
    );

    // =====================
    // CONTROL
    // =====================

    control control_unit (
        .opCode(instruction[15:12]),
        .regDst(regDst),
        .jump(jump),
        .branch(branch),
        .memRead(memRead),
        .memToReg(memToReg),
        .aluOp(aluOp),
        .memWrite(memWrite),
        .aluSrc(aluSrc),
        .regWrite(regWrite),
        .halt(halt)
    );

    // =====================
    // ALU CONTROL
    // =====================

    aluControl alu_ctrl (
        .funct(instruction[2:0]),
        .AluOp(aluOp),
        .S(aluSelect)
    );

    // =====================
    // REGISTER FILE
    // =====================

    wire [2:0] writeReg;

    assign writeReg = regDst ? instruction[5:3]
                             : instruction[8:6];

    wire [15:0] writeData;

    assign writeData = memToReg ? ramReadData
                                : aluResult;

    registradores reg_file (
        .clk(clk),
        .reset(reset),          // 🔥 ADICIONADO
        .regWrite(regWrite),
        .readReg1(instruction[11:9]),
        .readReg2(instruction[8:6]),
        .writeReg(writeReg),
        .writeData(writeData),
        .readData1(readData1),
        .readData2(readData2)
    );

    // =====================
    // ALU
    // =====================

    wire [15:0] aluB;

    // 🔥 EXTENSÃO DE SINAL PARA IMEDIATO 6 BITS
    wire [15:0] immExt;
    assign immExt = {{10{instruction[5]}}, instruction[5:0]};

    assign aluB = aluSrc ? immExt
                         : readData2;

    Ula alu_unit (
        .a(readData1),
        .b(aluB),
        .select(aluSelect),
        .aluResult(aluResult),
        .Cout()
    );

    // =====================
    // RAM
    // =====================

    Ram ram_unit (
        .clk(clk),
        .memRead(memRead),
        .memWrite(memWrite),
        .addr(aluResult[5:0]),
        .writeData(readData2),
        .readData(ramReadData)
    );

endmodule