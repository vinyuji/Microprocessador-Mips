module Ula (
    input  wire [15:0] a,
    input  wire [15:0] b,
    input  wire [2:0]  select,
    output reg  [15:0] aluResult,
    output wire Cout
);

    // fio para receber resultado do somador/subtrator
    wire [15:0] soma_sub;
    wire sub;

    // select 000 = soma | 001 = sub
    assign sub = (select == 3'b001);

    // instância do somador/subtrator
    SomadorSubtrator somador (
        .a(a),
        .b(b),
        .sub(sub),
        .s(soma_sub),
        .Cout(Cout)
    );

    always @(*) begin
        case (select)
            3'b000: aluResult = soma_sub;        // Soma
            3'b001: aluResult = soma_sub;        // Subtração
            3'b010: aluResult = a & b;           // AND
            3'b011: aluResult = a | b;           // OR
            3'b100: aluResult = ~(a & b);        // NAND
            3'b101: aluResult = ~(a | b);        // NOR
            3'b110: aluResult = a ^ b;           // XOR
            3'b111: aluResult = ~(Cout == 1'b0) ? 16'h0000 : 16'h0001;
            default: aluResult = 16'b0;
        endcase
    end

endmodule
