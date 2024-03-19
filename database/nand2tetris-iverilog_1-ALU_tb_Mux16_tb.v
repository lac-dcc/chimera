`default_nettype none
module Mux16_tb();

    integer file;

    reg [15:0] a;
    reg [15:0] b;
    reg sel = 0;
    wire [15:0] out;

    Mux16 Mux16_1(
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    task display;
        #1 $fwrite(file, "| %1b | %1b |  %1b  | %1b |\n", a, b, sel, out);
    endtask

    initial begin
        $dumpfile("Mux16_tb.vcd");
        $dumpvars(0, Mux16_tb);
        file = $fopen("Mux16.out","w");
        $fwrite(file, "|        a         |        b         | sel |       out        |\n");

        a = 16'b0000000000000000;
        b = 16'b0000000000000000;
        display();

        sel = 1;
        display();

        sel = 0;
        b = 16'b0001001000110100;
        display();

        sel = 1;
        display();

        a = 16'b1001100001110110;
        b = 16'b0000000000000000;
        sel = 0;
        display();

        sel = 1;
        display();

        a = 16'b1010101010101010;
        b = 16'b0101010101010101;
        sel = 0;
        display();

        sel = 1;
        display();

        $finish();    
    end

endmodule
