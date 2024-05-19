// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`timescale 1ns / 100ps
`default_nettype none

module scan_controller #(
    parameter integer NUM_DESIGNS = 498,
    parameter integer NUM_IOS     = 8,

    // auto-set
    parameter integer PL = NUM_IOS - 1
)(
    input  wire clk,
    input  wire reset,

    input  wire [8:0] active_select,    // which design is connected to the inputs and outputs
    input  wire [PL:0] inputs,           // inputs to the design (or external scan chain)
    input  wire set_clk_div,            // set clock divider. See module below
    output wire [PL:0] outputs,          // outputs from the design (or external scan chain)
    output wire ready,                  // debug output that goes high once per refresh
    output wire slow_clk,               // debug clock divider output

    output reg  scan_clk_out,           // scan chain interface for the tiny designs, from perspective of this module
    output reg  scan_data_out,          // see diagrams below for how the scan chain works
    input  wire scan_clk_in,            // feedback clock after having done the whole round
    input  wire scan_data_in,           // will be driven by internal driver, external gpio pins, or Caravel logic analyser
    output reg  scan_select,            // external scan chain driver muxes with ins/outs, eg microcontroller outside the ASIC
    output reg  scan_latch_en,

    input  wire la_scan_clk_in,         // logic analyser scan chain driver, driven by firmware running on Caravel's VexRisc
    input  wire la_scan_data_in,        // signal names from perspective of this module toward scan chain
    output wire la_scan_data_out,
    input  wire la_scan_select,
    input  wire la_scan_latch_en,

    input  wire [1:0] driver_sel,       // 00 = external, 01 = logic analyzer, 1x = internal

    output wire [`MPRJ_IO_PADS-1:0] oeb // caravel harness needs output enable bar set low to enable outputs
);

    // Signals
    // -------
    assign ready = active && state == ST_IDLE;

    // Reset
    reg  [2:0]  rst_shift;
    wire        rst_i;

    // Muxing
        // _in / _out are from the perspecitve of this module toward the scan
        // chain. So all _in are FROM the scan chain (and either input to this
        // module from there, or output from this module to LA / External)

    wire        ext_scan_clk_in;
    wire        ext_scan_data_in;
    wire        ext_scan_clk_out;
    wire        ext_scan_data_out;
    wire        ext_scan_select;
    wire        ext_scan_latch_en;

    wire        int_scan_clk_in;
    wire        int_scan_data_in;
    reg         int_scan_clk_out;
    reg         int_scan_data_out;
    reg         int_scan_select;
    reg         int_scan_latch_en;

    // FSM
    localparam [3:0]
        ST_IDLE             = 0,    // Idle
        ST_IN_LOAD          = 1,    // Capture input
        ST_IN_SHIFT_LO      = 2,    // Shift input to design: lo-clk
        ST_IN_SHIFT_HI      = 3,    // Shift input to design: hi-clk
        ST_IN_LATCH_WAIT    = 4,    // Wait before latching
        ST_IN_LATCH         = 5,    // Latch
        ST_OUT_LOAD_PRE     = 6,    // Prepare load
        ST_OUT_LOAD         = 7,    // Clock once to load
        ST_OUT_LOAD_POST    = 8,    // Wait for load to be done
        ST_OUT_LOAD_CLR     = 9,    // Restore chain to shift mode
        ST_OUT_SHIFT_LO     = 10,   // Shift output to us: lo-clk
        ST_OUT_SHIFT_HI     = 11,   // Shift output to us: hi-clk
        ST_OUT_CAP_WAIT     = 12,   // Wait for capture
        ST_OUT_CAP          = 13;   // Capture to out local register

    reg       active;

    reg [3:0] state;
    reg [3:0] state_nxt;

    // Scan progress
    reg [$clog2(NUM_IOS)-1:0] bit_cnt;
    wire                      bit_last;

    reg   [8:0] proj_cnt;
    wire        proj_sel;
    wire        proj_done;

    // Auto IO
    reg  [PL:0] aio_input_sync;
    reg  [PL:0] aio_input_reg;
    reg  [PL:0] aio_input_shift;

    reg  [PL:0] aio_output_shift;
    reg  [PL:0] aio_output_reg;

    wire        aio_input_sh;
    wire        aio_input_ld;
    wire        aio_output_cap;

    // Wait state config
    reg   [7:0] ws_cnt;
    wire        ws_cnt_done;
    wire        ws_cnt_run;

    // Wait state config
    reg  [2:0]  ws_set_sync;
    reg         ws_set_now;
    reg  [7:0]  ws_cfg;

    // Clock divider
    wire        slow_clk_ena;


    // Misc
    // ----

    // Generate internal ties for the IO blocks
    assign oeb = {`MPRJ_IO_PADS{1'b0}};

    `ifdef FORMAL
        `include "properties.v"
    `endif

    // Generate our own reset, with de-assertion
    // synchronized to clock
    always @(negedge clk or posedge reset)
        if (reset)
            rst_shift <= 3'b111;
        else
            rst_shift <= { rst_shift[1:0], 1'b0 };

    assign rst_i = rst_shift[2];


    // Scan chain and IO muxing
    // ------------------------

        // To ensure we get something working, the scan chain can be driven
        // three different ways. Automatic, from caravel LA and fully
        // externally (see driver_sel input)

    // External interface
    assign ext_scan_clk_out   = inputs[0];
    assign ext_scan_data_out  = inputs[1];
    assign ext_scan_select    = inputs[2];
    assign ext_scan_latch_en  = inputs[3];

    assign ext_scan_clk_in    = scan_clk_in;
    assign ext_scan_data_in   = scan_data_in;

    // Internal interface
    assign int_scan_clk_in    = scan_clk_in;
    assign int_scan_data_in   = scan_data_in;

    // LA interface
    assign la_scan_data_out   = scan_data_in;

    // Mux toward scan-schain
    always @(*)
    begin
        casez (driver_sel)
            // External
            2'b00: begin
                scan_clk_out  = ext_scan_clk_out;
                scan_data_out = ext_scan_data_out;
                scan_select   = ext_scan_select;
                scan_latch_en = ext_scan_latch_en;
            end

            // Caravel LA
            2'b01: begin
                scan_clk_out  = la_scan_clk_in;
                scan_data_out = la_scan_data_in;
                scan_select   = la_scan_select;
                scan_latch_en = la_scan_latch_en;
            end

            // Internal
            2'b1z: begin
                scan_clk_out  = int_scan_clk_out;
                scan_data_out = int_scan_data_out;
                scan_select   = int_scan_select;
                scan_latch_en = int_scan_latch_en;
            end
        endcase
    end

    // Synchronizer for inputs
    always @(posedge clk)
    begin
        aio_input_sync <= inputs;
        aio_input_reg  <= driver_sel[1] ? aio_input_sync : 0;
    end

    // Mux for outputs
    assign outputs = driver_sel[1] ? aio_output_reg : {6'b0, ext_scan_data_in, ext_scan_clk_in};


    // FSM & control
    // -------------

    // Check if we're active
    always @(posedge clk or posedge rst_i)
        if (rst_i)
            active <= 1'b0;
        else
            active <= driver_sel[1];

    // State register
    always @(posedge clk or posedge rst_i)
        if (rst_i)
            state <= ST_IDLE;
        else
            state <= state_nxt;

    // State transitions
    always @(*)
    begin
        // Defaults
        state_nxt = state;

        // Transitions
        case (state)
            ST_IDLE:
                if (active)
                    state_nxt = ST_IN_LOAD;

            ST_IN_LOAD:
                state_nxt = ST_IN_SHIFT_LO;

            ST_IN_SHIFT_LO:
                state_nxt = ST_IN_SHIFT_HI;

            ST_IN_SHIFT_HI:
                state_nxt = (proj_sel & bit_last) ? ST_IN_LATCH_WAIT : ST_IN_SHIFT_LO;

            ST_IN_LATCH_WAIT:
                if (ws_cnt_done)
                    state_nxt = ST_IN_LATCH;

            ST_IN_LATCH:
                state_nxt = ST_OUT_LOAD_PRE;

            ST_OUT_LOAD_PRE:
                if (ws_cnt_done)
                    state_nxt = ST_OUT_LOAD;

            ST_OUT_LOAD:
                state_nxt = ST_OUT_LOAD_POST;

            ST_OUT_LOAD_POST:
                if (ws_cnt_done)
                    state_nxt = ST_OUT_LOAD_CLR;

            ST_OUT_LOAD_CLR:
                if (ws_cnt_done)
                    state_nxt = ST_OUT_SHIFT_LO;

            ST_OUT_SHIFT_LO:
                state_nxt = ST_OUT_SHIFT_HI;

            ST_OUT_SHIFT_HI:
                state_nxt = (proj_done & bit_last) ? ST_OUT_CAP_WAIT : ST_OUT_SHIFT_LO;

            ST_OUT_CAP_WAIT:
                if (ws_cnt_done)
                    state_nxt = ST_OUT_CAP;

            ST_OUT_CAP:
                state_nxt = ST_IDLE;
        endcase
    end


    // Scan progress tracking
    // ----------------------

    // Keep track of IO number
    always @(posedge clk)
        if (state == ST_IDLE)
            bit_cnt <= 0;
        else if ((state == ST_IN_SHIFT_HI) | (state == ST_OUT_SHIFT_HI))
            bit_cnt <= bit_last ? 0 : (bit_cnt + 1);

    assign bit_last = (bit_cnt == (NUM_IOS - 1));

    // Keep track of project number
    always @(posedge clk)
        if (state == ST_IDLE)
            proj_cnt <= 0;
        else if (((state == ST_IN_SHIFT_HI) | (state == ST_OUT_SHIFT_HI)) & bit_last)
            proj_cnt <= proj_cnt + 1;

    assign proj_sel  = (proj_cnt == active_select);
    assign proj_done = (proj_cnt == NUM_DESIGNS);


    // Scan chain control
    // ------------------

    always @(posedge clk)
    begin
        int_scan_clk_out  <= (state == ST_IN_SHIFT_HI)  | (state == ST_OUT_LOAD) | (state == ST_OUT_SHIFT_HI);
        int_scan_data_out <= aio_input_shift[PL];
        int_scan_select   <= (state == ST_OUT_LOAD_PRE) | (state == ST_OUT_LOAD) | (state == ST_OUT_LOAD_POST);
        int_scan_latch_en <= (state == ST_IN_LATCH);
    end


    // Shift registers
    // ---------------

    // Local control from FSM
    assign aio_input_sh   = (state == ST_IN_SHIFT_HI);
    assign aio_input_ld   = (state == ST_IN_LOAD);
    assign aio_output_cap = (state == ST_OUT_CAP);

    // Input
    always @(posedge clk)
        if (aio_input_ld)
            aio_input_shift <= slow_clk_ena ? { aio_input_reg[PL:1], slow_clk } : aio_input_reg;
        else if (aio_input_sh)
            aio_input_shift <= { aio_input_shift[PL-1:0], 1'b0 };

    // Output
    always @(posedge int_scan_clk_in)
        aio_output_shift <= { aio_output_shift[PL-1:0], int_scan_data_in };

    always @(posedge clk)
        if (aio_output_cap)
            aio_output_reg <= aio_output_shift;


    // Wait state counter
    // ------------------

    always @(posedge clk)
        if (~ws_cnt_run | ws_cnt_done)
            ws_cnt <= 0;
        else
            ws_cnt <= ws_cnt + 1;

    assign ws_cnt_done = (ws_cnt == ws_cfg);

    assign ws_cnt_run = (
        (state == ST_IN_LATCH_WAIT) |
        (state == ST_OUT_LOAD_PRE) |
        (state == ST_OUT_LOAD_POST) |
        (state == ST_OUT_LOAD_CLR)  |
        (state == ST_OUT_CAP_WAIT)
    );


    // Wait state config
    // -----------------

        // This dictates how many wait cycle we insert in various state
        // of the load process. We have a sane default, but also allow
        // override externally.

    always @(posedge clk or posedge rst_i)
        if (rst_i)
            ws_set_sync <= 3'b000;
        else
            ws_set_sync <= { ws_set_sync[1:0], (driver_sel == 2'b11) };

    always @(posedge clk)
        ws_set_now <= ~ws_set_sync[2] & ws_set_sync[1];

    always @(posedge clk or posedge rst_i)
        if (rst_i)
            ws_cfg <= 8'd10;
        else if (ws_set_now)
            ws_cfg <= inputs;


    // Clock Divider
    // -------------

    clk_divider clk_divider_I (
        .clk      (clk),
        .ce       (aio_input_ld),
        .set      (set_clk_div),
        .reset    (rst_i),
        .divider  (inputs),
        .active   (slow_clk_ena),
        .slow_clk (slow_clk)
    );

endmodule // scan_controller


module clk_divider #(
    parameter integer DIV_WIDTH = 8
)(
    input  wire clk,
    input  wire ce,
    input  wire reset,
    input  wire set,
    input  wire [DIV_WIDTH-1:0] divider,
    output wire active,
    output reg  slow_clk
);

    reg [DIV_WIDTH-1:0] counter;
    reg [DIV_WIDTH-1:0] compare;
    wire                match;

    reg [2:0] set_sync;
    reg       set_now;

    // Detect rising edge (with synchronizer)
    always @(posedge clk)
    begin
        set_sync <= { set_sync[1:0], set };
        set_now  <= ~set_sync[2] & set_sync[1];
    end

    assign active = set_sync[2];

    // Latch divider
    always @(posedge clk)
        if (set_now)
            compare <= divider;

    // Compare
    assign match = (counter == compare);

    // Counter
    always @(posedge clk or posedge reset)
        if (reset)
            counter <= 0;
        else if (ce)
            counter <= match ? 0 : (counter + 1);

    // Clock gen
    always @(posedge clk or posedge reset)
        if (reset)
            slow_clk <= 1'b0;
        else if (ce)
            slow_clk <= slow_clk ^ match;

endmodule // clk_divider
