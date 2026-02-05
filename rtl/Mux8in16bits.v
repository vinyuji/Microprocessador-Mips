module Mux8in16bits(
    input wire [15:0]a, 
    input wire [15:0]b,
    input wire [15:0]c,
    input wire [15:0]d,
    input wire [15:0]e,
    input wire [15:0]f,
    input wire [15:0]g,
    input wire [15:0]h,
    input wire [2:0]select,
    output wire [15:0]r
);


assign r = (select == 3'b000) ? a :
           (select == 3'b001) ? b :
           (select == 3'b010) ? c :
           (select == 3'b011) ? d :
           (select == 3'b100) ? e :
           (select == 3'b101) ? f :
           (select == 3'b110) ? g :
                                h;

endmodule