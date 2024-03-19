`default_nettype none
module Not_tb();

    integer file;

    reg a = 0;
    wire out;
    
    Not Not_1(
        .in(a),
        .out(out)
    );

    task display;
        #1 $fwrite(file, "|   %1b   |   %1b   |\n", a, out);
    endtask

    initial begin
        $dumpfile("Not_tb.vcd");
        $dumpvars(0, Not_tb);
        file = $fopen("Not.out","w");
        $fwrite(file, "|  in   |  out  |\n");

        a=0;
        display();

        a=1;
        display();

        $finish();    
    end

endmodule
