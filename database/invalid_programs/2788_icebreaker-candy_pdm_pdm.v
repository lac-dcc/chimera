// This program was cloned from: https://github.com/kbob/icebreaker-candy
// License: GNU General Public License v3.0

`default_nettype none
`timescale 1 ns / 100 ps


// Pretend we have a 4x8 LED panel.


module top_tb();

    reg reset;
    reg fast_clk, slow_clk;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, top_tb);
        fast_clk = 1;
        slow_clk = 1;
        reset = 1;
        #16 reset = 0;
        #400 $stop;
    end

    always
        #2 fast_clk = ~fast_clk;
    always
        #4 slow_clk = ~slow_clk;

    top uut (
        .slow_clk(slow_clk),
        .fast_clk(fast_clk),
        .reset(reset));

endmodule // top_tb


module top (
        input slow_clk,
        input fast_clk,
        input reset
    );

    wire       toggle30;
    wire [4:0] addr;
    wire       wren;
    wire       read_trigger;
    wire       write_trigger;

    sixty xixtee (
        .fast_clk(fast_clk),
        .reset(reset),
        .toggle30(toggle30),
        .read_trigger(read_trigger),
        .write_trigger(write_trigger),
        .spram_addr(addr),
        .spram_wren(wren)
    );

    thirty thertee (
        .slow_clk(slow_clk),
        .reset(reset),
        .toggle30(toggle30),
        .read_trigger(read_trigger),
        .write_trigger(write_trigger)
    );

endmodule // top


module sixty #(
        parameter     ROWS = 4,
        parameter     COLS = 8
    )(
        input         fast_clk,
        input         reset,
        input         toggle30,
        input         read_trigger,
        input         write_trigger,
        output [AH:0] spram_addr,
        output        spram_wren
    );

    localparam RB       = $clog2(ROWS); // row bits
    localparam CB       = $clog2(COLS);
    localparam AB       = RB + CB;      // address bits
    localparam RH       = RB - 1;       // row high bit
    localparam CH       = CB - 1;
    localparam AH       = AB - 1;

    wire phase;                 // 1 = writing, 0 = reading
    reg  tog30, prev_tog30;

    always @(posedge fast_clk)
        if (reset) begin
            prev_tog30 <= 1;
            tog30      <= 0;
        end
        else begin
            prev_tog30 <= tog30;
            tog30      <= toggle30;
        end
    assign phase        = tog30 ~^ prev_tog30;

    reg  [RH:0] rd_row;
    reg  [CB:0] rd_col;
    wire [AH:0] rd_addr;
    always @(posedge fast_clk)
        if (reset) begin
            rd_row     <= -1;
            rd_col     <= 1 << CB;
        end
        else if (~phase && read_trigger) begin
            rd_row     <= rd_row + 1;
            rd_col     <= 0;
        end
        else if (~phase && !rd_col[CB])
            rd_col     <= rd_col + 1;
    assign rd_addr      = {rd_row, rd_col[CH:0]};

    reg  [RH:0] wr_row;
    reg  [CB:0] wr_col;
    wire [AH:0] wr_addr;
    always @(posedge fast_clk)
        if (reset) begin
            wr_row     <= -1;
            wr_col     <= 1 << CB;
        end
        else if (phase && write_trigger) begin
            wr_row     <= wr_row + 1;
            wr_col     <= 0;
        end
        else if (phase && ~wr_col[CB])
            wr_col     <= wr_col + 1;
    assign wr_addr      = {wr_row, wr_col[CH:0]};

    assign spram_addr   = phase ? wr_addr : rd_addr;
    assign spram_wren   = phase & ~wr_col[CB];

endmodule // sixty


module thirty #(
        parameter DELAY = 3
    ) (
        input     slow_clk,
        input     reset,
        output    toggle30,
        output    read_trigger,
        output    write_trigger
    );

    reg        tog30_r;
    reg  [6:0] delay;
    reg        rdtrig_r;
    reg        wrtrig_r;

    assign toggle30 = tog30_r;
    assign read_trigger = rdtrig_r;
    assign write_trigger = wrtrig_r;

    always @(posedge slow_clk)
        if (reset) begin
            tog30_r <= 0;
            delay <= DELAY - 1;
            rdtrig_r <= 0;
            wrtrig_r <= 0;
        end
        else begin
            tog30_r <= ~tog30_r;
            if (delay)
                delay <= delay - 1;
            else
                delay <= 10;

            if (delay == 1)
                rdtrig_r <= 1;
            else
                rdtrig_r <= 0;

            if (delay == 9)
                wrtrig_r <= 1;
            else
                wrtrig_r <= 0;
        end

endmodule // thirty
