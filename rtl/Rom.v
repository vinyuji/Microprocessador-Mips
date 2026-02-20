module Rom (
    input  wire [5:0]  addr,      // PC[7:0] (256 instruções)
    output wire [15:0] instr
);

    reg [15:0] memory [0:63];

    // Inicializa programa
    integer i;

    initial begin
        // Inicializa tudo com 0
        for (i = 0; i < 64; i = i + 1)
            memory[i] = 16'b0;

        // Depois carrega o programa
        $readmemb("program.mem", memory);
    end
    
    assign instr = memory[addr];

endmodule