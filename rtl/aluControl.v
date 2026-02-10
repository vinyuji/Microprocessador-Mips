module aluControl (
    input  wire [2:0] funct,
    input  wire [3:0] AluOp,
    output wire [2:0] S
);

    assign S = (AluOp[3]) ? AluOp[2:0] : funct;

endmodule