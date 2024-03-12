/*
 *  Copyright (C) 2018  David Shah <david@symbioticeda.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

/*
 *  Top level MIPI CSI-2 peripheral with downsample and framebuffer
 *  Control register map:
 *        0x0000    I2C bitbang
 *                      bit 0: SDA
 *                      bit 1: SCL
 *
 *        TBC: frame, line and pixel counters?
 *
 *     Framebuffer:
 *        Starts at 0x8000
 *        Pixel Address = 0x8000 + 4 * (64 * y + x)
 *        Data is in bits 7..0 of result
*/

module cameraif(
    // CSI-2 interface
    input dphy_clk,
    input [1:0] dphy_data,
    input dphy_lp,

    // Camera control
    inout cam_sda, cam_scl,
    output cam_enable,

    // Debugging
    output cam_heartbeat,

    // picorv32 side interface
    input sys_clk,
    input resetn,
    input [15:0] addr,
    input [31:0] wdata,
    input [3:0] wstrb,
    input valid,
    output [31:0] rdata,
    output reg ready
);

    wire reset = !resetn;

    // Top CSI-2 Rx interface

    wire video_clk;
    wire [31:0] payload_data;
    wire payload_valid, payload_frame;
    wire vsync, in_line, in_frame;

    csi_rx_ice40 #(
        .LANES(2), // lane count
        .PAIRSWAP(2'b10), // lane pair swap (inverts data for given  lane)

        .VC(2'b00), // MIPI CSI-2 "virtual channel"
        .FS_DT(6'h12), // Frame start data type
        .FE_DT(6'h01), // Frame end data type
        .VIDEO_DT(6'h2A), // Video payload data type (6'h2A = 8-bit raw, 6'h2B = 10-bit raw, 6'h2C = 12-bit raw)
        .MAX_LEN(8192) // Max expected packet len, used as timeout
    ) csi_rx_i (
        .dphy_clk_lane(dphy_clk),
        .dphy_data_lane(dphy_data),
        .dphy_lp_sense(dphy_lp),

        .areset(reset),

        .word_clk(video_clk),
        .payload_data(payload_data),
        .payload_enable(payload_valid),
        .payload_frame(payload_frame),

        .vsync(vsync),
        .in_line(in_line),
        .in_frame(in_frame),

        .dbg_raw_ddr(), .dbg_raw_deser(), .dbg_aligned(), .dbg_aligned_valid(), .dbg_wait_sync()
    );

    // Downsampler and framebuffer

    wire [5:0] read_x = addr[7:2];
	wire [4:0] read_y = addr[12:8];
	wire [7:0] ds_read_data;
	downsample ds_i(
		.pixel_clock(video_clk),
		.in_line(in_line),
		.in_frame(!vsync),
		.pixel_data(payload_data),
		.data_enable(payload_frame&&payload_valid),

		.read_clock(sys_clk),
		.read_x(read_x),
		.read_y(read_y),
		.read_q(ds_read_data)
	);

    // Register and control interface

    wire [1:0] i2c_din;
    reg [1:0] i2c_gpio;
    reg [1:0] i2c_read;
    reg i2c_read_last;

    SB_IO #(
        .PIN_TYPE(6'b 1010_01),
        .PULLUP(1'b 1)
    ) scl_buf (
        .PACKAGE_PIN(cam_sda),
        .OUTPUT_ENABLE(!i2c_gpio[0]),
        .D_OUT_0(1'b0),
        .D_IN_0(i2c_din[0])
    );

    SB_IO #(
        .PIN_TYPE(6'b 1010_01),
        .PULLUP(1'b 1)
    ) sda_buf (
        .PACKAGE_PIN(cam_scl),
        .OUTPUT_ENABLE(!i2c_gpio[1]),
        .D_OUT_0(1'b0),
        .D_IN_0(i2c_din[1])
    );

    assign cam_enable = 1'b1;

    always @(posedge sys_clk) begin
        if (reset) begin
            i2c_gpio <= 2'b11;
            i2c_read <= 2'b11;
            i2c_read_last <= 1'b0;
        end else if (addr == 16'h0000 && valid) begin
            if (wstrb[0])
                i2c_gpio <= wdata[1:0];
            i2c_read <= i2c_din;
            i2c_read_last <= 1'b1;
        end else begin
            i2c_read_last <= 1'b0;
        end
    end

    always @(posedge sys_clk) begin
        if (reset) begin
            ready <= 1'b0;
        end else begin
            ready <= valid && (addr == 16'h0000 || addr[15:13] == 3'b100);
        end
    end

    assign rdata = i2c_read_last ? {30'b0, i2c_read} :
                                   {24'b0, ds_read_data};

    // Debugging
    reg [22:0] hb_ctr;
    always @(posedge video_clk)
        hb_ctr <= hb_ctr + 1'b1;
    assign cam_heartbeat = hb_ctr[22];
endmodule
