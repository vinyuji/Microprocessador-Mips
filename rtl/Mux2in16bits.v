module Mux2in16bits(
    input wire [15:0]a, 
    input wire [15:0]b,
    input wire select,
    output wire [15:0]r
);


assign r = select ? a : b;

endmodule