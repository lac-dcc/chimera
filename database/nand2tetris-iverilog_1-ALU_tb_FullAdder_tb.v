`default_nettype none
module FullAdder_tb();

    integer file;

    reg a   = 0;
    reg b   = 0;
    reg c   = 0;
    wire sum, carry;

    FullAdder FullAdder_1(
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry(carry)
    );

    task display;
        #1 $fwrite(file, "|   %1b   |   %1b   |   %1b   |   %1b   |   %1b   |\n", a, b, c, sum, carry);
    endtask

    initial begin
        $dumpfile("FullAdder_tb.vcd");
        $dumpvars(0, FullAdder_tb);
        file = $fopen("FullAdder.out","w");
        $fwrite(file, "|   a   |   b   |   c   |  sum  | carry |\n");

        a = 0;
        display();

        c = 1;
        display();

        c = 0;
        b = 1;
        display();

        c = 1;
        display();

        a = 1;
        b = 0;
        c = 0;
        display();

        c = 1;
        display();

        c = 0;
        b = 1;
        display();

        c = 1;
        display();

        $finish();     
    end

endmodule
