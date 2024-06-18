// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

/**
 * This non-synthesizable module simulates an hm01b0.
 *
 * Its image is 320x240.
 *
 * Hold nreset low to reset the
 *
 * the output clock will be the same as the input clock
 */

`ifndef HM01B0_SIM_V
`define HM01B0_SIM_V

`timescale 1ns/100ps

module hm01b0_sim(input      mclk,
                  input      nreset,

                  output reg clock,
                  output reg  [7:0] pixdata,

                  output reg hsync,
                  output reg vsync);
    // determines how much mclk is divided by to derive output clock
    parameter clkdiv = 4;

    // determines how much to delay the output clock by; units given in timebase.
    parameter real clock_skew = 0.0;

    // If this parameter is nonzero, then input mclk is ignored and instead a pixclk is
    // generated with frequency "internal_oscillator_frequency"; this frequency is given
    // in GHz - the timebase is 1ns.
    parameter internal_oscillator_enable = 0;
    parameter real internal_oscillator_frequency = 0.04266666666666666;

    parameter width = 320;
    parameter height = 240;

    parameter left_inactive_padding = 16, left_active_padding = 2;
    parameter right_inactive_padding = 100, right_active_padding = 2;
    parameter top_inactive_padding = 1, top_active_padding = 2;
    parameter bottom_inactive_padding = 200, bottom_active_padding = 2;

    localparam xmax = (width +
                       left_inactive_padding + left_active_padding +
                       right_inactive_padding + right_active_padding) - 1;
    localparam ymax = (height +
                       top_inactive_padding + top_active_padding +
                       bottom_inactive_padding + bottom_active_padding) - 1;

    reg [7:0] hm01b0_image [0:((width * height) - 1)];

    reg [15:0] ptrx;
    reg [15:0] ptry;

    initial begin ptrx = 0; ptry = 0; end

    always @ (negedge clock) begin
        if (nreset) begin
            if (ptrx == xmax) begin
                ptrx <= 16'h0;
            end else begin
                ptrx <= ptrx + 16'h1;
            end

            if (ptrx == xmax) begin
                if (ptry == ymax) begin
                    ptry <= 16'h0;
                end else begin
                    ptry <= ptry + 1;
                end
            end else begin
                ptry <= ptry;
            end

        end else begin
            ptrx <= 'h0;
            ptry <= 'h0;
        end
    end

    localparam hsync_min = left_inactive_padding;
    localparam hsync_max = (left_inactive_padding + left_active_padding +
                            width + right_active_padding);

    localparam x_roi_min = left_inactive_padding + left_active_padding;
    localparam x_roi_max = x_roi_min + width;

    localparam vsync_min = top_inactive_padding;
    localparam vsync_max = (top_inactive_padding + top_active_padding +
                            height + bottom_active_padding);

    localparam y_roi_min = top_inactive_padding + top_active_padding;
    localparam y_roi_max = y_roi_min + height;

    always @* begin
        vsync = ((ptry >= vsync_min) && (ptry < vsync_max));
        hsync = (vsync && (ptrx >= hsync_min) && (ptrx < hsync_max));
    end

    wire inside_roi = ((ptry >= y_roi_min) && (ptry < y_roi_max) &&
                       (ptrx >= x_roi_min) && (ptrx < x_roi_max));

    // for some reason, putting hm01b0_image (an array of 76800 items) inside an always @* block
    // really upsets iverilog, so we need to use these assign statements on pixdata.
    wire[16:0] image_idx;
    assign image_idx = (((ptry - (top_inactive_padding + top_active_padding)) * width) +
                        (ptrx - (left_inactive_padding + left_active_padding)));
    wire [7:0] pixdata_i;
    assign pixdata_i = (inside_roi) ? hm01b0_image[image_idx] :
                       8'hxx;
    always @* begin
        // in case you want to add a delay
        pixdata = pixdata_i;
    end

    generate
        genvar i;
        for (i = 0; i < 1; i = i + 1) begin
            if (internal_oscillator_enable) begin
                always begin
                    clock = #clock_skew 0;
                    #(4 / internal_oscillator_frequency);
                    clock = #clock_skew 1;
                    #(4 / internal_oscillator_frequency);
                end
            end else begin
                if (clkdiv <= 1) begin
                    always @* begin
                        clock = #clock_skew mclk;
                    end
                end else begin
                    reg [($clog2(clkdiv) - 1):0] counter;
                    wire [$clog2(clkdiv):0] counter_rollover_expression = ((clkdiv >> 1) - 1);
                    initial counter = 0;
                    initial clock = 0;
                    always @(posedge mclk) begin
                        if (counter == counter_rollover_expression[($clog2(clkdiv) - 1):0]) begin
                            counter <= 0;
                            clock <= #clock_skew ~clock;
                        end else begin
                            counter <= counter + 1;
                            clock <= clock;
                        end
                    end
                end
            end
        end
    endgenerate
endmodule

`endif
