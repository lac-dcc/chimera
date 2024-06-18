// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module testbench;

    reg         clock;
    reg         reset_n;
    reg         run;
    reg  [31:0] x;
    wire        ready;
    wire [15:0] y;

    initial
    begin
        clock = 1;

        forever
            # 50 clock = ! clock;
    end

    initial
    begin
        reset_n <= 0;
        repeat (20) @(posedge clock);
        reset_n <= 1;
    end

    isqrt isqrt
    (
        .clock   ( clock   ),
        .reset_n ( reset_n ),
        .run     ( run     ),
        .x       ( x       ),
        .ready   ( ready   ),
        .y       ( y       )
    );

    task check (input [31:0] x, input [32:0] y);
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
        x   <= i;
        run <= 1;

        @(posedge clock);

        run <= 0;

        @(posedge clock);

        while (! ready)
            @(posedge clock);

        check (x, y);
    end
    endtask

    integer i;

    initial
    begin
        $dumpvars;

        @(posedge reset_n);
        @(posedge clock);

        for (i = 0; i < 256; i = i + 1)
            test (i);

        for (i = 0; i < 256; i = i + 1)
            test ('hFFFF_FFFF - i);

        for (i = 0; i < 256; i = i + 1)
            test ($random);

        $finish;
    end

endmodule
