// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`ifndef CAMERA_INGESTER_V
`define CAMERA_INGESTER_V

`timescale 1ns/100ps

/**
 * This connects to an hm01b0 and outputs the given pixels to a
 *
 * TODO: make ingester clock rate not the same as rest of system.
 */
`define SYNCHRONOUS
`ifdef SYNCHRONOUS
module camera_ingester(input                      clock,
                       input                      nreset,

                       // camera interface
                       input                      pixclk,
                       input [7:0]                pixdata,
                       input                      hsync,
                       input                      vsync,

                       // output buffer select; common to both obfuscation map output and EBR
                       // buffer output.
                       output reg [0:0]           frontbuffer_select,

                       // EBR buffer output interface
                       output reg [($clog2(num_ebr) - 1):0] output_block_select,
                       output reg [($clog2(ebr_size) - 1):0] output_write_addr,
                       output reg [7:0]           output_pixval,

                       output reg [0:0]           wren);
    parameter left_active_padding = 0, right_active_padding = 0;
    parameter top_active_padding = 0, bottom_active_padding = 0;

    localparam width_pix = 320, height_pix = 240, num_ebr = 5, ebr_size = 512;
    localparam width_mcu = (width_pix / 8), height_mcu = (height_pix / 8);

    // Logic for tracking whether we're in padding or in the active part of the image
    reg [$clog2(width_pix + left_active_padding + right_active_padding + 2) - 1 : 0] x;
    reg [$clog2(height_pix + top_active_padding + bottom_active_padding + 2) - 1 : 0] y;
    wire in_active_region = ((x >= left_active_padding) && (x < (left_active_padding + width_pix)) &&
                             (y >= top_active_padding) && (y < (top_active_padding + height_pix)));

    reg [2:0] px;
    reg [2:0] py;
    reg [$clog2(width_pix / 8) - 1 : 0] mcux;
    reg [$clog2(height_pix / 8) - 1 : 0] mcuy;

    // Latches for preventing metastability.
    // prev[0] is the most recent, prev[1] is older.
    reg [7:0] pixdata_prev [0:2];
    reg pixclk_prev [0:2];
    reg hsync_prev [0:2];
    reg vsync_prev [0:2];

    genvar genvi;
    generate
        for (genvi = 0; genvi <= 2; genvi = genvi + 1) begin
            if (genvi == 0) begin
                always @(posedge clock) begin
                    pixclk_prev[genvi] <= pixclk;
                    pixdata_prev[genvi] <= pixdata;
                    vsync_prev[genvi] <= vsync;
                    hsync_prev[genvi] <= hsync;
                end
            end else begin
                always @(posedge clock) begin
                    if (nreset) begin
                        pixclk_prev[genvi] <= pixclk_prev[genvi - 1];
                        pixdata_prev[genvi] <= pixdata_prev[genvi - 1];
                        vsync_prev[genvi] <= vsync_prev[genvi - 1];
                        hsync_prev[genvi] <= hsync_prev[genvi - 1];
                    end else begin
                        pixclk_prev[genvi] <= pixclk;
                        pixdata_prev[genvi] <= pixdata;
                        vsync_prev[genvi] <= vsync;
                        hsync_prev[genvi] <= hsync;
                    end
                end
            end
        end
    endgenerate

    reg new_mcu_row;

    // TODO: does this name make sense given the consts used to size it?
    reg [$clog2(ebr_size / 64) - 1 : 0] mcunum_div_num_ebr;
    always @(posedge clock) begin
        if (nreset) begin
            // Advance logic for x and y pointers inside image.
            if (!hsync_prev[1]) begin
                // could also have some logic in here to sanity check x's value before we clear it.
                x <= 0;
            end else begin
                if (!pixclk_prev[2] && pixclk_prev[1]) begin
                    // x coordinate increases on every rising edge where hsync is active.
                    x <= x + 1;
                end
            end

            if (!vsync_prev[1]) begin
                y <= 0;
            end else begin
                if (hsync_prev[2] && !hsync_prev[1]) begin
                    y <= y + 1;
                end
            end

            // On rising edges of pixclk, if we are in an active part of the frame, output a pixel
            // by setting wren active.
            if ((!pixclk_prev[2] && pixclk_prev[1]) &&
                hsync_prev[1] && vsync_prev[1] && in_active_region) begin
                wren <= 1;
                output_pixval <= pixdata_prev[1];
            end else begin
                wren <= 0;
                output_pixval <= 8'hxx;
            end

            if (!vsync_prev[0]) begin
                px <= 'h0;
                mcunum_div_num_ebr <= 'h0;
                mcux <= 'h0;
                mcuy <= 'h0;
                py <= 'h0;
            end

            // if write enable was high on the previous cycle, we need to advance the addresses
            // TODO: derive / sanity check these from hsync.
            // ebr.addr
            // 0.0, 0.1, 0.2, ... 0.7; 1.0, 1.1, ... 1.7; ... 4.7;     MCU 0 - 4, row 0 (40 pixels)
            // 0.64, 0.65, ...   0.71; 1.64, ...    1.71; ... 4.71;    MCU 5 - 9, row 0  (40 pixels)
            // 0.128, ...       0.135; 1.128, ...  1.135; ... 4.135;   MCU 10 - 14, row 0 (40 pix)
            // ... MCU 15 - 19 (40 pixels)
            // ... MCU 20 - 24 (40 pixels)
            // ... MCU 25 - 29 (40 pixels)
            // ... MCU 30 - 34 (40 pixels)
            // ... MCU 35 - 39 (40 pixels)
            // 0.8, 0.9, ...     0.15; 1.8, 1.9, ...1.15; ... 4.15;    MCU 0 - 4, row 1 (40 pixels)
            // 0.72, 0.73, ...   0.79; 1.72, ...    1.79; ... 4.79;    MCU 5 - 9, row 1 (40 pixels)
            //
            // these patterns can be implemented by a ripple counter that's slightly more convoluted
            // than the sort of ripple counter that you'd use for an hour / minute / second clock.
            if (wren) begin
                // updates:
                //    output_block_select
                //    px
                //    py
                //    mcunum_div_num_ebr
                //    mcux
                //    frontbuffer_select
                if (px == 'h7) begin
                    if (output_block_select == (num_ebr - 1)) begin
                        output_block_select <= 'h0;
                    end else begin
                        output_block_select <= output_block_select + 'h1;
                    end
                end else begin
                    output_block_select <= output_block_select;
                end

                px <= (px == 'h7) ? ('h0) : (px + 'h1);

                if ((px == 'h7) && (output_block_select == (num_ebr - 1))) begin
                    // even though this condition doesn't directly check that mcunum_div_num_ebr
                    // won't overflow the size of an EBR (for instance, a value of 8 for
                    // mcunum_div_num_ebr would try to deposit line 0 of an MCU outside of an EBR),
                    // we are still guaranteed by our precompile condition of
                    // ((width_pix * 8) >= (num_ebr * ebr_size)) that this won't happen.
                    if (mcux == ((width_pix / 8) - 1)) begin
                        mcunum_div_num_ebr <= 'h0;
                    end else begin
                        mcunum_div_num_ebr <= mcunum_div_num_ebr + 'h1;
                    end
                end else begin
                    mcunum_div_num_ebr <= mcunum_div_num_ebr;
                end

                // mcux
                if (px == 'h7) begin
                    mcux <= (mcux == ((width_pix / 8) - 1)) ? 'h0 : (mcux + 'h1);
                end else begin
                    mcux <= mcux;
                end

                py <= ((px == 'h7) && (mcux == ((width_pix / 8) - 1))) ? (py + 'h1) : py;
                mcuy <= mcuy;
                frontbuffer_select <= new_mcu_row ? (frontbuffer_select + 'h1) : frontbuffer_select;
            end else begin
                if (!vsync_prev[1]) begin
                    px <= 0; py <= 0;
                    mcux <= 0; mcuy <= 0;

                    output_block_select <= 0;
                    mcunum_div_num_ebr <= 0;
                    frontbuffer_select <= 0;
                end
            end
        end else begin
            // RESET
            x <= 0;
            y <= 0;

            wren <= 'h0;
            output_pixval <= 'hxx;

            px <= 'h0; py <= 'h0;
            mcux <= 'h0; mcuy <= 'h0;
            output_block_select <= 0;
            mcunum_div_num_ebr <= 0;
            frontbuffer_select <= 0;
        end
    end

    always @* begin
        // this is a cheaper (mcunum_div_num_ebr * 64) + (py * 8) + px
        output_write_addr = {mcunum_div_num_ebr, py, px};

        new_mcu_row = ((px == 'h7) && (mcux == ((width_pix / 8) - 1)) && (py == 'h7));
    end
endmodule

`else // !`ifdef SYNCHRONOUS
// TODO: different module for alternate clock domain for hm01b0 pixclk.

`endif

`endif
