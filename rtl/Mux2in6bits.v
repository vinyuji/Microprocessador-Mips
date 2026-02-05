module Mux2in6bits(
    input wire [5:0]a, 
    input wire [5:0]b,
    input wire select,
    output wire [5:0]r
);


assign r = select ? a : b;

endmodule