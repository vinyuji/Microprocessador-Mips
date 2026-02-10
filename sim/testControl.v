`timescale 1ns/1ps

module testControl;

    reg  [3:0] opCode;

    wire regDst, jump, branch, memRead, memToReg;
    wire memWrite, aluSrc, regWrite, halt;
    wire [3:0] aluOp;

    control dut (
        .opCode(opCode),
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

    task show;
        begin
            $display(
              "op=%b | memRead=%b memWrite=%b memToReg=%b | regWrite=%b | aluOp=%b | jump=%b branch=%b halt=%b",
              opCode, memRead, memWrite, memToReg, regWrite, aluOp, jump, branch, halt
            );
        end
    endtask

    initial begin
        $display("===== TESTE DO CONTROL =====");

        opCode = 4'b0000; #10; show(); // R
        opCode = 4'b0001; #10; show(); // LW
        opCode = 4'b0010; #10; show(); // BEQ
        opCode = 4'b0011; #10; show(); // ORi
        opCode = 4'b0100; #10; show(); // SW
        opCode = 4'b0101; #10; show(); // ANDi
        opCode = 4'b0110; #10; show(); // ADDi
        opCode = 4'b0111; #10; show(); // SLTi
        opCode = 4'b1000; #10; show(); // JUMP
        opCode = 4'b1111; #10; show(); // HALT

        $finish;
    end

endmodule
