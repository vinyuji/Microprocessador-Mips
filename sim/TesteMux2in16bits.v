module testeMux2in16bits;
    reg [15:0] a;
    reg [15:0] b;
    reg select; 
    wire [15:0] r;

    Mux2in16bits dut(
        .a(a),
        .b(b),
        .select(select),
        .r(r)
    );

    initial begin
        a = 16'h0239;
        b = 16'h00e3;

        select = 1'b0;
        #10;
        $display("select = 0 --> r = %h", r);

        select = 1'b1;
        #10; 
        $display("select = 1 --> r = %h", r);
        $finish; 
    end


endmodule
