/*
 * Written Christmas 2019 by Niklas Ekström
 */
module amiga_frame_sampler(
   input                reset_n,

   input                clk,
   input                csync_n,
   input       [11:0]   am_rgb,

   output reg  [10:0]   wr_address,
   output reg           wr_en,
   output reg  [15:0]   wr_data,

   output reg           s_req,
   input                s_ack,
   output reg           s_cache_row,
   output reg  [9:0]    s_sdram_row,

   output reg           interlaced,
   output reg           field_no
   );

   localparam FULL_ROW_LENGTH           = 10'd908;
   localparam LEFT_HALF_ROW_LENGTH      = 10'd456;
   localparam RIGHT_HALF_ROW_LENGTH     = 10'd452;

   localparam NORMAL_PULSE_LENGTH       = 10'd68;
   localparam SHORT_PULSE_LENGTH        = 10'd32;
   localparam LONG_LEFT_PULSE_LENGTH    = 10'd388;
   localparam LONG_RIGHT_PULSE_LENGTH   = 10'd384;

   localparam X_START       = 10'd207;
   localparam Y_START       = 10'd42;

   localparam BOX_WIDTH     = 10'd640;
   localparam BOX_HEIGHT    = 10'd256;

   reg prev_ne_csync_n = 1'b1;
   reg csync_rising = 1'b0;

   always @(negedge clk)
   begin
      prev_ne_csync_n <= csync_n;
      csync_rising <= !prev_ne_csync_n && csync_n;
   end

   reg prev_pe_csync_n;
   always @(posedge clk)
      prev_pe_csync_n <= csync_n;

   wire csync_falling = prev_pe_csync_n && !csync_n;

   reg x_cnt_started = 1'b0;
   reg y_cnt_started = 1'b0;

   reg [9:0] x_cnt;
   reg [9:0] y_cnt;

   always @(posedge clk or negedge reset_n)
   begin
      if (!reset_n)
         x_cnt_started <= 1'b0;
      else if (csync_falling)
         x_cnt_started <= 1'b1;
   end

   always @(posedge clk)
   begin
      if (csync_falling)
         x_cnt <= 10'd0;
      else
         x_cnt <= x_cnt + 10'd1;
   end

   reg half_row_short = 1'b0;
   reg prev_half_row_short = 1'b0;
   reg lhr_first = 1'b0;

   always @(posedge clk or negedge reset_n)
   begin
      if (!reset_n)
      begin
         y_cnt_started <= 1'b0;

         half_row_short <= 1'b0;
         prev_half_row_short <= 1'b0;

         lhr_first <= 1'b0;
      end
      else
      begin
         if (x_cnt_started)
         begin
            if (csync_falling)
            begin
               if (x_cnt == FULL_ROW_LENGTH - 10'd1)
                  y_cnt <= y_cnt + 10'd1;
               else if (x_cnt == LEFT_HALF_ROW_LENGTH - 10'd1)
                  lhr_first <= !half_row_short && prev_half_row_short;
               else // if (x_cnt == RIGHT_HALF_ROW_LENGTH - 10'd1)
               begin
                  if (lhr_first || (!half_row_short && prev_half_row_short && y_cnt_started))
                  begin
                     if (lhr_first)
                     begin
                        y_cnt <= 10'd1;
                        interlaced <= field_no == 1'b1;
                     end
                     else
                     begin
                        y_cnt <= 10'd0;
                        interlaced <= field_no == 1'b0;
                     end

                     field_no <= !lhr_first;

                     y_cnt_started <= 1'b1;
                  end
                  else
                     y_cnt <= y_cnt + 10'd1;
               end

               prev_half_row_short <= half_row_short;
            end

            if (csync_rising)
               half_row_short <= (x_cnt < 10'd64);
         end
      end
   end

   wire [9:0] y_pos = y_cnt - (Y_START - 10'd1);
   wire [9:0] x_pos = x_cnt - (X_START - 10'd1);

   always @(posedge clk or negedge reset_n)
   begin
      if (!reset_n)
         wr_en <= 1'b0;
      else
      begin
         if (x_cnt_started && y_cnt_started && x_pos < BOX_WIDTH && y_pos < BOX_HEIGHT)
         begin
            wr_address <= {y_pos[0], x_pos};
            wr_en <= 1'b1;
            wr_data <= {4'd0, am_rgb};
         end
         else
            wr_en <= 1'b0;
      end
   end

   always @(posedge clk)
   begin
      if (x_cnt_started && y_cnt_started && x_pos == BOX_WIDTH && y_pos < BOX_HEIGHT)
      begin
         s_req <= !s_ack;
         s_cache_row <= y_pos[0];
         s_sdram_row <= {y_pos[8:0], field_no};
      end
   end

endmodule
