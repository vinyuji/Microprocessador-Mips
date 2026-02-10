module control (
    input  wire [3:0] opCode,

    output reg  regDst,
    output reg  jump,
    output reg  branch,
    output reg  memRead,
    output reg  memToReg,
    output reg  [3:0] aluOp,
    output reg  memWrite,
    output reg  aluSrc,
    output reg  regWrite,
    output reg  halt
);

always @(*) begin
    // ===== DEFAULTS (SEM LATCH!) =====
    regDst   = 0;
    jump     = 0;
    branch   = 0;
    memRead  = 0;
    memToReg = 0;
    aluOp    = 4'b0000;
    memWrite = 0;
    aluSrc   = 0;
    regWrite = 0;
    halt     = 0;

    case (opCode)

        // ===== TIPO R =====
        4'b0000: begin
            regDst   = 1;
            regWrite = 1;
            aluOp    = 4'b0000;
        end

        // ===== LW =====
        4'b0001: begin
            memRead  = 1;   // 👈 SÓ AQUI
            memToReg = 1;
            aluSrc   = 1;
            regWrite = 1;
            aluOp    = 4'b1000;
        end

        // ===== BEQ =====
        4'b0010: begin
            branch = 1;
            aluOp  = 4'b1001;
        end

        // ===== ORi =====
        4'b0011: begin
            aluSrc   = 1;
            regWrite = 1;
            aluOp    = 4'b1011;
        end

        // ===== SW =====
        4'b0100: begin
            memWrite = 1;
            aluSrc   = 1;
            aluOp    = 4'b1000;
        end

        // ===== ANDi =====
        4'b0101: begin
            aluSrc   = 1;
            regWrite = 1;
            aluOp    = 4'b1010;
        end

        // ===== ADDi =====
        4'b0110: begin
            aluSrc   = 1;
            regWrite = 1;
            aluOp    = 4'b1000;
        end

        // ===== SLTi =====
        4'b0111: begin
            aluSrc   = 1;
            regWrite = 1;
            aluOp    = 4'b1111;
        end

        // ===== JUMP =====
        4'b1000: begin
            jump = 1;
        end

        // ===== HALT =====
        4'b1111: begin
            halt = 1;
        end

    endcase
end

endmodule
