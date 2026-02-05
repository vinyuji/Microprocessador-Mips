module TesteUla;

    reg  [15:0] a;
    reg  [15:0] b;
    reg  [2:0]  select;
    wire [15:0] aluResult;
    wire Cout;

    // Instância da ULA
    Ula dut (
        .a(a),
        .b(b),
        .select(select),
        .aluResult(aluResult),
        .Cout(Cout)
    );

    initial begin
        $display("====================================");
        $display(" TESTE DA ULA ");
        $display("====================================");

        // ---------------- SOMA ----------------
        a = 16'd10; 
        b = 16'd5;
        select = 3'b000;
        #10;
        $display("SOMA: %d + %d = %d | Cout = %b", a, b, aluResult, Cout);

        // ---------------- SUBTRAÇÃO ----------------
        a = 16'd10;
        b = 16'd5;
        select = 3'b001;
        #10;
        $display("SUB: %d - %d = %d | Cout = %b", a, b, aluResult, Cout);

        // ---------------- AND ----------------
        a = 16'b1010;
        b = 16'b1100;
        select = 3'b010;
        #10;
        $display("AND: %b & %b = %b", a, b, aluResult);

        // ---------------- OR ----------------
        select = 3'b011;
        #10;
        $display("OR : %b | %b = %b", a, b, aluResult);

        // ---------------- NAND ----------------
        select = 3'b100;
        #10;
        $display("NAND: ~(a & b) = %b", aluResult);

        // ---------------- NOR ----------------
        select = 3'b101;
        #10;
        $display("NOR: ~(a | b) = %b", aluResult);

        // ---------------- XOR ----------------
        select = 3'b110;
        #10;
        $display("XOR: a ^ b = %b", aluResult);

        // ---------------- TESTE DO Cout (~Cout) ----------------
        a = 16'hFFFF;
        b = 16'h0001;
        select = 3'b000; // soma que gera carry
        #10;

        select = 3'b111;
        #10;
        $display("SET/FLAG (~Cout): Resultado = %h (esperado 0000)", aluResult);

        $display("====================================");
        $display(" TESTE FINALIZADO ");
        $display("====================================");

        $finish;
    end

endmodule