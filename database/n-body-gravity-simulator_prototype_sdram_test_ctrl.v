// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module ctrl (
             clk,    // clk in from PLL = 100 MHz  
             //rst,    // CAS signal delay is 2 clocks
             switch,
             addr,
             dq,
             ba,
             ldqm,
             udqm,
             ras_n,
             cas_n,
             cke,
             outclk,
             we_n,
             cs_n,
             hex1,
             hex2,
             init_comp,
             cmd,
             cmd_sent,
             reply
             );
   
   input wire clk;
   input wire switch;
   input wire [3:0] cmd;
   input wire [1:0] cmd_sent;
   
   output wire [12:0] addr; // const addr for the test
   output reg [15:0]  dq;     
   output wire [1:0] ba;  // const addr for the test
   output wire ldqm;
   
   output wire udqm;
   output reg  ras_n;
   output reg  cas_n;
   output wire cke;
   
   output wire outclk;
   output reg  we_n;
   output reg  cs_n;
   output wire [6:0] hex1;
   
   output wire [6:0] hex2;
   output reg        reply;
   output reg        init_comp;
   
   reg [3:0]         state ;
   reg [2:0]         count_r;
   reg [2:0]         count_w;
   reg [7:0]         out;
   reg [15:0]        count;
   reg [2:0]         nop_count;
   reg [3:0]         next_state;
   reg [3:0]         cmd_reg;
   reg [3:0]         cmd_delay;
   
   parameter INIT_NOP = 4'd0;
   parameter INIT_PRE = 4'd1;
   parameter INIT_AUTO_REF1 = 4'd2;
   parameter INIT_AUTO_REF2 = 4'd3;
   parameter LOAD_MODE_REG = 4'd4;
   parameter GEN_NOP = 4'd5;
   parameter AWAIT_ACTIVE = 4'd6;
   parameter ROW_ACTIVE = 4'd7;
   parameter READ = 4'd8;
   parameter WRITE = 4'd9;
   
   parameter INIT_DELAY = 15000;
   parameter PRE_DELAY = 2;
   parameter AUTO_REF_DELAY = 6;
   parameter LOAD_MODE_DELAY = 2;
   parameter CAS_DELAY = 2;
   
   assign outclk = clk;
   always @(*)
     begin
        if (state >= AWAIT_ACTIVE && state != GEN_NOP)
          begin
             init_comp <= 'b1;
          end
        else
          begin
             init_comp <= 'b0;
          end
     end
   always @(posedge clk or negedge switch)
     begin
        if (switch == 'b0)
          begin
             cmd_reg <= 'b0;
          end
        else
          begin
             if (cmd_sent == 2'b01)
               cmd_reg <= cmd;
             else
               if (cmd_delay == 'b0 && init_comp == 'b1)
                 cmd_reg <= AWAIT_ACTIVE;
          end
     end
   // bin27seg dev1 (
   //                .in(),
   //                .out(hex1)  // 7-seg out
   //                );
   // bin27seg dev2 (
   //                .in(),
   //                .out(hex2)
   //                );

   reg                state_trans;

   always @(*)
     begin
        if ((state == INIT_NOP && count == INIT_DELAY) || 
            (state == INIT_PRE && count == 0) ||
            (state == INIT_AUTO_REF1 && count == 0) ||
            (state == INIT_AUTO_REF2 && count == 0) ||
            (state == LOAD_MODE_REG && count == 0) ||
            (state == GEN_NOP && nop_count == 'b0))
          begin
             state_trans <= 'b1;
          end
        else
          begin
             state_trans <= 'b0;
          end // else: !if((state == INIT_NOP && count == INIT_DELAY) ||...
     end // always @ (*)
   
   always @(posedge clk or negedge switch)
     begin
        if (switch == 'b0)
          begin 
             out <= 'b0;
             count <= 'b0;
             cs_n <= 'b1;
          end
        else
          begin
             if (state_trans == 'b0)
               begin
                  count <= count + 'b1;
                  cs_n <= 'b0;
               end
             else
               begin
                  count <= 'b0;
               end
          end
     end



   
   always @(posedge clk or negedge switch)        // state machine for 1 write and 1 read from same location
     begin
        if (switch == 'b0)
          begin
             state <= INIT_NOP;
             cmd_delay <= 'b0;
          end
        else
          begin
             if (cmd_delay != 'b0)
               begin
                  cmd_delay <= cmd_delay - 'b1;
                  reply <= 'b0;
               end
             else
               if (cmd_delay == 'b0 && init_comp == 'b1)
                 begin
                    reply <= 'b1;
                 end
               else
                 begin
                    reply <= 'b0;
                 end
             case (state)
               INIT_NOP:                     // NOP->LLHH->ROW_ACTIVE         
                 begin
                    if (count == INIT_DELAY)
                      begin
                         state <= INIT_PRE;
                      end
                 end
               INIT_PRE:
                 begin
                    if (state_trans)
                      begin
                         next_state <= INIT_AUTO_REF1;
                         state <= GEN_NOP;
                         nop_count <= PRE_DELAY - 1;   
                      end
                 end
               INIT_AUTO_REF1:
                 begin

                    if (state_trans)
                      begin
                         //state <= INIT_AUTO_REF2;
                         next_state <= INIT_AUTO_REF2;
                         state <= GEN_NOP;
                         nop_count <= AUTO_REF_DELAY - 1;
                      end
                 end

               INIT_AUTO_REF2:
                 begin

                    if (state_trans)
                      begin
                         next_state <= LOAD_MODE_REG;
                         state <= GEN_NOP;
                         nop_count <= AUTO_REF_DELAY - 1;
                      end
                 end

               LOAD_MODE_REG:
                 begin
                    if (state_trans)
                      begin
                         state <= GEN_NOP;
                         next_state <= AWAIT_ACTIVE;
                         nop_count <= LOAD_MODE_DELAY - 1;
                      end
                 end

               GEN_NOP:
                 begin
                    if (nop_count == 'b0 && next_state != GEN_NOP)
                      begin
                         state <= next_state;
                      end
                    else if (nop_count != 'b0)
                      begin
                         nop_count <= nop_count - 'b1;
                      end
                 end
               AWAIT_ACTIVE:
                 begin
                    state <= ROW_ACTIVE;
                    case (cmd)
                      READ:
                        begin
                           cmd_delay <= 4'd4;
                        end
                      WRITE:
                        begin
                           cmd_delay <= 4'd7;
                        end
                      default:
                        begin
                           cmd_delay <= 4'd2;
                        end
                    endcase // case (cmd)
                 end
             
             
               ROW_ACTIVE:              // ROW_ACTIVE->LHLH->READ
                 begin
                    case (cmd_reg)
                      READ:
                        begin
                           state <= READ;
                        end
                      WRITE:
                        begin
                           state <= WRITE;
                        end
                    endcase
                 end

               READ:                    // READ->LHHL->ROW_ACTIVE
                 begin
                    if (cmd_delay == 'b0)
                      begin
                         state <= AWAIT_ACTIVE;
                      end
                 end

               WRITE:                   // WRITE->LHHL->ROW_ACTIVE
                 begin
                    if (cmd_delay == 'b0)
                      begin
                         state <= AWAIT_ACTIVE;
                      end
                 end
               default: state <= INIT_NOP;
             endcase
          end
     end
   //Debug Wires
   wire ini_stage_end;
   assign ini_stage_end = (state == GEN_NOP);
   
endmodule

