module mux(in1,in2,sel,out);
    input in1,in2,sel;
    output out;

    assign out = sel ? in2 : in1 ;

endmodule

module test;
    reg i1, i2, s;
    wire o;

    mux m1(i1,i2,s,o);

    initial begin
    $dumpfile("vcd/Mux.vcd");
    $dumpvars(0, test);
    $display("in1 \t in2 \t sel \t out");
    $monitor("%b \t %b \t %b \t %b", i1, i2, s, o);

        i1 = 0;
        i2 = 0;
        s = 0;
        #10

        i1 = 0;
        i2 = 0;
        s = 1;
        #10

        i1 = 0;
        i2 = 1;
        s = 0;
        #10

        i1 = 0;
        i2 = 1;
        s = 1;
        #10

        i1 = 1;
        i2 = 0;
        s = 0;
        #10

        i1 = 1;
        i2 = 0;
        s = 1;
        #10

        i1 = 1;
        i2 = 1;
        s = 0;
        #10

        i1 = 1;
        i2 = 1;
        s = 1;
        #10

    $finish;
    end
endmodule

