module testAluControl;

    reg  [2:0] funct;
    reg  [3:0] AluOp;
    wire [2:0] S;

    aluControl dut (
        .funct(funct),
        .AluOp(AluOp),
        .S(S)
    );

    initial begin
        $display("AluOp    funct   -> S");
        $monitor("%b   %b   -> %b", AluOp, funct, S);

        // Caso 1: AluOp[3] = 0 → usa funct
        funct = 3'b010;
        AluOp = 4'b0011;   // MSB = 0
        #10;

        funct = 3'b101;
        AluOp = 4'b0000;   // MSB = 0
        #10;

        // Caso 2: AluOp[3] = 1 → usa AluOp[2:0]
        funct = 3'b111;
        AluOp = 4'b1001;   // MSB = 1
        #10;

        funct = 3'b000;
        AluOp = 4'b1110;   // MSB = 1
        #10;

        $finish;
    end

endmodule
