module Pc (
    input  wire        clk,
    input  wire        reset,
    input  wire        halt,
    input  wire        branch,
    input  wire        zero,
    input  wire        jump,
    input  wire [5:0]  immBranch,
    input  wire [5:0]  jumpAddr,
    output reg  [5:0]  pc
);

    wire [5:0] pcMais1;
    wire [5:0] branchTrue;
    wire [5:0] pcAfterBranch;
    wire [5:0] nextPc;

    // Incremento normal
    assign pcMais1 = pc + 6'd1;

    // Branch destino
    assign branchTrue = pcMais1 + immBranch;

    // Decide branch
    assign pcAfterBranch = (branch & zero) ? branchTrue : pcMais1;

    // Jump tem prioridade maior
    assign nextPc = jump ? jumpAddr : pcAfterBranch;

    // Registrador do PC
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 6'd0;
        else if (!halt)
            pc <= nextPc;
    end

endmodule