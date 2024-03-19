`default_nettype none
module And16_tb();

    integer file;

    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] out;

    And16 And16_1(
        .a(a),
        .b(b),
        .out(out)
      );

    task display;
        #1 $fwrite(file, "| %1b | %1b | %1b |\n", a, b, out);
    endtask

    initial begin
        $dumpfile("And16_tb.vcd");
        $dumpvars(0, And16_tb);
        file = $fopen("And16.out","w");
        $fwrite(file, "|        a         |        b         |       out        |\n");

        a = 16'b0000000000000000;
        b = 16'b0000000000000000;
        display();

        a = 16'b0000000000000000;
        b = 16'b1111111111111111;
        display();

        a = 16'b1111111111111111;
        b = 16'b1111111111111111;
        display();

        a = 16'b1010101010101010;
        b = 16'b0101010101010101;
        display();

        a = 16'b0011110011000011;
        b = 16'b0000111111110000;
        display();

        a = 16'b0001001000110100;
        b = 16'b1001100001110110;
        display();

        $finish();    
    end

endmodule
