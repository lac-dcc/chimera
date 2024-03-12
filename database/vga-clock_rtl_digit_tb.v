`default_nettype none
module test;

    reg clk = 0;
    reg reset = 1;

    integer number = 0;
    integer x_block = 0;
    integer y_block = 0;
    initial begin
        $dumpfile("digit.vcd");
        $dumpvars(0,test);
        # 2
        reset = 0;
        for(number = 0; number < 11; number ++ ) begin
            # 2;
        end;
        for(x_block = 0; x_block < 23; x_block ++ ) begin
            # 2;
        end;
        for(y_block = 0; y_block < 5; y_block ++ ) begin
            # 2;
        end;
        $finish;
    end

    digit digit_0(.clk(clk), .number(number), .x_block(x_block), .y_block(y_block));
    always #1 clk = !clk;

endmodule

