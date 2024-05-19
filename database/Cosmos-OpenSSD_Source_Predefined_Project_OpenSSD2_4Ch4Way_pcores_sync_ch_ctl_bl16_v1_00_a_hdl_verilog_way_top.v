// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// way_top.v for Cosmos OpenSSD
// Copyright (c) 2014 Hanyang University ENC Lab.
// Contributed by Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>
//                Jaehyeong Jeong <jhjeong@enc.hanyang.ac.kr>
//                Yong Ho Song <yhsong@enc.hanyang.ac.kr>
//
// This file is part of Cosmos OpenSSD.
//
// Cosmos OpenSSD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3, or (at your option)
// any later version.
//
// Cosmos OpenSSD is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Cosmos OpenSSD; see the file COPYING.
// If not, see <http://www.gnu.org/licenses/>.
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Company: ENC Lab. <http://enc.hanyang.ac.kr>
// Engineer: Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>
// 
// Project Name: Cosmos OpenSSD
// Design Name: way controller
// Module Name: way_controller
// File Name: way_top.v
//
// Version: v1.1.0
//
// Description: 
//   - receive ftl request (program, read, erase, etc)
//   - trigger nand controller to deal with ftl request
//   - represent nand controller status by using status register
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.1.0
//   - extend trigger signal
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module way_controller (
  //system
  input  wire                                     i_bus_clk,
  input  wire                                     i_bus_rst,
  input  wire                                     i_nc_clk,
  input  wire                                     i_nc_rstn,
  
  //control
  output wire                                     o_maddr_ack,
  output wire       [`SLV_DATA_WD-1:0]            o_mem_addr,
  output wire                                     o_b2m_req,
  input  wire                                     i_b2m_cmplt,
  output wire                                     o_m2b_req,
  input  wire                                     i_m2b_cmplt,
  output wire       [`IO_WD-1:0]                  o_status,
  //channel arbitration
  output wire                                     o_ch_req,           //request channel authorit
  input  wire                                     i_ch_grt,           //grant channel authority 
  //page buffer interface
  output wire                                     o_pb_en,
  output wire                                     o_pb_we,
  output wire       [`NAND_PBAWIDTH-1:0]          o_pb_addr,
  input  wire       [`CIO_WD-1:0]                 i_pb_data_o,
  output wire       [`CIO_WD-1:0]                 o_pb_data_i,
  
  //host interface
  input  wire       [`WAY_REG-1:0]                i_slv_rd_sel,
  input  wire       [`WAY_REG-1:0]                i_slv_wr_sel,
  input  wire       [`SLV_DATA_WD-1:0]            i_slv_data,
  output reg        [`SLV_DATA_WD-1:0]            o_slv_data,
  //nand interface
  input  wire                                     i_clk_o,
  input  wire       [`CIO_WD-1:0]                 i_nand_dq,          //data input
  output wire       [`CIO_WD-1:0]                 o_nand_dq,          //data output
  output wire                                     o_nand_dq_t,        //data direction
  output wire                                     o_nand_cle,         //command latch enable
  output wire                                     o_nand_ale,         //address latch enable
  output wire                                     o_nand_ce_n,        //chip enable
  output wire                                     o_nand_we_n,        //write enable & clk
  output wire                                     o_nand_wr_n,        //read enable & w/r direction
  output wire                                     o_nand_wp_n,        //write protect
  input  wire                                     i_nand_rb,           //ready(1)/busy(0)
  input  wire                                     i_nand_dqs,  
  output wire                                     o_nand_dqs_t,
  //output wire                                     o_nand_prog_en,
  output wire                                     o_m_ch_cmplt,
  output wire                                     o_dqs_ce,
  output wire                                     o_sp_en,
  //output wire        [7:0]                        debug_0,
  output wire                                     o_prog_start ,
  output wire                                     o_prog_end   ,
  output wire                                     o_read_start ,
  output wire                                     o_read_end   ,
  output wire                                     o_erase_start,
  output wire                                     o_erase_end  ,
  output wire                                     o_op_fail
);
  
  //command trigger
  wire                                            w_cmd_we;
  reg                                             r_next_cmd_ack;
  //sub module
  wire              [`NADDR_WD-1:0]               w_nand_addr;
  wire              [`CMD_WD-1:0]                 w_cmd;
  reg                                             r_cmd_ack;
  wire                                            w_cmd_ack;
  wire                                            w_ready;
  
  //control register/wire
  reg               [`SLV_DATA_WD-1:0]            r_row_addr;
  reg               [`SLV_DATA_WD-1:0]            r_mem_addr;
  reg               [`SLV_DATA_WD-1:0]            r_col_addr; //fixme
  wire              [`CIO_WD-1:0]                 w_status;
  reg               [`SLV_DATA_WD-1:0]            r_command;
  
  wire                                            w_nand_wp_n; 
  
  //rb_filter
  reg  r_nand_rb_1 ;
  reg  r_nand_rb_2 ;
  wire w_nand_rb ;
  
  assign w_nand_rb = &{i_nand_rb, r_nand_rb_1, r_nand_rb_2} ;
  
  always @ (posedge i_nc_clk)
  begin
       r_nand_rb_1 <= i_nand_rb ;
       r_nand_rb_2 <= r_nand_rb_1 ;
  end
  
  assign o_mem_addr = r_mem_addr;
  assign o_nand_wp_n = w_nand_wp_n;
  
  //op_fail
  assign o_op_fail = |{w_status[1], w_status[0]};
  
//+-----------+-----------+-----------+-----------+-----------+-----------+-----------+-----------+
//|     7     |     6     |     5     |     4     |     3     |     2     |     1     |     0     |
//+-----------+-----------+-----------+-----------+-----------+-----------+-----------+-----------+
//|           |  dcache   |   module  | r/b signal|           |           |  n-1 page |   n page  |
//|(0)protect | (0)busy   |  (0)busy  | (0)busy   |    '0'    |    '0'    | (0) pass  | (0) pass  |
//|(1)writable| (1)ready  |  (1)ready | (1)ready  |           |           | (1) fail  | (1) fail  |
//+-----------+-----------+-----------+-----------+-----------+-----------+-----------+-----------+
  
//status register coding //fixme
`ifdef CLST4
  assign o_status[7] = w_nand_wp_n;                                           //write protect
  assign o_status[6] = &{w_status[30],w_status[22],w_status[14],w_status[6]}; //data cache ready
  assign o_status[5] = w_ready;                                               //module ready/busy
  assign o_status[4] = w_nand_rb;                                             //nand ready/busy
  assign o_status[3:2] = 'b0;
  assign o_status[1] = |{w_status[25],w_status[17],w_status[9], w_status[1]}; //n-1 page pass/fail
  assign o_status[0] = |{w_status[24],w_status[16],w_status[8], w_status[0]}; //n page pass/fail
`else `ifdef CLST2
  assign o_status[7] = w_nand_wp_n;                 //write protect
  assign o_status[6] = &{w_status[14],w_status[6]}; //data cache ready
  assign o_status[5] = w_ready;                     //module ready/busy
  assign o_status[4] = w_nand_rb;                   //nand ready/busy
  assign o_status[3:2] = 'b0;
  assign o_status[1] = |{w_status[9], w_status[1]}; //n-1 page pass/fail
  assign o_status[0] = |{w_status[8], w_status[0]}; //n page pass/fail
`else `ifdef CLST1
  assign o_status[7] = w_nand_wp_n; //write protect
  assign o_status[6] = w_status[6]; //data cache ready
  assign o_status[5] = w_ready;     //module ready/busy
  assign o_status[4] = w_nand_rb;   //nand ready/busy
  assign o_status[3:2] = 'b0;
  assign o_status[1] = w_status[1]; //n-1 page pass/fail
  assign o_status[0] = w_status[0]; //n page pass/fail
`endif `endif `endif
  
  // implement slave model registers
  always@(posedge i_bus_clk)//i_nc_clk
    begin: SLAVE_REG_WRITE_PROC
      if (i_bus_rst)
        begin
          r_row_addr       <= 'b0;
          r_mem_addr       <= 'b0;
          r_col_addr       <= 'b0;
          r_command        <= 'b0;
        end
      else
        if(w_ready) begin
          case (i_slv_wr_sel)
            `WAY_REG'b0001 : r_row_addr <= i_slv_data;
            `WAY_REG'b0010 : r_mem_addr <= i_slv_data;
            `WAY_REG'b0100 : r_col_addr <= i_slv_data;
            `WAY_REG'b1000 : r_command  <= i_slv_data;
            default : ;
          endcase
        end
    end // SLAVE_REG_WRITE_PROC
  
  // implement Slave model register read mux  
  always@( * )
    begin: SLAVE_REG_READ_PROC
      case (i_slv_rd_sel)
        `WAY_REG'b0001 : o_slv_data <= r_row_addr;
        `WAY_REG'b0010 : o_slv_data <= r_mem_addr;
        `WAY_REG'b0100 : o_slv_data <= r_command;
        `WAY_REG'b1000 : o_slv_data <= {o_status,o_status,o_status,o_status};
        default        : o_slv_data <= 32'h00000000;
      endcase
    end // SLAVE_REG_READ_PROC
  
  //command register write ack
  assign w_cmd_we = i_slv_wr_sel[`WAY_REG-1];
  
  //command trigger
  always@(posedge i_bus_clk) begin
    r_next_cmd_ack   <=  w_cmd_we;
    r_cmd_ack        <= ~w_cmd_we & r_next_cmd_ack;
  end
  
  reg r_cmd_ack_1;
  reg r_cmd_ack_2;
  
  always @ (posedge i_bus_clk)
  begin
       r_cmd_ack_1 <= r_cmd_ack;
       r_cmd_ack_2 <= r_cmd_ack_1;
  end
  
  assign w_cmd_ack = |{r_cmd_ack, r_cmd_ack_1, r_cmd_ack_2};
  
  //signal assign
  genvar i;
  generate
    for (i=0; i<`CMD_WD; i=i+1) begin : command
      assign w_cmd[i] = r_command[i];
    end
  endgenerate
  generate
    for (i=0; i<`CA_WD; i=i+1) begin : col_addr
      assign w_nand_addr[i] = r_col_addr[i];
    end
  endgenerate
  generate
    for (i=`CA_WD; i<`NADDR_WD; i=i+1) begin : row_nand_addr
      assign w_nand_addr[i] = r_row_addr[i-`CA_WD];
    end
  endgenerate
  
  sync_top nand_ctrl0 (
    .i_nc_clk                 (i_nc_clk),
    .i_nc_rstn                (i_nc_rstn),
    
    .i_command                (w_cmd),
    .i_cmd_ack                (w_cmd_ack),
    .o_maddr_ack              (o_maddr_ack),
    .o_b2m_req                (o_b2m_req),
    .i_b2m_cmplt              (i_b2m_cmplt),
    .o_m2b_req                (o_m2b_req),
    .i_m2b_cmplt              (i_m2b_cmplt),
    .o_ready                  (w_ready),
    .o_status                 (w_status),
    //channel arbitation
    .o_ch_req                 (o_ch_req),
    .i_ch_gnt                 (i_ch_grt),
    //page buffer
    .o_pb_addr                (o_pb_addr),
    .i_pb_data                (i_pb_data_o),
    .o_pb_data                (o_pb_data_i),
    .o_pb_en                  (o_pb_en),
    .o_pb_we                  (o_pb_we),

    //nand
    .i_clk_o                  (i_clk_o),
    .i_nand_addr              (w_nand_addr),
    .i_nand_dq                (i_nand_dq),
    .o_nand_dq                (o_nand_dq),
    .o_nand_dq_t              (o_nand_dq_t),
    .o_nand_cle               (o_nand_cle),
    .o_nand_ale               (o_nand_ale),
    .o_nand_ce_n              (o_nand_ce_n),
    .o_nand_we_n              (o_nand_we_n),
    .o_nand_wr_n              (o_nand_wr_n), 
    .o_nand_wp_n              (w_nand_wp_n),
    .i_nand_rb                (w_nand_rb),
    .i_nand_dqs               (i_nand_dqs),
    .o_nand_dqs_t             (o_nand_dqs_t),
    //.o_nand_prog_en           (o_nand_prog_en),
    .o_m_ch_cmplt             (o_m_ch_cmplt),
    .o_dqs_ce                 (o_dqs_ce),
    //.debug_0                  (debug_0),
    .o_sp_en                  (o_sp_en),
    .o_prog_start             (o_prog_start ),
    .o_prog_end               (o_prog_end   ),
    .o_read_start             (o_read_start ),
    .o_read_end               (o_read_end   ),
    .o_erase_start            (o_erase_start),
    .o_erase_end              (o_erase_end  )
    );
  
  //function - register width
  function integer clogb2;
    input [31:0] value;
    integer i;
    begin
      clogb2 = 0;
      for(i = 0; 2**i < value; i = i + 1)
        clogb2 = i + 1;
    end
  endfunction
  
endmodule
