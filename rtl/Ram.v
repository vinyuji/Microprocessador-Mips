module Ram (
    input  wire        clk,
    input  wire        memRead,
    input  wire        memWrite,
    input  wire [7:0]  addr,
    input  wire [15:0] writeData,
    output reg  [15:0] readData
);

    reg [15:0] memory [0:255];

    // Escrita (SW)
    always @(posedge clk) begin
        if (memWrite)
            memory[addr] <= writeData;
    end

    // Leitura (LW)
    always @(*) begin
        if (memRead)
            readData = memory[addr];
        else
            readData = 16'b0;
    end

endmodule