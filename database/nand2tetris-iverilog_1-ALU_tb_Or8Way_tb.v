`default_nettype none
module Or8Way_tb();

    integer file;

    reg [7:0] in;
    wire out;

    Or8Way Or8Way_1(
        .in(in),
        .out(out)
    );

    task display;
        #1 $fwrite(file, "|  %1b  |  %1b  |\n", in, out);
    endtask

    initial begin
        $dumpfile("Or8Way_tb.vcd");
        $dumpvars(0, Or8Way_tb);
        file = $fopen("Or8Way.out","w");
        $fwrite(file, "|     in     | out |\n");

        in = 8'b00000000;
        display();

        in = 8'b11111111;
        display();

        in = 8'b00010000;
        display();

        in = 8'b00000001;
        display();

        in = 8'b00100110;
        display();

        $finish();    
    end

endmodule
