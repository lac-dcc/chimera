module testbench;

    reg  [31:0] x;
    wire [15:0] y;

    isqrt isqrt (x, y);

    task check (input [31:0] x, input [32:0] y);  // Note that [32:0] is important to avoid overflow
    begin
        $display ("sqrt (%d) = %d    %d <= %d < %d",
            x, y, y ** 2, x, (y + 1) ** 2);

        if (y ** 2 > x)
            $display ("Error! y ** 2 > x");

        if (x >= (y + 1) ** 2)
            $display ("Error! x >= (y + 1) ** 2");
    end
    endtask

    task test (input [31:0] i);
    begin
        #1;
        x <= i;
        #1;
        check (x, y);
    end
    endtask

    integer i;

    initial
    begin
        $dumpvars;

        for (i = 0; i < 256; i = i + 1)
            test (i);

        for (i = 0; i < 256; i = i + 1)
            test ('hFFFF_FFFF - i);

        for (i = 0; i < 256; i = i + 1)
            test ($random);

        $finish;
    end

endmodule
