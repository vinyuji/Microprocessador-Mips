module TesteMux8in16bits;
    reg [15:0] a;
    reg [15:0] b;
    reg [15:0] c;
    reg [15:0] d;
    reg [15:0] e;
    reg [15:0] f;
    reg [15:0] g;
    reg [15:0] h;
    reg [2:0] select; 
    wire [15:0] r;

    Mux8in16bits dut(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h),
        .select(select),
        .r(r)
    );

    initial begin
        a = 16'h1234;
        b = 16'h2345;
        c = 16'h3456;
        d = 16'h4567;
        e = 16'h5678;
        f = 16'h6789;
        g = 16'h7890;
        h = 16'h8901;


        select = 3'b000;
        #10;
        $display("select = 0 --> r = %h", r);

        select = 3'b001;
        #10; 
        $display("select = 1 --> r = %h", r);

        select = 3'b010;
        #10;
        $display("select = 2 --> r = %h", r);


        select = 3'b011;
        #10;
        $display("select = 3 --> r = %h", r);


        select = 3'b100;
        #10;
        $display("select = 4 --> r = %h", r);

        select = 3'b101;
        #10;
        $display("select = 5 --> r = %h", r);


        select = 3'b110;
        #10;
        $display("select = 6 --> r = %h", r);


        select = 3'b111;
        #10;
        $display("select = 7 --> r = %h", r);
        $finish; 
    end


endmodule