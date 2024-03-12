module dff(d,clk,q,qbar);
    input d;
    input clk;
    output q,qbar;
    reg q,qbar;
    
    always@(posedge clk)
    begin
    case(d)
        1'b0:
            q = 0;
        1'b1:
            q=1;
    endcase
    qbar = ~q;
    end 
endmodule

module test;
    reg d;
    reg clk;
    integer i;
    wire q,qbar;

    dff s(d,clk,q,qbar);
    initial 
    begin
    $display("sr flip flop");
    $monitor("%b %b \t %b %b",d,clk, q,qbar);
    $dumpfile("vcd/DFlipFlop.vcd");
    $dumpvars(1,test);

        d = 0;
        #10
        d = 1;
        #10

        d = 0;
        #10
        d = 1;
        #10
    $finish;
    end

    initial begin
        clk = 0;
        for(i=0;i<20;i=i+1)
            #1 clk = ~clk;
        end
         
endmodule
