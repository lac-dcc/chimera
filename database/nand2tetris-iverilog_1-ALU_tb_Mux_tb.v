`default_nettype none
module Mux_tb();

    integer file;

    reg a   = 0;
    reg b   = 0;
    reg sel = 0;
    wire out;

    Mux Mux_1(
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    task display;
        #1 $fwrite(file, "|   %1b   |   %1b   |   %1b   |   %1b   |\n", a, b, sel, out);
    endtask

    initial begin
        $dumpfile("Mux_tb.vcd");
        $dumpvars(0, Mux_tb);
        file = $fopen("Mux.out","w");
        $fwrite(file, "|   a   |   b   |  sel  |  out  |\n");

        a = 0;
        display();

        sel = 1;
        display();

        sel = 0;
        b = 1;
        display();

        sel = 1;
        display();

        a = 1;
        b = 0;
        sel = 0;
        display();

        sel = 1;
        display();

        sel = 0;
        b = 1;
        display();

        sel = 1;
        display();

        $finish();    
    end

endmodule
