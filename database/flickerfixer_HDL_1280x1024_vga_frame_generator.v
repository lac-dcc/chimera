/*
 * Written Christmas 2019 by Niklas Ekström
 */
module vga_frame_generator(
   input                reset_n,
   input                clk,

   output               vga_hs,
   output               vga_vs,
   output reg  [11:0]   vga_rgb,

   output reg  [10:0]   rd_address,
   input       [15:0]   rd_data,

   output reg           g_req,
   input                g_ack,
   output reg           g_cache_row,
   output reg  [9:0]    g_sdram_row,

   input                interlaced,
   input                field_no
   );

   // List of VGA timings: http://tinyvga.com/vga-timing

   // 1280x1024p@60Hz
   localparam H_SYNC    = 11'd112;
   localparam H_BACK    = 11'd248;
   localparam H_VISIBLE = 11'd1280;
   localparam H_FRONT   = 11'd48;
   localparam H_TOTAL   = 11'd1688;

   localparam V_SYNC    = 11'd3;
   localparam V_BACK    = 11'd38;
   localparam V_VISIBLE = 11'd1024;
   localparam V_FRONT   = 11'd1;
   localparam V_TOTAL   = 11'd1066;

   localparam X_START   = H_SYNC + H_BACK;
   localparam Y_START   = V_SYNC + V_BACK;

   localparam BOX_WIDTH = H_VISIBLE;
   localparam BOX_HEIGHT = V_VISIBLE;

   reg [10:0] h_cnt = 11'd0;
   reg [10:0] v_cnt = 11'd0;

   assign vga_hs = h_cnt >= H_SYNC;
   assign vga_vs = v_cnt >= V_SYNC;

   always @(posedge clk or negedge reset_n)
   begin
      if (!reset_n)
      begin
         h_cnt <= 11'd0;
         v_cnt <= 11'd0;
      end
      else
      begin
         if (h_cnt == H_TOTAL - 11'd1)
         begin 
            h_cnt <= 11'd0;

            if (v_cnt == V_TOTAL - 11'd1)
               v_cnt <= 11'd0;
            else
               v_cnt <= v_cnt + 11'd1;
         end
         else
            h_cnt <= h_cnt + 11'd1;
      end
   end

   wire [10:0] y_pos = v_cnt - Y_START;
   wire [10:0] addr_x_pos = h_cnt - (X_START - 11'd3);

   always @(posedge clk or negedge reset_n)
   begin
      if (!reset_n)
         rd_address <= 11'd0;
      else
      begin
         if (addr_x_pos < BOX_WIDTH && y_pos < BOX_HEIGHT)
            rd_address <= {y_pos[0], addr_x_pos[10:1]};
         else
            rd_address <= 11'd0;
      end
   end

   wire [10:0] col_x_pos = h_cnt - (X_START - 11'd1);

   always @(posedge clk or negedge reset_n)
   begin
      if (!reset_n)
      begin
         vga_rgb <= 12'h000;
      end
      else
      begin
         if (col_x_pos < BOX_WIDTH && y_pos < BOX_HEIGHT)
            vga_rgb <= rd_data[11:0];
         /*
         else if (v_cnt >= (V_SYNC + V_BACK) && v_cnt < (V_TOTAL - V_FRONT) && h_cnt >= (H_SYNC + H_BACK) && h_cnt < (H_TOTAL - H_FRONT))
         begin
            if (h_cnt[0])
               vga_rgb <= 12'h223;
            else
               vga_rgb <= 12'h333;
         end*/
         else
            vga_rgb <= 12'h000;
      end
   end

   wire [10:0] fetch_y_pos = v_cnt - (Y_START - 11'd1);

   always @(posedge clk)
   begin
      if (h_cnt == 0 && fetch_y_pos < BOX_HEIGHT)
      begin
         g_req <= !g_ack;
         g_cache_row <= fetch_y_pos[0];
         if (interlaced)
            g_sdram_row <= fetch_y_pos[10:1];
         else
            g_sdram_row <= {fetch_y_pos[10:2], field_no};
      end
   end

endmodule
