module jkff(jk,clk,q,qbar);
    input [1:0] jk;
    input clk;
    output q,qbar;
    reg q,qbar;

    always@(negedge clk)
    begin
    case(jk)
        2'b00:
            q= q;

        2'b01:
            q= 0;

        2'b10:
            q=1;

        2'b11:
            q= ~q;
    endcase

    qbar = ~q;
    
    end 
endmodule

module test;
    reg [1:0] jk;
    reg clk;
    integer i;
    wire q,qbar;
    jkff j1(jk,clk,q,qbar);
    initial 
    begin
    $display("jk flip flop");
    $monitor("%b  %b %b \t %b %b",jk[1],jk[1],jk[0],clk,q,qbar);
    $dumpfile("vcd/JKFlipFlop.vcd");
    $dumpvars(1,test);

        jk = 2'b00;
        #10

        jk = 2'b01;
        #10

        jk = 2'b10;
        #10

        jk = 2'b11;
        #10
    $finish;
    end
    initial
    begin
        clk = 0;
        for(i=0;i<20;i=i+1)
            #5 clk = ~clk;
    end 
endmodule
