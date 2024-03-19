`default_nettype none
module HalfAdder_tb();

    integer file;

    reg a   = 0;
    reg b   = 0;
    wire sum, carry;

    HalfAdder HalfAdder_1(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    task display;
        #1 $fwrite(file, "|   %1b   |   %1b   |   %1b   |   %1b   |\n", a, b, sum, carry);
    endtask

    initial begin
        $dumpfile("HalfAdder_tb.vcd");
        $dumpvars(0, HalfAdder_tb);
        file = $fopen("HalfAdder.out","w");
        $fwrite(file, "|   a   |   b   |  sum  | carry |\n");

        a = 0;
        display();

        b = 1;
        display();

        a = 1;
        b = 0;
        display();

        a = 1;
        b = 1;
        display();

        $finish();    
    end

endmodule
