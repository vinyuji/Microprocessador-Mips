module SomadorSubtrator (
    input  wire [15:0] a,
    input  wire [15:0] b,
    input  wire        sub,  
    output reg  [15:0] s,
    output reg         Cout
);

    reg [16:0] temp;

    always @(*) begin
        case (sub)
            1'b0: begin
                temp = a + b;
                s    = temp[15:0];
                Cout = temp[16];   // carry-out
            end

            1'b1: begin
                temp = a - b;
                s    = temp[15:0];
                Cout = ~temp[16];  // borrow invertido
            end

            default: begin
                s    = 16'b0;
                Cout = 1'b0;
            end
        endcase
    end

endmodule
