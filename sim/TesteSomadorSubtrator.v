module TesteSomadorSubtrator;
    reg [15:0]a; 
    reg [15:0]b;
    reg sub;
    wire [15:0]s;
    wire Cout;

    SomadorSubtrator dut(
        .a(a),
        .b(b),
        .sub(sub),
        .s(s),
        .Cout(Cout)
    );

    initial begin
        
        a = 16'hf101;
        b = 16'hf010; 

        sub = 1'b0;
        #10;
        $display("SOMA = %h | Cout = %b", s, Cout);

        // Subtração
        sub = 1'b1;
        #10;
        $display("SUB  = %h | Cout = %b", s, Cout);

        $finish;

    end
endmodule