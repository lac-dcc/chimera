/*
 * Written Christmas 2019 by Niklas Ekström
 */
module sdram_controller(
   input                reset_n,
   input                clk,

   output               DRAM_CLK,
   output               DRAM_CKE,
   output               DRAM_LDQM,
   output               DRAM_UDQM,
   output               DRAM_CS_N,
   output               DRAM_RAS_N,
   output               DRAM_CAS_N,
   output               DRAM_WE_N,
   output reg  [1:0]    DRAM_BA,
   output reg  [12:0]   DRAM_ADDR,
   inout       [15:0]   DRAM_DQ,

   output      [10:0]   sc_rd_address,
   input       [15:0]   sc_rd_data,

   output reg  [10:0]   gc_wr_address,
   output reg           gc_wr_en,
   output reg  [15:0]   gc_wr_data,

   input                s_req,
   output reg           s_ack,
   input                s_cache_row,
   input       [9:0]    s_sdram_row,

   input                g_req,
   output reg           g_ack,
   input                g_cache_row,
   input       [9:0]    g_sdram_row
   );

   localparam CMD_NOP            = 3'b111;
   localparam CMD_ACTIVE         = 3'b011;
   localparam CMD_READ           = 3'b101;
   localparam CMD_WRITE          = 3'b100;
   localparam CMD_BURST_TERM     = 3'b110;
   localparam CMD_PRECHARGE      = 3'b010;
   localparam CMD_AUTO_REFRESH   = 3'b001;
   localparam CMD_LOAD_MODE      = 3'b000;

   reg s_request;
   reg g_request;

   always @(negedge clk)
   begin
      s_request <= s_req != s_ack;
      g_request <= g_req != g_ack;
   end

   assign DRAM_CLK = clk;
   assign DRAM_CKE = 1'b1;

   reg oe_n = 1'b1;
   assign DRAM_LDQM = oe_n;
   assign DRAM_UDQM = oe_n;

   assign DRAM_CS_N = 1'b0;

   reg [2:0] dram_command = CMD_NOP;
   assign DRAM_RAS_N = dram_command[2];
   assign DRAM_CAS_N = dram_command[1];
   assign DRAM_WE_N = dram_command[0];

   reg dram_drive_data = 1'b0;
   assign DRAM_DQ = dram_drive_data ? {4'd0, sc_rd_data[11:0]} : 16'bz;

   assign sc_rd_address = {s_cache_row, counter[9:0]};

   reg [3:0] state = 4'd0;
   reg [15:0] counter = 16'd0;

   localparam STATE_INIT_WAIT_200US = 4'd0;
   localparam STATE_INIT_WAIT_PRECHARGE = 4'd1;
   localparam STATE_INIT_WAIT_REFRESH = 4'd2;
   localparam STATE_PRE_MAIN_WAIT = 4'd3;
   localparam STATE_MAIN_WAIT = 4'd4;
   localparam STATE_MAIN_WAIT_REFRESH = 4'd5;
   localparam STATE_ACTIVATE_READ = 4'd6;
   localparam STATE_READ = 4'd7;
   localparam STATE_ACTIVATE_WRITE = 4'd8;
   localparam STATE_WRITE = 4'd9;

   always @(negedge clk or negedge reset_n)
   begin
      if (!reset_n)
      begin
         state <= STATE_INIT_WAIT_200US;
         counter <= 16'd0;
      end
      else
      begin
         case (state)
            STATE_INIT_WAIT_200US:
               begin
                  if (!counter[15])
                  begin
                     dram_command <= CMD_NOP;
                     oe_n = 1'b1;
                     DRAM_ADDR <= 13'd0;
                     dram_drive_data <= 1'b0;

                     gc_wr_en <= 1'b0;

                     counter <= counter + 16'd1;
                  end
                  else
                  begin
                     dram_command <= CMD_PRECHARGE;
                     DRAM_ADDR[10] <= 1'b1;
                     counter <= 16'd0;
                     state <= STATE_INIT_WAIT_PRECHARGE;
                  end
               end
            STATE_INIT_WAIT_PRECHARGE:
               begin
                  dram_command <= CMD_NOP;

                  if (!counter[2])
                     counter <= counter + 16'd1;
                  else
                  begin
                     counter <= 16'd0;
                     state <= STATE_INIT_WAIT_REFRESH;
                  end
               end
            STATE_INIT_WAIT_REFRESH:
               begin
                  if (!counter[7])
                  begin
                     if (counter[3:0] == 4'd0)
                        dram_command <= CMD_AUTO_REFRESH;
                     else
                        dram_command <= CMD_NOP;

                     counter <= counter + 16'd1;
                  end
                  else
                  begin
                     dram_command <= CMD_LOAD_MODE;
                     DRAM_ADDR <= 13'b0000000110011;
                     DRAM_BA <= 2'd0;
                     counter <= 16'd0;
                     state <= STATE_PRE_MAIN_WAIT;
                  end
               end
            STATE_PRE_MAIN_WAIT:
               begin
                  dram_command <= CMD_NOP;

                  if (!counter[3])
                     counter <= counter + 16'd1;
                  else
                  begin
                     counter <= 16'd0;
                     state <= STATE_MAIN_WAIT;
                  end
               end
            STATE_MAIN_WAIT:
               begin
                  counter <= 16'd0;
                  if (g_request)
                  begin
                     g_ack <= g_req;
                     dram_command <= CMD_ACTIVE;
                     DRAM_ADDR <= {3'd0, g_sdram_row};
                     DRAM_BA <= 2'd0;
                     state <= STATE_ACTIVATE_READ;
                  end
                  else if (s_request)
                  begin
                     s_ack <= s_req;
                     dram_command <= CMD_ACTIVE;
                     DRAM_ADDR <= {3'd0, s_sdram_row};
                     DRAM_BA <= 2'd0;
                     state <= STATE_ACTIVATE_WRITE;
                  end
                  else
                     dram_command <= CMD_NOP;
               end
            STATE_MAIN_WAIT_REFRESH:
               begin
                  dram_command <= CMD_NOP;

                  if (!counter[3])
                     counter <= counter + 16'd1;
                  else
                  begin
                     counter <= 16'd0;
                     state <= STATE_MAIN_WAIT;
                  end
               end
            STATE_ACTIVATE_READ:
               begin
                  dram_command <= CMD_NOP;

                  if (!counter[1])
                     counter <= counter + 16'd1;
                  else
                  begin
                     counter <= 16'd0;
                     state <= STATE_READ;
                  end
               end
            STATE_READ:
               begin
                  if (counter[9:0] < 10'd752)
                  begin
                     if (counter[2:0] == 3'd0)
                     begin
                        dram_command <= CMD_READ;
                        DRAM_ADDR <= {2'd0, counter[7:3] == 5'd31 || (counter[9:8] == 2'd2 && counter[7:3] == 5'd29), 2'd0, counter[7:0]};
                        DRAM_BA <= counter[9:8];
                     end
                     else if (counter[7:3] == 5'd31 && counter[2:0] == 3'd2)
                     begin
                        dram_command <= CMD_ACTIVE;
                        DRAM_ADDR <= {3'd0, g_sdram_row};
                        DRAM_BA <= counter[9:8] + 2'd1;
                     end
                     else
                        dram_command <= CMD_NOP;
                  end
                  else
                     dram_command <= CMD_NOP;

                  if (counter[9:0] < 10'd756)
                  begin
                     oe_n <= 1'b0;

                     if (counter[9:0] < 10'd4)
                        gc_wr_en <= 1'b0;
                     else
                     begin
                        gc_wr_en <= 1'b1;
                        gc_wr_address <= {g_cache_row, counter[9:0] - 10'd4};
                        gc_wr_data <= {4'd0, DRAM_DQ[11:0]};
                     end

                     counter <= counter + 16'd1;
                  end
                  else
                  begin
                     oe_n <= 1'b1;
                     gc_wr_en <= 1'b0;

                     counter <= 16'd0;
                     state <= STATE_MAIN_WAIT;
                  end
               end
            STATE_ACTIVATE_WRITE:
               begin
                  dram_command <= CMD_NOP;

                  if (!counter[1])
                     counter <= counter + 16'd1;
                  else
                  begin
                     counter <= 16'd0;
                     state <= STATE_WRITE;
                     dram_drive_data <= 1'b1;
                  end
               end
            STATE_WRITE:
               begin
                  if (counter[9:0] < 10'd752)
                  begin
                     oe_n <= 1'b0;
                     dram_drive_data <= 1'b1;

                     if (counter[2:0] == 3'd0)
                     begin
                        dram_command <= CMD_WRITE;
                        DRAM_ADDR <= {2'd0, counter[7:3] == 5'd31 || (counter[9:8] == 2'd2 && counter[7:3] == 5'd29), 2'd0, counter[7:0]};
                        DRAM_BA <= counter[9:8];
                     end
                     else if (counter[7:3] == 5'd31 && counter[2:0] == 3'd2)
                     begin
                        dram_command <= CMD_ACTIVE;
                        DRAM_ADDR <= {3'd0, s_sdram_row};
                        DRAM_BA <= counter[9:8] + 2'd1;
                     end
                     else
                        dram_command <= CMD_NOP;

                     counter <= counter + 16'd1;
                  end
                  else
                  begin
                     dram_command <= CMD_NOP;
                     dram_drive_data <= 1'b0;
                     oe_n <= 1'b1;
                     counter <= 16'd0;
                     state <= STATE_MAIN_WAIT;
                  end
               end
            default:
            begin
               counter <= 16'd0;
               state <= STATE_INIT_WAIT_200US;
            end
         endcase
      end
   end

endmodule
