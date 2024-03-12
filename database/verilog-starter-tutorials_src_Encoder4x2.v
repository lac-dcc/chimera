module enc(in,ou);
    input [3:0] in;
    output [1:0] ou;
    reg [1:0] ou;

    always@(*)
    begin
    case(in)
        4'b0001:
            ou = 2'b00;

	    4'b0010:
            ou = 2'b01;

        4'b0100:
            ou = 2'b10;

        4'b1000:
            ou = 2'b11;
    endcase
    end 
endmodule

module test;
    reg [3:0] inline;
    wire [1:0] oline;
    enc e(inline,oline);

    initial
    begin
    $display("input and output show");
    $monitor("%b,%b,%b,%b,%b,%b",inline[3],inline[2],inline[1],inline[0],oline[1],oline[0]);
    $dumpfile("vcd/Encoder.vcd");
    $dumpvars(1,test);

        inline=4'b0001;
        #10
        inline=4'b0010;
        #10
        inline = 4'b0100;
        #10
        inline = 4'b1000;
        #10

    $finish;
    end 
endmodule

