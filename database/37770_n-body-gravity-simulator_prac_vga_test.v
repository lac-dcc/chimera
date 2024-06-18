// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module vga_test (
                 inclk,
                 rst,
                 r,
                 g,
                 b,
                 hsync,
                 vsync,
                 blank,
                 outclk,
					  sync
                 );
   
   input wire inclk;
   input wire rst;
	wire clk;
   output reg [7:0] r;
   output reg [7:0] g;
   output reg [7:0] b;
   output reg       hsync;    // active low
   output reg       vsync;    // active low
   output wire      blank;
   output wire       outclk;   // same as input clk
   output wire sync;

   assign outclk = clk;
   
   parameter COL = 639;
   parameter H_SYNC = 95;
   parameter H_FRONT = 15;
   parameter H_BACK = 47;

   parameter ROW = 479;
   parameter V_SYNC = 1;
   parameter V_FRONT = 9;
   parameter V_BACK = 32;

   parameter H_STATE_VID   = 2'd0;
   parameter H_STATE_FRONT = 2'd1;
   parameter H_STATE_SYNC  = 2'd2;
   parameter H_STATE_BACK  = 2'd3;

   parameter V_STATE_VID   = 2'd0;
   parameter V_STATE_FRONT = 2'd1;
   parameter V_STATE_SYNC  = 2'd2;
   parameter V_STATE_BACK  = 2'd3;

   vga_clk clkin(
		 .refclk(inclk),
		 .rst(0),
		 .outclk_0(clk),
		 .locked(lckd)
                 );
   wire lcked;
   reg [1:0]        h_state;
   reg [1:0]        v_state;
   reg              temp_blank;    // active low
   reg [9:0]           col_ct;
   reg [6:0]           h_sync_ct ;
   reg [3:0]           h_front_ct;
   reg [5:0]           h_back_ct;
   reg                 line_over;
   reg [8:0]           row_ct;
   reg                 v_sync_ct;
   reg [3:0]           v_front_ct;
   reg [5:0]           v_back_ct;

   // Debug Signals
   wire                frame_over;
   
   always @(posedge clk)
     begin
        if (rst == 'b0)
          begin
             r          <= 'b0;
             g          <= 'b0;
             b          <= 'b0;
             h_state    <= H_STATE_VID;
             v_state    <= V_STATE_VID;
             col_ct     <= 'b0;
             h_sync_ct  <= 'b0;
             h_front_ct <= 'b0;
             h_back_ct  <= 'b0;
             row_ct     <= 'b0;
             v_sync_ct  <= 'b0;
             v_front_ct <= 'b0;
             v_back_ct  <= 'b0;
             hsync <= 'b1;
             vsync <= 'b1;
          end
        else
          begin
             //outclk <= clk;
             if (h_state == H_STATE_VID && v_state == V_STATE_VID)
               begin
                  r <= 8'b11111111;
                  g <= 8'b11111111;
                  b <= 8'b11111111;
               end
             else
               begin
                  r <= 'b0;
                  g <= 'b0;
                  b <= 'b0;
               end // else: !if(h_state == H_STATE_VID && v_state == V_STATE_VID)
             
             case (h_state)
               H_STATE_VID:
                 begin
                    hsync <= 'b1;
                    col_ct <= col_ct +'b1;
                    line_over <= 'b0;
                    if (col_ct == COL)
                      begin
                         h_front_ct <= 'b0;
                         h_state <= H_STATE_FRONT;
                         col_ct <='b0;
                      end
                 end
               H_STATE_FRONT:
                 begin
                    h_front_ct <= h_front_ct + 'b1;
                    if (h_front_ct == H_FRONT)
                      begin
                         hsync <= 'b0;
                         h_sync_ct <= 'b0;
                         h_state <= H_STATE_SYNC;
                      end
                 end
               H_STATE_SYNC:
                 begin
                    h_sync_ct <= h_sync_ct + 'b1;
                    if (h_sync_ct == H_SYNC)
                      begin
                         hsync <= 'b1;
                         h_back_ct <= 'b0;
                         h_state <= H_STATE_BACK;
                      end
                 end
               H_STATE_BACK:
                 begin
                    h_back_ct <= h_back_ct + 'b1;
                    if (h_back_ct == H_BACK)
                      begin
                         col_ct <= 'b0;
                         h_state <= H_STATE_VID;
                         line_over <= 'b1;
                      end
                    else
                      begin
                         h_state <= H_STATE_BACK;
                         line_over <= 'b0;
                      end
                 end
               default:
                 begin
                    col_ct <= 'b0;
                    h_state <= H_STATE_VID;
                    line_over <= 'b0;
                 end
             endcase

               case (v_state)
                 V_STATE_VID:
                   begin
                      if (line_over == 'b1)
                        begin
                           row_ct <= row_ct + 'b1;
                        end
                      if (row_ct == ROW && line_over == 'b1)
                        begin
                           row_ct <= 'b0;
                           v_state <= V_STATE_FRONT;
                           vsync <= 'b1;
                        end
                   end
                 V_STATE_FRONT:
                   begin
                      if (line_over == 'b1)
                        begin
                           v_front_ct <= v_front_ct + 'b1;
                        end
                      if (v_front_ct == V_FRONT && line_over == 'b1)
                        begin
                           v_front_ct <= 'b0;
                           v_state <= V_STATE_SYNC;
                           vsync <= 'b0;
                        end
                   end
                 V_STATE_SYNC:
                   begin
                      if (line_over == 'b1)
                        begin
                           v_sync_ct <= v_sync_ct + 'b1;
                        end
                      if (v_sync_ct == V_SYNC && line_over == 'b1)
                        begin
                           v_sync_ct <= 'b0;
                           v_state <= V_STATE_BACK;
                           vsync <= 'b1;
                        end
                   end
                 V_STATE_BACK:
                   begin
                      if (line_over == 'b1)
                        begin
                           v_back_ct <= v_back_ct + 'b1;
                        end
                      if (v_back_ct == V_BACK && line_over == 'b1)
                        begin
                           v_back_ct <= 'b0;
                           v_state <= V_STATE_VID;
                        end
                   end
                 default:
                   begin
                      row_ct <= 'b0;
                      v_state <= V_STATE_VID;
                      vsync <= 'b1;
                   end
               endcase
          end // else: !if(rst == 'b0)
     end // always @ (posedge clk or negedge rst)
   assign blank  = vsync && hsync;  // didnt understand this signal
   assign frame_over = (v_back_ct == V_BACK && line_over == 'b1) ? 1'b1 : 1'b0;
   assign sync = 1'b1;
   
endmodule
