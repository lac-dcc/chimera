`ifndef N_PIPE_STAGES
`define N_PIPE_STAGES 16
`endif

module testbench;

    localparam [4:0] n_pipe_stages = `N_PIPE_STAGES;

    reg         clock;
    reg         reset_n;
    reg  [31:0] x;
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

    reg [31:0] fifo [0 : n_pipe_stages - 1];
    integer fifo_next_index; initial fifo_next_index = 0;

    isqrt
    # (
        .n_pipe_stages (n_pipe_stages)
    )
    isqrt
    (
        .clock   ( clock   ),
        .reset_n ( reset_n ),
        .x       ( x       ),
        .y       ( y       )
    );

    task check (input [31:0] x, input [32:0] y);
    begin
        $display ("check sqrt (%d) = %d    %d <= %d < %d",
            x, y, y ** 2, x, (y + 1) ** 2);

        if (y ** 2 > x)
            $display ("Error! y ** 2 > x");

        if (x >= (y + 1) ** 2)
            $display ("Error! x >= (y + 1) ** 2");
    end
    endtask

    task test (input [31:0] i);
        reg [31:0] oldest_x_in_fifo;
    begin
        x <= i;

        oldest_x_in_fifo = fifo [fifo_next_index];
        fifo [fifo_next_index] = i;

        fifo_next_index = fifo_next_index + 1;

        if (fifo_next_index == n_pipe_stages)
            fifo_next_index = 0;

        @(posedge clock);

        $write ("current: x %d  |  ", x);
        check (oldest_x_in_fifo, y);
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
