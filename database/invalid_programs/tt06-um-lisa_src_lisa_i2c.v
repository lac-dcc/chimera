// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

`include "i2c_master_defines.h"

`define I2C_REG_CLK_PRE_LSB   7'h20
`define I2C_REG_CLK_PRE_MSB   7'h21
`define I2C_REG_CTRL          7'h22
`define I2C_REG_RX            7'h23
`define I2C_REG_STATUS        7'h24
`define I2C_REG_TX            7'h25
`define I2C_REG_CMD           7'h26

module lisa_i2c
(
   input  wire          clk,
   input  wire          rst_n,

   input  wire[6:0]     d_addr,
   input  wire[7:0]     d_i,
   input  wire          d_periph,
   input  wire          d_we,
   output reg [7:0]     d_o,

   input  wire          scl_pad_i,
   output wire          scl_pad_o,
   output wire          scl_padoen_o,
   input  wire          sda_pad_i,
   output wire          sda_pad_o,
   output wire          sda_padoen_o
);

   // registers
   reg  [15:0]   r_pre;      // clock prescale register
   reg  [ 0:0]   r_ctrl;     // control register
   reg  [ 7:0]   r_tx;       // transmit register
   wire [ 7:0]   s_rx;       // receive register
   reg  [ 7:0]   r_cmd;      // command register
   wire [ 7:0]   s_status;   // status register

   // done signal: command completed, clear command register
   wire s_done;

   // core enable signal
   wire s_core_en;

   // status register signals
   wire s_irxack;
   reg  rxack;       // received aknowledge from slave
   reg  tip;         // transfer in progress
   reg  irq_flag;    // interrupt pending flag
   wire i2c_busy;    // bus busy (start signal detected)
   wire i2c_al;      // i2c bus arbitration lost
   reg  al;          // status register arbitration lost bit

   wire we_pre_lsb;
   wire we_pre_msb;
   wire we_ctrl;
   wire we_tx;
   wire we_cmd;

   //
   // module body
   //

   assign we_pre_lsb  = (d_periph && d_we) & (d_addr == `I2C_REG_CLK_PRE_LSB);
   assign we_pre_msb  = (d_periph && d_we) & (d_addr == `I2C_REG_CLK_PRE_MSB);
   assign we_ctrl     = (d_periph && d_we) & (d_addr == `I2C_REG_CTRL);
   assign we_tx       = (d_periph && d_we) & (d_addr == `I2C_REG_TX);
   assign we_cmd      = (d_periph && d_we) & (d_addr == `I2C_REG_CMD);

   always@(posedge clk)
   begin
      if (!rst_n)
      begin
         r_pre  <= 'h0;
         r_ctrl <= 'h0;
         r_tx   <= 'h0;
         r_cmd  <= 'h0;
      end
      else
      begin
         if (we_pre_lsb)
            r_pre[7:0]  <= d_i;
         
         if (we_pre_msb)
            r_pre[15:8]  <= d_i;
         
         if (we_ctrl)
            r_ctrl <= d_i[0:0];
         
         if (we_tx)
            r_tx   <= d_i;
         
         if (we_cmd)
         begin
            if(s_core_en)
               r_cmd <= d_i;
         end
         else
         begin
            if (s_done | i2c_al)
               r_cmd[7:4] <= 4'h0;          // clear command bits when done
                                            // or when aribitration lost
            r_cmd[2:1] <= 2'b0;             // reserved bits
            r_cmd[0]   <= 1'b0;             // clear IRQ_ACK bit
         end
     end
   end

   always @*
   begin
       case (d_addr)
           `I2C_REG_CLK_PRE_LSB:
               d_o = r_pre[7:0];
           `I2C_REG_CLK_PRE_MSB:
               d_o = r_pre[15:8];
           `I2C_REG_CTRL:
               d_o = {7'b0, r_ctrl};
           `I2C_REG_RX:
               d_o = s_rx;
           `I2C_REG_STATUS: 
               d_o = s_status;
           `I2C_REG_TX:    
               d_o = r_tx;
           `I2C_REG_CMD:
               d_o = r_cmd;
           default:
               d_o = 8'h0;
       endcase
   end

   // decode command register
   wire sta  = r_cmd[7];
   wire sto  = r_cmd[6];
   wire rd   = r_cmd[5];
   wire wr   = r_cmd[4];
   wire ack  = r_cmd[3];
   wire iack = r_cmd[0];

   // decode control register
   assign s_core_en = r_ctrl[0];

   // hookup byte controller block
   i2c_master_byte_ctrl byte_controller 
   (
      .clk      ( clk          ),
      .rst_n    ( rst_n        ),
      .ena      ( s_core_en    ),
      .clk_cnt  ( r_pre        ),
      .start    ( sta          ),
      .stop     ( sto          ),
      .read     ( rd           ),
      .write    ( wr           ),
      .ack_in   ( ack          ),
      .din      ( r_tx         ),
      .cmd_ack  ( s_done       ),
      .ack_out  ( s_irxack     ),
      .dout     ( s_rx         ),
      .i2c_busy ( i2c_busy     ),
      .i2c_al   ( i2c_al       ),
      .scl_i    ( scl_pad_i    ),
      .scl_o    ( scl_pad_o    ),
      .scl_oen  ( scl_padoen_o ),
      .sda_i    ( sda_pad_i    ),
      .sda_o    ( sda_pad_o    ),
      .sda_oen  ( sda_padoen_o )
   );

   // status register block + interrupt request signal
   always @(posedge clk)
   begin
      if (!rst_n)
      begin
         al       <= 1'b0;
         rxack    <= 1'b0;
         tip      <= 1'b0;
         irq_flag <= 1'b0;
      end
      else
      begin
         al       <= i2c_al | (al & ~sta);
         rxack    <= s_irxack;
         tip      <= (rd | wr);
         irq_flag <= (s_done | i2c_al | irq_flag) & ~iack; // interrupt request flag is always generated
      end
   end

   // assign status register bits
   assign s_status[7]   = rxack;
   assign s_status[6]   = i2c_busy;
   assign s_status[5]   = al;
   assign s_status[4:2] = 3'h0; // reserved
   assign s_status[1]   = tip;
   assign s_status[0]   = irq_flag;

endmodule
