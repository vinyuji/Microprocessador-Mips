module registradores (
    input  wire        clk,
    input  wire        reset,   
    input  wire        regWrite,
    input  wire [2:0]  readReg1,
    input  wire [2:0]  readReg2,
    input  wire [2:0]  writeReg,
    input  wire [15:0] writeData,
    output wire [15:0] readData1,
    output wire [15:0] readData2
);

    reg [15:0] regs [0:7];
    integer i;

    assign readData1 = (readReg1 == 3'd0) ? 16'b0 : regs[readReg1];
    assign readData2 = (readReg2 == 3'd0) ? 16'b0 : regs[readReg2];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                regs[i] <= 16'b0;
        end
        else if (regWrite && writeReg != 3'd0) begin
            regs[writeReg] <= writeData;
        end
    end

endmodule