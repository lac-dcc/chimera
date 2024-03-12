module dmux(in,s,o1,o2,o3,o4);
    input in;
    input [1:0]s;
    output o1,o2,o3,o4;
    reg o1,o2,o3,o4;
    always@(in,s)
    begin
    o1=0;o2=0;o3=0;o4=0;
    if(s==2'b00)
        o1 = in;
    else if(s==2'b01)
        o2 = in;
    else if(s==2'b10)
        o3 = in;
    else if(s==2'b11)
        o4 = in;
    end
endmodule


module test;
    reg in;
    reg [1:0]s;
    wire o1,o2,o3,o4;
    dmux d1(in,s,o1,o2,o3,o4);

    initial
    begin
    $dumpfile("vcd/DeMux.vcd");
    $dumpvars(0, test);
    $display("in \t s \t o1 \t o2 \t o3 \t o4");
    $monitor("%b \t %b \t %b \t %b \t %b \t %b", in, s, o1, o2, o3, o4);


        in = 0;
        s=2'b00;
        #10 s=2'b01;
        #10 s=2'b10;
        #10 s=2'b11;
        #10

        in = 1;
        s=2'b00;
        #10 s=2'b01;
        #10 s=2'b10;
        #10 s=2'b11;
        #10 

    $finish;
    end
    
endmodule
