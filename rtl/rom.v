module Rom (
    input  wire [7:0]  addr,      // PC[7:0] (256 instruções)
    output wire [15:0] instr
);

    reg [15:0] memory [0:255];

    // Inicializa programa
    initial begin
        $readmemb("progam.mem", memory);
    end

    assign instr = memory[addr];

endmodule