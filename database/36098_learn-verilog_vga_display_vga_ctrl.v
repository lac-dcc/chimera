// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

/***********************************************************************************************

VGA Timings: http://martin.hinner.info/vga/timing.html

┌────────────────┬───────────┬────────────────────────────────┬────────────────────────────────┐
│                │           │             H Sync             │             V Sync             │
│  Display Mode  │ Clock/MHz ├───────┬───────┬────────┬───────┼───────┬───────┬────────┬───────┤
│                │           │ Sync  │ Back  │ Active │ Front │ Sync  │ Back  │ Active │ Front │
│                │           │ Pulse │ Porch │ Video  │ Porch │ Pulse │ Porch │ Video  │ Porch │
├────────────────┼───────────┼───────┼───────┼────────┼───────┼───────┼───────┼────────┼───────┤
│ 640 x 480 @ 60 │ 25.175    │ 96    │ 48    │ 640    │ 16    │ 2     │ 33    │ 480    │ 10    │
└────────────────┴───────────┴───────┴───────┴────────┴───────┴───────┴───────┴────────┴───────┘

***********************************************************************************************/

module vga_ctrl #(
    parameter PIX_REQ_OFFSET = 1, // default to 1
    parameter RGB_WIDTH = 16 // 16 = RGB-565, 24 = RGB-888
)
(
    input clk,
    input rst_n,
    input [RGB_WIDTH-1:0] in_rgb,

    output hsync,
    output vsync,
    output pix_data_req,
    output [9:0]  pix_x,
    output [9:0]  pix_y,
    output pix_valid,
    output [RGB_WIDTH-1:0] out_rgb
);

localparam DATA_0 = 10'd0;

localparam H_SYNC  = 10'd96,
           H_BACK  = 10'd48,
           H_SIZE  = 10'd640,
           H_FRONT = 10'd16,
           H_TOTAL = H_SYNC + H_BACK + H_SIZE + H_FRONT, // 800
           V_SYNC  = 10'd2,
           V_BACK  = 10'd33,
           V_SIZE  = 10'd480,
           V_FRONT = 10'd10,
           V_TOTAL = V_SYNC + V_BACK + V_SIZE + V_FRONT; // 525

    // 0 ~ 799
    reg [9:0] cnt_h;

    // 0 ~ 524
    reg [9:0] cnt_v;

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n)
            cnt_h <= DATA_0;
        else if (cnt_h == H_TOTAL - 1)
            cnt_h <= DATA_0;
        else
            cnt_h <= cnt_h + 1;
    end

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n)
            cnt_v <= DATA_0;
        else begin
            if (cnt_h == H_TOTAL - 1) begin
				if (cnt_v == V_TOTAL - 1)
					cnt_v <= DATA_0;
                else
					cnt_v <= cnt_v + 1;
            end else begin
                cnt_v <= cnt_v;
            end
        end
    end

    wire pix_v_sync_valid;

    assign pix_v_sync_valid = (cnt_v >= (V_SYNC + V_BACK))
                           && (cnt_v < (V_SYNC + V_BACK + V_SIZE)) ? 1'b1 : 1'b0;

    assign pix_valid = rst_n
			&& (cnt_h >= (H_SYNC + H_BACK))
            && (cnt_h < (H_SYNC + H_BACK + H_SIZE))
            && pix_v_sync_valid
            ? 1'b1 : 1'b0;

    assign pix_data_req = rst_n
			&& (cnt_h >= (H_SYNC + H_BACK - PIX_REQ_OFFSET))
            && (cnt_h < (H_SYNC + H_BACK + H_SIZE - PIX_REQ_OFFSET))
            && pix_v_sync_valid
            ? 1'b1 : 1'b0;

    assign pix_x = pix_data_req == 1'b1 ? (cnt_h - (H_SYNC + H_BACK - PIX_REQ_OFFSET)) : DATA_0;
    assign pix_y = pix_data_req == 1'b1 ? (cnt_v - (V_SYNC + V_BACK)) : DATA_0;

    assign hsync = cnt_h < H_SYNC ? 1'b1 : 1'b0;

    assign vsync = cnt_v < V_SYNC ? 1'b1 : 1'b0;

    assign out_rgb = pix_valid == 1'b1 ? in_rgb : {RGB_WIDTH{1'b0}};

endmodule
