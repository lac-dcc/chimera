`default_nettype none


// Pipeline for driving an LED panel with pulse density modulation
// (PDM) and gamma correction.
//
// Client should instantiate the `led_main` and define a `painter24`
// module which returns the 24 bit color of one pixel at one point
// in space and time.  Client's makefile also needs to create the
// gamma table in gamma8x8z_table.hex.
//
// The `DELAY` parameter describes how many clock cycles `painter`
// uses to calculate each pixel.


module led_main #(
        parameter USE_RESETN_BUTTON =  1,
        parameter FRAME_BITS        = 10,
        parameter DELAY             =  1
    ) (
        input         CLK,
        input         resetn_btn,
        output        pll_clk,
        output        reset,
        output [15:0] LED_PANEL);

    // Dimensions
    localparam DB = $clog2(DELAY); // delay bits
    localparam FB = FRAME_BITS;    // frame bits
    localparam SB = 8;             // subframe bits
    localparam AB = 5;             // address bits
    localparam RB = 6;             // row bits
    localparam CB = 6;             // column bits
    localparam EB = FB + SB + AB + RB; // extended counter bits

    localparam DH = DB - 1;        // delay high bit
    localparam FH = FB - 1;        // frame high bit
    localparam SH = SB - 1;        // subframe high bit
    localparam AH = AB - 1;        // address high bit
    localparam RH = RB - 1;        // row high bit
    localparam CH = CB - 1;        // column high bit
    localparam EH = EB - 1;        // extended counter high bit

    localparam CC = 1 << CB;       // column count

    wire [AH:0] addr;
    wire [SH:0] subframe;
    wire [FH:0] frame;
    wire [RH:0] y [0:1];
    wire [CH:0] x;

    assign {frame, subframe, addr, x} = painter_counter;
    assign y[0] = {1'b0, addr};
    assign y[1] = {1'b1, addr};

    wire        pll_fast_clk;
    wire        pll_slow_clk;
    wire        pll_locked;
    wire        resetn;
    wire [23:0] rgb24 [0:1];
    wire [29:0] rgb30g [0:1];
    wire  [2:0] rgb3_0;
    wire  [2:0] rgb3_1;
    wire [EH:0] painter_counter;
    wire        led_driver_ready;

    incrementer #(
        .DELAY(DELAY),
        .WIDTH($bits(painter_counter))
    ) painter_ticker (
        .clk(pll_slow_clk),
        .reset(!led_driver_ready),
        .counter(painter_counter));

    genvar i;
    generate

        for (i = 0; i < 2; i++) begin : painter
            painter24 painter (
                .clk(pll_slow_clk),
                .reset(reset),
                .frame(frame),
                .subframe(subframe),
                .x(x),
                .y(y[i]),
                .rgb24(rgb24[i]));
        end // painter

        for (i = 0; i < 6; i++) begin : gamma
            gamma10 gamma (
                .clk(pll_slow_clk),
                .reset(reset),
                .color8(rgb24[i/3][i%3*8+:8]),
                .color10_g(rgb30g[i/3][i%3*10+:10]));
        end // gamma

    endgenerate

    pdm # (
        .DELAY(DELAY + 1)
    ) the_big_pdm (
        .fast_clk(pll_fast_clk),
        .slow_clk(pll_slow_clk),
        .reset(reset),
        .rgb60_in({rgb30g[1], rgb30g[0]}),
        .rgb6_out({rgb3_1, rgb3_0}));

    led_driver #(
        .FRAME_BITS(FRAME_BITS),
        .DELAY(DELAY + 2)
    ) driver (
        .clk(pll_slow_clk),
        .reset(reset),
        .rgb0(rgb3_0),
        .rgb1(rgb3_1),
        .ready(led_driver_ready),
        .LED_PANEL(LED_PANEL));

    pll_30_60mhz pll (
        .clk_pin(CLK),
        .locked(pll_locked),
        .pll_clk30(pll_slow_clk),
        .pll_clk60(pll_fast_clk));

    generate

        if (USE_RESETN_BUTTON) begin
            button_debouncer db (
                .clk(pll_slow_clk),
                .button_pin(resetn_btn),
                .level(resetn));
        end
        else
            assign resetn = 1;

    endgenerate

    reset_logic rl (
        .resetn(resetn),
        .pll_clk(pll_slow_clk),
        .pll_locked(pll_locked),
        .reset(reset));

endmodule // led_main


module led_driver #(
        parameter     FRAME_BITS = 10,
        parameter     DELAY      = 1
    ) (
        input         clk,
        input         reset,
        input   [2:0] rgb0,
        input   [2:0] rgb1,
        output        ready,
        output [15:0] LED_PANEL);

    // State machine.
    localparam
        S_START   = 0,
        S_R1      = 1,
        S_R1E     = 2,
        S_R2      = 3,
        S_R2E     = 4,
        S_SDELAY  = 5,
        S_SHIFT0  = 6,
        S_SHIFT   = 7,
        S_SHIFTN  = 8,
        S_BLANK   = 9,
        S_UNBLANK = 10;

    // FM6126 Init Values
    localparam FM_R1     = 16'h7FFF;
    localparam FM_R2     = 16'h0040;

    // Route outputs to LED panel with registers as needed.
    reg   [2:0] led_rgb0;
    reg   [2:0] led_rgb1;
    reg   [4:0] led_addr;
    wire        led_blank;
    wire        led_latch;
    wire        led_sclk;
    wire        P1A1, P1A2, P1A3, P1A4, P1A7, P1A8, P1A9, P1A10;
    wire        P1B1, P1B2, P1B3, P1B4, P1B7, P1B8, P1B9, P1B10;

    // This panel has swapped red and blue wires.
    // assign {P1A3, P1A2, P1A1}              = led_rgb0;
    // assign {P1A9, P1A8, P1A7}              = led_rgb1;
    assign {P1A1, P1A2, P1A3}              = led_rgb0;
    assign {P1A7, P1A8, P1A9}              = led_rgb1;
    assign {P1B10, P1B4, P1B3, P1B2, P1B1} = led_addr;
    assign P1B7                            = led_blank;
    assign P1B8                            = led_latch;
    assign P1B9                            = led_sclk;
    assign {P1A4, P1A10}                   = 0;
    assign LED_PANEL = {P1B10, P1B9, P1B8, P1B7,  P1B4, P1B3, P1B2, P1B1,
                        P1A10, P1A9, P1A8, P1A7,  P1A4, P1A3, P1A2, P1A1};

    assign ready = (state >= S_SDELAY);

    // Dimensions
    localparam DB = $clog2(DELAY); // delay bits
    localparam AB = 5;             // address bits
    localparam CB = 6;             // column bits
    localparam LB = AB + CB;       // counter bits

    localparam DH = DB - 1;        // delay high bit
    localparam AH = AB - 1;        // address high bit
    localparam CH = CB - 1;        // column high bit
    localparam LH = LB - 1;        // counter high bit

    localparam CC = 1 << CB;       // column count

    wire [AH:0] addr;
    wire [CH:0] col;

    reg  [DH:0] delay;
    reg  [LH:0] counter;
    reg   [1:0] blank;
    reg   [1:0] latch;
    reg   [1:0] sclk;
    reg   [3:0] state;
    reg  [15:0] init_reg;
    reg   [6:0] init_lcnt;

    assign {addr, col} = counter;

    always @(posedge clk)
        if (reset) begin
            led_rgb0              <= 0;
            led_rgb1              <= 0;
            led_addr              <= 0;
            delay                 <= DELAY - 1;
            counter               <= 0;
            blank                 <= 2'b11;
            latch                 <= 2'b00;
            sclk                  <= 2'b00;
            state                 <= S_START;
        end
        else
            case (state)

                S_START:          // Exit reset; start shifting column data.
                    begin
                        blank     <= 2'b11; // blank until first row is latched
                        // Setup FM6126 init
                        init_reg  <= FM_R1;
                        init_lcnt <= 52;
                        state <= S_R1;
                        // ChipOne panels can skip the init sequence
                        //state <= S_SDELAY;
                    end

                // Setting FM6126 Registers
                S_R1:
                    begin
                        led_rgb0  <= init_reg[15] ? 3'b111 : 3'b000;
                        led_rgb1  <= init_reg[15] ? 3'b111 : 3'b000;
                        init_reg  <= {init_reg[14:0], init_reg[15]};

                        latch     <= init_lcnt[6] ? 2'b11 : 2'b00;
                        init_lcnt <= init_lcnt - 1;

                        counter   <= counter + 1;
                        sclk      <= 2'b10;

                        if (counter[5:0] == 63) begin
                            state <= S_R1E;
                        end
                    end

                S_R1E:
                    begin
                        latch     <= 2'b00;
                        sclk      <= 2'b00;
                        init_reg  <= FM_R2;
                        init_lcnt <= 51;
                        state     <= S_R2;
                    end

                S_R2:
                    begin
                        led_rgb0  <= init_reg[15] ? 3'b111 : 3'b000;
                        led_rgb1  <= init_reg[15] ? 3'b111 : 3'b000;
                        init_reg  <= {init_reg[14:0], init_reg[15]};

                        latch     <= init_lcnt[6] ? 2'b11 : 2'b00;
                        init_lcnt <= init_lcnt - 1;

                        counter   <= counter + 1;
                        sclk      <= 2'b10;

                        if (counter[5:0] == 63) begin
                            state <= S_R2E;
                        end
                    end

                S_R2E:
                    begin
                        latch      <= 2'b00;
                        sclk       <= 2'b00;
                        counter    <= 0;
                        state      <= S_SDELAY;
                    end

                S_SDELAY:         // Startup delay
                    begin
                        delay     <= delay - 1;
                        if(!delay)
                            state      <= S_SHIFT;
                    end

                S_SHIFT0:         // Shift first column.
                    begin
                        led_rgb0  <= rgb0;
                        led_rgb1  <= rgb1;
                        counter   <= counter + 1;
                        blank     <= 2'b00;
                        sclk      <= 2'b10;
                        state     <= S_SHIFT;
                    end

                S_SHIFT:          // Shift a column.
                    begin
                        led_rgb0  <= rgb0;
                        led_rgb1  <= rgb1;
                        counter   <= counter + 1;
                        sclk      <= 2'b10;
                        if (col == CC - 2) // next column will be the last.
                            state <= S_SHIFTN;
                    end

                S_SHIFTN:         // Shift the last column; start BLANK.
                    begin
                        blank     <= blank | 2'b01;
                        led_rgb0  <= rgb0;
                        led_rgb1  <= rgb1;
                        state     <= S_BLANK;
                    end

                S_BLANK:          // Drain shift register; pulse LATCH.
                    begin
                        blank     <= 2'b11;
                        latch     <= 2'b11;
                        sclk      <= 2'b00;
                        state     <= S_UNBLANK;
                    end

                S_UNBLANK:        // End BLANK; start next row.
                    begin
                        led_addr  <= addr;
                        counter   <= counter + 1;
                        blank     <= 2'b10;
                        latch     <= 2'b00;
                        state     <= S_SHIFT0;
                    end

            endcase

    ddr led_blank_ddr (
        .clk(clk),
        .data(blank),
        .ddr_pin(led_blank));

    ddr led_latch_ddr (
        .clk(clk),
        .data(latch),
        .ddr_pin(led_latch));

    ddr led_sclk_ddr (
        .clk(clk),
        .data(sclk),
        .ddr_pin(led_sclk));

endmodule // led_driver


module gamma10 (
        input clk,
        input reset,
        input [7:0] color8,
        output [9:0] color10_g);

    reg [9:0] gamma10_table [0:255];
    initial $readmemh("gamma8x10z_table.hex", gamma10_table);

    reg [9:0] color10_g;

    always @(posedge clk)
        if (reset)
            color10_g <= 0;
        else
            color10_g <= gamma10_table[color8];

endmodule // gamma10


module pdm #(
        parameter DELAY = 1
    ) (
        input        fast_clk,
        input        slow_clk,
        input        reset,
        input [59:0] rgb60_in,
        output [5:0] rgb6_out);

    wire [13:0] spram_addr;
    wire [63:0] spram_data_in;
    wire        spram_wren;
    wire [63:0] spram_data_out;
    reg  [60:0] pdm_err_in;

    reg  [12:0] clear_counter;
    reg         clearing_mem;
    wire        mem_cleared;
    assign mem_cleared = clear_counter[12];

    assign spram_data_in[63:60] = 0;    // we use 60 of 64 bits.

    always @(posedge fast_clk)
        if (reset) begin
            clear_counter <= 0;
            clearing_mem <= 0;
        end
        else if (!mem_cleared) begin
            clear_counter <= clear_counter + 1;
            if (clear_counter[12])
                clearing_mem <= 0;
        end

    always @(posedge slow_clk)
            pdm_err_in = spram_data_out[59:0];

    spram_controller #(
        .DELAY(DELAY)
    ) ctlr (
        .fast_clk(fast_clk),
        .slow_clk(slow_clk),
        .reset(reset),
        .spram_addr(spram_addr),
        .spram_wren(spram_wren));

    genvar i;
    generate

        for (i = 0; i < 6; i=i+1) begin : calc
            pdm_calc pt (
                .clk(slow_clk),
                .reset(reset),
                .err_in(pdm_err_in[10*i+:10]),
                .x(rgb60_in[10*i+:10]),
                .y(rgb6_out[i]),
                .err_out(spram_data_in[10*i+:10]));
        end // calc

        for (i = 0; i < 4; i=i+1) begin : mem
            spram mem (
                .fast_clk(fast_clk),
                .reset(reset),
                .address(clearing_mem ? clear_counter : spram_addr),
                .data_in(clearing_mem ? 16'b0 : spram_data_in[16*i+:16]),
                .wren(clearing_mem | spram_wren),
                .data_out(spram_data_out[16*i+:16]));
        end // mem

    endgenerate

endmodule // pdm


module spram_controller #(
        parameter     ROWS  = 32,
        parameter     COLS  = 64,
        parameter     DELAY = 1
    ) (
        input         fast_clk,
        input         slow_clk,
        input         reset,
        output [13:0] spram_addr,
        output        spram_wren
    );

    localparam DB       = 7;            // delay bits
    localparam RB       = $clog2(ROWS);
    localparam CB       = $clog2(COLS);
    localparam AB       = RB + CB;      // address bits
    localparam PB       = 14 - AB;      // address pad bits
    localparam DH       = DB - 1;       // delay high bit
    localparam RH       = RB - 1;
    localparam CH       = CB - 1;
    localparam AH       = AB - 1;

    wire       phase;           // 1 = writing, 0 = reading
    reg        toggle;
    reg        tog, prev_tog;
    reg [DH:0] delay;
    reg        rd_trigger, wr_trigger;

    always @(posedge slow_clk)
        if (reset) begin
            toggle   <= 0;
            delay      <= DELAY - 1;
        end
        else begin
            toggle   <= ~toggle;
            if (delay)
                delay  <= delay - 1;
            else
                delay  <= 64 + 2;
            rd_trigger <= delay == 1;
            wr_trigger <= delay == 64 + 1;
        end

    always @(posedge fast_clk)
        if (reset) begin
            prev_tog <= 1;
            tog      <= 0;
        end
        else begin
            prev_tog <= tog;
            tog      <= toggle;
        end
    assign phase        = tog ~^ prev_tog;

    reg  [RH:0] rd_row;
    reg  [CB:0] rd_col;
    wire [AH:0] rd_addr;
    always @(posedge fast_clk)
        if (reset) begin
            rd_row     <= -1;
            rd_col     <= 1 << CB;
        end
        else if (~phase && rd_trigger) begin
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
        else if (phase && wr_trigger) begin
            wr_row     <= wr_row + 1;
            wr_col     <= 0;
        end
        else if (phase && ~wr_col[CB])
            wr_col     <= wr_col + 1;
    assign wr_addr      = {wr_row, wr_col[CH:0]};

    assign spram_addr   = {{PB{1'b0}}, phase ? wr_addr : rd_addr};
    assign spram_wren   = phase & ~wr_col[CB];

endmodule // spram_controller


module spram (
        input         fast_clk,
        input         reset,
        input  [13:0] address,
        input  [15:0] data_in,
        input         wren,
        output [15:0] data_out);

    SB_SPRAM256KA spram (
        .ADDRESS(address),
        .DATAIN(data_in),
        .MASKWREN(4'b1111),
        .WREN(wren),
        .CHIPSELECT(1'b1),
        .CLOCK(fast_clk),
        .STANDBY(1'b0),
        .SLEEP(1'b0),
        .POWEROFF(1'b1),
        .DATAOUT(data_out));

endmodule // spram


module pdm_calc (
        input        clk,
        input        reset,
        input  [9:0] err_in,
        input  [9:0] x,
        output       y,
        output [9:0] err_out);

    reg       y_r;
    reg [9:0] err_out_r;

    always @(posedge clk)
        if (reset) begin
            err_out_r <= 0;
            y_r       <= 0;
        end
        else if (x > err_in) begin
            y_r       <= 1;
            err_out_r <= 10'b1111111111 - (x - err_in);
        end
        else begin
            y_r       <= 0;
            err_out_r <= err_in - x;
        end

    assign y           = y_r;
    assign err_out     = err_out_r;

endmodule // pdm_calc


module incrementer #(
        parameter DELAY        = 1,
        parameter WIDTH        = 32,
    ) (
        input              clk,
        input              reset,
        output [WIDTH-1:0] counter);

    localparam S_COUNT = 3'b001;
    localparam S_WAIT1 = 3'b010;
    localparam S_WAIT2 = 3'b100;

    reg [WIDTH-1:0] counter_r;
    reg       [2:0] state;

    assign counter = counter_r;

    always @(posedge clk)
        if (reset) begin
            counter_r <= 0;
            state <= S_COUNT;
        end
        else
            case (state)
                S_COUNT:
                    begin
                        counter_r <= counter_r + 1;
                        if (counter_r[5:0] == 63)
                            state <= S_WAIT1;
                    end

                S_WAIT1:
                    state <= S_WAIT2;

                S_WAIT2:
                    state <= S_COUNT;
            endcase

endmodule // incrementer


module button_debouncer (
        input  clk,
        input  button_pin,
        output level,
        output rising_edge,
        output falling_edge);

    localparam COUNT_BITS = 15;

    reg                  is_high;
    reg                  was_high;
    reg                  level_r;
    reg                  rising_edge_r;
    reg                  falling_edge_r;
    reg [COUNT_BITS-1:0] counter = 0;

    assign level        = level_r;
    assign falling_edge = rising_edge_r;
    assign rising_edge  = falling_edge_r;

    always @(posedge clk)
        if (counter) begin
            counter            <= counter + 1;
            rising_edge_r      <= 0;
            falling_edge_r     <= 0;
            was_high           <= is_high;
        end
        else begin
            is_high            <= button_pin;
            level_r            <= is_high;
            if (is_high != was_high) begin
                counter        <= 1;
                rising_edge_r  <= is_high;
                falling_edge_r <= ~is_high;
            end
        end

endmodule // button_debouncer


module pll_30_60mhz (
        input  clk_pin,
        output locked,
        output pll_clk30,
        output pll_clk60);

    /**
    * PLL configuration
     *
     * This Verilog header file was generated automatically
     * using the icepll tool from the IceStorm project.
     * It is intended for use with FPGA primitives SB_PLL40_CORE,
     * SB_PLL40_PAD, SB_PLL40_2_PAD, SB_PLL40_2F_CORE or SB_PLL40_2F_PAD.
     * Use at your own risk.
     *
     * Given input frequency:        12.000 MHz
     * Requested output frequency:   60.000 MHz
     * Achieved output frequency:    60.000 MHz
     */

     SB_PLL40_2F_PAD #(
        .FEEDBACK_PATH("SIMPLE"),
        .PLLOUT_SELECT_PORTB("GENCLK_HALF"),
        .DIVR(4'b0000),		// DIVR =  0
        .DIVF(7'b1001111),	// DIVF = 79
        .DIVQ(3'b100),		// DIVQ =  4
        .FILTER_RANGE(3'b001)	// FILTER_RANGE = 1
    ) the_pll (
        .PACKAGEPIN(clk_pin),
        .PLLOUTGLOBALA(pll_clk60),
        .PLLOUTGLOBALB(pll_clk30),
        .LOCK(locked),
        .RESETB(1'b1),
        .BYPASS(1'b0)
    );

endmodule // pll_30_60MHz


module reset_logic (
        input pll_clk,
        input pll_locked,
        input resetn,
        output reset);

    localparam MSB = 3;

    reg  [MSB:0] count;
    wire         ext_reset;

    assign ext_reset = ~resetn | ~pll_locked;

    always @(posedge pll_clk or negedge ext_reset)
        if (~ext_reset)
            count <= 0;
        else if  (~count[MSB])
            count <= count + 1;

    SB_GB rst_gb (
        .USER_SIGNAL_TO_GLOBAL_BUFFER(count[MSB]),
        .GLOBAL_BUFFER_OUTPUT(reset));

endmodule // reset_logic


module ddr (
        input       clk,
        input [1:0] data,
        output      ddr_pin);

    SB_IO #(
        .PIN_TYPE(6'b010001)
    ) it (
        .PACKAGE_PIN(ddr_pin),
        .LATCH_INPUT_VALUE(1'b0),
        .INPUT_CLK(clk),
        .OUTPUT_CLK(clk),
        .D_OUT_0(data[0]),
        .D_OUT_1(data[1]));

endmodule // ddr
