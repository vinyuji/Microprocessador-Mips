module Mux2in3bits(
    input wire [2:0]a, 
    input wire [2:0]b,
    input wire select,
    output wire [2:0]r
);


assign r = select ? a : b;

endmodule