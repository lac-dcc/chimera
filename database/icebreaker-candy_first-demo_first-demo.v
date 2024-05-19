// This program was cloned from: https://github.com/kbob/icebreaker-candy
// License: GNU General Public License v3.0

`default_nettype none

module top (
        input  CLK,
        input  BTN_N,
        output LED1,
        output LED2,
        output LED3,
        output LED4,
        output LED5,
        output LEDR_N,
        output LEDG_N,
        output P1A1,
        output P1A2,
        output P1A3,
        output P1A7,
        output P1A8,
        output P1A9,
        output P1B1,
        output P1B2,
        output P1B3,
        output P1B4,
        output P1B7,
        output P1B8,
        output P1B9,
        output P1B10);

    localparam  S_START   = 8'b00000001;
    localparam  S_BLANK   = 8'b00000010;
    localparam  S_LATCH   = 8'b00000100;
    localparam  S_UNLATCH = 8'b00001000;
    localparam  S_UNBLANK = 8'b00010000;
    localparam  S_SHIFT   = 8'b00100000;

    wire        clk30_locked;
    wire        clk30;
    wire        reset;

    wire  [7:0] subframe;
    wire [12:0] frame;
    wire  [5:0] y0, y1;
    wire [23:0] rgb0, rgb1;
    wire  [7:0] cmp;

    reg   [2:0] led_rgb0;
    reg   [2:0] led_rgb1;
    reg   [4:0] led_addr;
    reg         led_blank;
    reg         led_latch;
    wire        led_sclk;

    reg   [6:0] x;
    reg   [4:0] addr;
    reg  [19:0] frame_counter;
    reg   [7:0] state;
    reg         sclk_ena;

    // LED panel pins
    assign {P1A3, P1A2, P1A1}              = led_rgb0;
    assign {P1A9, P1A8, P1A7}              = led_rgb1;
    assign {P1B10, P1B4, P1B3, P1B2, P1B1} = led_addr;
    assign P1B7                            = led_blank;
    assign P1B8                            = led_latch;
    assign P1B9                            = led_sclk;

    assign {frame, subframe} = frame_counter;
    assign y0 = {1'b0, addr};
    assign y1 = {1'b1, addr};
    // reduce flicker by comparing LSB first.
    assign cmp = {subframe[0], subframe[1], subframe[2], subframe[3],
                  subframe[4], subframe[5], subframe[6], subframe[7]};

    // wire x_single_bit, y0_single_bit, y1_single_bit;
    // wire [6:0] xx, yy0, yy1;
    // assign xx = x + frame;
    // assign yy0 = y0 + frame;
    // assign yy1 = y1 + frame;
    // assign x_single_bit = (| xx) & (~|(xx & (xx - 1)));
    // assign y0_single_bit = (| yy0) & (~|(yy0 & (yy0 - 1)));
    // assign y1_single_bit = (| yy1) & (~|(yy1 & (yy1 - 1)));

    //            BLUE GREEN RED
    // assign rgb0 = {0, y0_single_bit, x_single_bit};
    // assign rgb1 = {0, y1_single_bit, x_single_bit};
    wire [7:0] xx, yy0, yy1;
    wire [5:0] xort;
    wire [7:0] red0, red1, grn0, grn1, blu0, blu1;
    assign xx = x + frame[5:0];
    assign yy0 = y0 + frame[5:2];
    assign yy1 = y1 + frame[5:2];
    assign xort = x ^ frame[9:2];
    assign red0 = (xx[3] & yy0[3]) ? xx & 8'h07 : 0;
    assign grn0 = (xx[3] & yy0[3]) ? yy0 & 8'h07 : 0;
    assign blu0 = (xort == y0) ? 8'hBB : 8'h00;
    assign red1 = (xx[3] & yy1[3]) ? xx & 8'h07 : 0;
    assign grn1 = (xx[3] & yy1[3]) ? yy1 & 8'h07 : 0;
    assign blu1 = (xort == y1) ? 8'hBB : 8'h00;

    assign rgb0 = {red0 > cmp, grn0 > cmp, blu0 > cmp};
    assign rgb1 = {red1 > cmp, grn1 > cmp, blu1 > cmp};

    // assign LED1 = led_blank;
    // assign LED2 = reset;
    // assign LED3 = clk30_locked;
    // assign LED4 = clk30;

    always @(posedge clk30)
        if (reset) begin
            led_rgb0              <= 0;
            led_rgb1              <= 0;
            led_addr              <= 0;
            led_blank             <= 0;
            led_latch             <= 0;
            addr                  <= 0;
            frame_counter         <= 0;
            x                     <= 0;
            state                 <= S_START;
            sclk_ena              <= 0;
        end
        else
            case (state)

                S_START:
                    state         <= S_BLANK;

                S_BLANK:
                    begin
                        led_blank <= 1;
                        led_addr  <= addr;
                        state     <= S_LATCH;
                    end

                S_LATCH:
                    begin
                        led_latch <= 1;
                        state     <= S_UNLATCH;
                    end

                S_UNLATCH:
                    begin
                        led_latch <= 0;
                        state     <= S_UNBLANK;
                    end

                S_UNBLANK:
                    begin
                        led_blank <= 0;
                        x         <= 0;
                        addr      <= addr + 1;
                        if (addr == 31)
                            frame_counter <= frame_counter + 1;
                        state     <= S_SHIFT;
                    end

                S_SHIFT:
                    if (x[6]) begin
                        sclk_ena  <= 0;
                        state     <= S_BLANK;
                    end
                    else begin
                        led_rgb0  <= rgb0;
                        led_rgb1  <= rgb1;
                        x         <= x + 1;
                        sclk_ena  <= 1;
                        state     <= S_SHIFT;
                    end

            endcase

    pll_30mhz pll(
        .clk_pin(CLK),
        .reset_pin(~BTN_N),
        .locked(clk30_locked),
        .clk30(clk30));

    reset_logic rl(
        .pll_clk(clk30),
        .pll_locked(clk30_locked),
        .reset(reset));

    ddr led_sclk_ddr(
        .clk(clk30),
        .ena(sclk_ena),
        .sclk(led_sclk));

endmodule // top


module button_debouncer (
        input  clk,
        input  button_pin,
        output is_pressed,
        output press_evt,
        output release_evt);

    localparam COUNT_BITS = 13;

    reg                  is_down;
    reg                  was_down;
    reg                  press_evt_r;
    reg                  release_evt_r;
    reg [COUNT_BITS-1:0] counter = 0;

    assign is_pressed  = is_down;
    assign press_evt   = press_evt_r;
    assign release_evt = release_evt_r;

    always @(posedge clk)
        if (counter) begin
            counter <= counter + 1;
            press_evt_r = 0;
            release_evt_r = 0;
            was_down <= is_down;
        end
        else begin
            was_down <= is_down;
            is_down <= button_pin;
            if (is_down != was_down) begin
                counter <= 1;
                press_evt_r <= is_down;
                release_evt_r <= was_down;
            end
        end

endmodule // button_debouncer


module pll_30mhz (
        input clk_pin,
        input reset_pin,
        output locked,
        output clk30);

    SB_PLL40_PAD #(
        .FEEDBACK_PATH("SIMPLE"),
        .DIVR(4'b0000),         // DIVR =  0
        .DIVF(7'b1001111),      // DIVF = 79
        .DIVQ(3'b101),          // DIVQ =  5
        .FILTER_RANGE(3'b001)   // FILTER_RANGE = 1
    ) the_pll (
        .PACKAGEPIN(clk_pin),
        .PLLOUTCORE(clk30),
        .LOCK(locked),
        .RESETB(reset_pin),
        .BYPASS(1'b0)
    );

endmodule // pll30mhz


module reset_logic (
        input pll_clk,
        input pll_locked,
        output reset);

    reg [3:0] count;
    wire reset_i;

    assign reset_i = ~count[3];

    always @(posedge pll_clk or negedge pll_locked)
        if (~pll_locked)
            count <= 0;
        else if  (~count[3])
            count <= count + 1;

    SB_GB rst_gb (
        .USER_SIGNAL_TO_GLOBAL_BUFFER(reset_i),
        .GLOBAL_BUFFER_OUTPUT(reset));

endmodule // reset_logic


module ddr (
        input clk,
        input ena,
        output sclk);

    SB_IO #(
        .PIN_TYPE(6'b010001)
    ) it (
        .PACKAGE_PIN(sclk),
        .LATCH_INPUT_VALUE(1'b0),
        .CLOCK_ENABLE(1'b1),
        .INPUT_CLK(clk),
        .OUTPUT_CLK(clk),
        .OUTPUT_ENABLE(1'b1),
        .D_OUT_0(1'b0),
        .D_OUT_1(ena));

endmodule // ddr
