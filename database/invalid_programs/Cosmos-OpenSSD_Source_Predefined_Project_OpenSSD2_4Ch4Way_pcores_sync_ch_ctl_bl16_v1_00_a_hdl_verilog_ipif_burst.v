//////////////////////////////////////////////////////////////////////////////////
// ipif_burst.v for Cosmos OpenSSD
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
// Design Name: ipif burst interface
// Module Name: ipif
// File Name: ipif_burst.v
//
// Version: v1.3.0
//
// Description: 
//   - storage controller top module
//   - AXI4-lite & AXI4-burst interface
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.3.0
//   - to adjust propagation delay, insert IDELAYE2
//
// * v1.2.0
//   - to control dqs signal, insert BUFGCE
//
// * v1.1.0
//   - to generage dqs signal, insert pll module
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module ipif #(
  //bus protocol parameters
  parameter         C_SLV_DWIDTH                  = `SLV_DATA_WD,
  parameter         C_MST_AWIDTH                  = `MST_ADDR_WD,
  parameter         C_MST_DWIDTH                  = `MST_DATA_WD,
  parameter         C_NUM_REG                     = `NUM_REG+2,//`NUM_REG+4,
  parameter         C_NUM_INTR                    = 1
)(
  // -- system bus protocol
  input   wire                                    Bus2IP_Clk,
  input   wire                                    Bus2IP_Resetn,
  input   wire      [`SLV_ADDR_WD   -1:0]         Bus2IP_Addr,
  input   wire      [C_SLV_DWIDTH   -1:0]         Bus2IP_Data,
  input   wire                                    Bus2IP_RNW,
  input   wire      [C_SLV_DWIDTH/8 -1:0]         Bus2IP_BE,
  input   wire      [C_NUM_REG      -1:0]         Bus2IP_RdCE,
  input   wire      [C_NUM_REG      -1:0]         Bus2IP_WrCE,
  output  wire      [C_SLV_DWIDTH   -1:0]         IP2Bus_Data,
  output  wire                                    IP2Bus_RdAck,
  output  wire                                    IP2Bus_WrAck,
  output  wire                                    IP2Bus_Error, 
  
  // -- data bus protocol
  output  wire                                    IP2Bus_MstRd_Req,
  output  wire                                    IP2Bus_MstWr_Req,
  output  wire      [C_MST_AWIDTH   -1:0]         IP2Bus_Mst_Addr,
  output  wire      [C_MST_DWIDTH/8 -1:0]         IP2Bus_Mst_BE, 
  output  wire      [`DMA_LEN-1       :0]         IP2Bus_Mst_Length,
  output  wire                                    IP2Bus_Mst_Type,
  output  wire                                    IP2Bus_Mst_Lock,
  output  wire                                    IP2Bus_Mst_Reset,
  input   wire                                    Bus2IP_Mst_CmdAck,
  input   wire                                    Bus2IP_Mst_Cmplt,
  input   wire                                    Bus2IP_Mst_Error,
  input   wire                                    Bus2IP_Mst_Rearbitrate,
  input   wire                                    Bus2IP_Mst_Cmd_Timeout,
  input   wire      [C_MST_DWIDTH   -1:0]         Bus2IP_MstRd_d,
  input   wire      [C_MST_DWIDTH/8 -1:0]         Bus2IP_MstRd_rem,
  input   wire                                    Bus2IP_MstRd_sof_n,
  input   wire                                    Bus2IP_MstRd_eof_n,
  input   wire                                    Bus2IP_MstRd_src_rdy_n,
  input   wire                                    Bus2IP_MstRd_src_dsc_n,
  output  wire                                    IP2Bus_MstRd_dst_rdy_n,
  output  wire                                    IP2Bus_MstRd_dst_dsc_n,
  output  wire      [C_MST_DWIDTH   -1:0]         IP2Bus_MstWr_d,
  output  wire      [C_MST_DWIDTH/8 -1:0]         IP2Bus_MstWr_rem,
  output  wire                                    IP2Bus_MstWr_sof_n,
  output  wire                                    IP2Bus_MstWr_eof_n,
  output  wire                                    IP2Bus_MstWr_src_rdy_n,
  output  wire                                    IP2Bus_MstWr_src_dsc_n,
  input   wire                                    Bus2IP_MstWr_dst_rdy_n,
  input   wire                                    Bus2IP_MstWr_dst_dsc_n,
  //----------------------------------------------------------------------------
  //nand controller
  input   wire                                    i_clk       ,
  input   wire                                    i_clk_200   ,
  input   wire                                    i_rstn      ,
  input   wire      [`CIO_WD*`CH-1:0]             i_nand_dq_i ,             //data input
  output  reg       [`CIO_WD*`CH-1:0]             o_nand_dq_o ,             //data output
  output  reg       [`CIO_WD*`CH-1:0]             o_nand_dq_t ,             //data direction
  output  reg                                     o_nand_cle  ,             //command latch enable
  output  reg                                     o_nand_ale  ,             //address latch enable
  output  reg       [`CLST*`CH*`WAY-1:0]          o_nand_ce_n ,             //chip enable
  output  wire                                    o_nand_clk  ,             //write enable & clk
  output  reg                                     o_nand_wr_n ,             //read enable & wr
  output  reg                                     o_nand_wp_n ,             //write protect
  input   wire      [`CLST*`CH*`WAY-1:0]          i_nand_rb   ,             //ready(1)/busy(0)
  input   wire                                    i_nand_dqs  ,
  output  wire                                    o_nand_dqs  ,
  output  reg                                     o_nand_dqs_t,
  output  wire      [`WAY-1:0]                    o_prog_start ,
  output  wire      [`WAY-1:0]                    o_prog_end   ,
  output  wire      [`WAY-1:0]                    o_read_start ,
  output  wire      [`WAY-1:0]                    o_read_end   ,
  output  wire      [`WAY-1:0]                    o_erase_start,
  output  wire      [`WAY-1:0]                    o_erase_end  ,
  output  wire      [`WAY-1:0]                    o_op_fail
);
  
  // nand_controller

  //host interface
  wire              [`SLV_DATA_WD-1 :0]           w_slv_i_data;
  wire              [`SLV_DATA_WD-1:0]            w_slv_o_data;
  wire              [`SLV_ADDR_WD-1:0]            w_slv_addr;
  wire              [`MST_ADDR_WD-1:0]            w_dma_addr;
  wire              [`DMA_LEN-1:0]                w_dma_length;
  wire              [`MST_DATA_WD-1:0]            w_dma_i_data;
  wire              [`MST_DATA_WD-1:0]            w_dma_o_data;
  
  //nand interface
  wire              [`CIO_WD*`CH-1:0]             l_nand_dq_o;             //data output
  wire              [`CIO_WD*`CH-1:0]             l_nand_dq_t;             //data direction
  wire              [`CLST*`CH-1:0]               l_nand_cle;              //command latch enable
  wire              [`CLST*`CH-1:0]               l_nand_ale;              //address latch enable
  wire              [`CLST*`CH*`WAY-1:0]          l_nand_ce_n;             //chip enable
  wire              [`CLST*`CH-1:0]               l_nand_we_n;             //write enable
  wire              [`CLST*`CH-1:0]               l_nand_wr_n;             //read enable
  wire              [`CLST*`CH-1:0]               l_nand_wp_n;             //write protect
  
  wire              [`CIO_WD*`CH-1:0]             w_nand_dq_i;
  wire              [`CIO_WD*`CH-1:0]             w_nand_dq_o;
  wire              [`CIO_WD*`CH-1:0]             b_nand_dq_o;
  wire              [`CH-1:0]                     w_nand_dq_t;
  wire              [`CH-1:0]                     w_nand_cle ;
  wire              [`CH-1:0]                     w_nand_ale ;
  wire              [`CH*`WAY-1:0]                w_nand_ce_n;
  wire              [`CH-1:0]                     w_nand_we_n;
  wire              [`CH-1:0]                     w_nand_wr_n;
  wire              [`CH-1:0]                     w_nand_wp_n;
  wire              [`CH*`WAY-1:0]                w_nand_rb;
  reg               [`CH*`WAY-1:0]                r_nand_rb; 
  reg               [`CIO_WD*`CH-1:0]             r_nand_dq_o;
  reg               [`CH-1:0]                     r_nand_we_n;
  
  wire                                            w_nand_dqs_i;
  wire                                            l_nand_dqs_t;
  wire              [`CH-1:0]                     w_nand_dqs_t;
  wire                                            b_nand_dqs;
  wire                                            w_clk_o;
  wire              [`CH-1:0]                     w_m_ch_cmplt;
  wire                                            w_dqs_ce;
  reg                                             r_dqs_ce;
  
  wire                                            w_read_sp_ack;
  wire                                            w_prog_sp_ack;
  wire                                            w_slv_wr_ack;
  wire                                            w_slv_rd_ack;
  //wire                                            w_write_pm_ack;
  //wire                                            w_read_pm_ack;
  
  reg                                             r_b2ip_cmd_ack;
  wire                                            w_b2ip_cmd_ack;
  reg                                             r_b2ip_cmplt;
  wire                                            w_b2ip_cmplt;
  
  //register selection
  wire              [`NUM_REG-1:0]                w_reg_rd_sel;
  wire              [`NUM_REG-1:0]                w_reg_wr_sel;
  reg               [`NUM_REG-1:0]                f_reg_rd_sel;
  reg               [`NUM_REG-1:0]                f_reg_wr_sel;
  
  //bus signal
  assign  IP2Bus_WrAck     = |{f_reg_wr_sel, w_prog_sp_ack};//|Bus2IP_WrCE;
  assign  IP2Bus_RdAck     = |{f_reg_rd_sel, w_read_sp_ack};//|Bus2IP_RdCE;
  assign  IP2Bus_Error     = 0;
  assign  w_slv_wr_ack  = |{w_reg_wr_sel};
  assign  w_slv_rd_ack  = |{w_reg_rd_sel};
  
  assign  w_b2ip_cmd_ack = |{Bus2IP_Mst_CmdAck, r_b2ip_cmd_ack};
  assign  w_b2ip_cmplt   = |{Bus2IP_Mst_Cmplt, r_b2ip_cmplt};
  
  always @ (posedge i_clk)//(posedge Bus2IP_Clk)
  begin
       r_b2ip_cmd_ack <= Bus2IP_Mst_CmdAck;
  end
  
  always @ (posedge i_clk)//(posedge Bus2IP_Clk)
  begin
       r_b2ip_cmplt <= Bus2IP_Mst_Cmplt;
  end
  
  // ------------------------------------------------------------
  // ip to bus signals
  // ------------------------------------------------------------
  assign IP2Bus_Data    = w_slv_o_data;
  
  // ------------------------------------------------------------
  // module instance
  // ------------------------------------------------------------
  genvar i;
  
  //bit order convert
  generate
    for ( i=0; i<`NUM_REG; i=i+1 ) begin : reg_select
      assign w_reg_rd_sel[i] = Bus2IP_RdCE[i];
      assign w_reg_wr_sel[i] = Bus2IP_WrCE[i];
    end
  endgenerate
  
  always @ (*)
  begin
       if(Bus2IP_Addr[7])
       begin
            f_reg_wr_sel <= 'b0;
            f_reg_rd_sel <= 'b0;
       end
       
       else
       begin
            f_reg_wr_sel <= w_reg_wr_sel;
            f_reg_rd_sel <= w_reg_rd_sel;
       end
  end
  
  generate
    for ( i=0; i<`SLV_DATA_WD; i=i+1 ) begin : system_bus_d
      assign w_slv_i_data[i] = Bus2IP_Data[i];
    end
  endgenerate
  
  generate
  for ( i=0; i<`SLV_ADDR_WD; i=i+1 ) begin : slv_addr
    assign w_slv_addr[i] = Bus2IP_Addr[i];
  end
  endgenerate
  
  generate
    for ( i=0; i<`CIO_WD*`CH; i=i+1 ) begin : nand_dq
      assign w_nand_dq_i[i]  = i_nand_dq_i[i];
      assign l_nand_dq_o[i]  = w_nand_dq_o[i];
      assign l_nand_dq_t[i]  = w_nand_dq_t;
    end
  endgenerate 
  
  generate
    for (i=0; i<(`CLST*`CH*`WAY); i=i+1) begin : nand_a
      assign l_nand_ce_n[i]  = w_nand_ce_n[i/`CLST];
    end
    for (i=0; i<(`CLST*`CH); i=i+1) begin : nand_b
      assign l_nand_cle[i]  = w_nand_cle;
      assign l_nand_ale[i]  = w_nand_ale;
      assign l_nand_wp_n[i] = w_nand_wp_n;
    end
  endgenerate
  
  assign l_nand_we_n  = w_nand_we_n;
  assign l_nand_wr_n  = w_nand_wr_n;
  assign w_nand_rb    = i_nand_rb;
  assign l_nand_dqs_t = w_nand_dqs_t;
  
  // ------------------------------------------------------------
  //for data bus
  // ------------------------------------------------------------
  generate
    for ( i=0; i<`MST_DATA_WD; i=i+1 ) begin : data_bus_read_d
      assign w_dma_i_data[i] = Bus2IP_MstRd_d [i];
    end
  endgenerate
  
  generate 
    for(i=0;i<`MST_ADDR_WD;i=i+1)
    begin : data_bus_a
         assign IP2Bus_Mst_Addr[i] = w_dma_addr[i];
    end
  endgenerate
  
  generate
    for ( i=0; i<`DMA_LEN; i=i+1 ) begin : dma_length
      assign IP2Bus_Mst_Length[i] = w_dma_length[i];
    end
  endgenerate
  
  assign  IP2Bus_Mst_BE    = 8'hff ;
  assign  IP2Bus_Mst_Type  = IP2Bus_MstRd_Req|IP2Bus_MstWr_Req;
  assign  IP2Bus_Mst_Lock  = 0;
  assign  IP2Bus_Mst_Reset = 0;
  assign  IP2Bus_MstWr_d   = w_dma_o_data; 
  assign  IP2Bus_MstWr_rem = 0;
  
  //drive output
  always@ (posedge i_clk) begin
    r_nand_dq_o  <= l_nand_dq_o;
    o_nand_dq_t  <= l_nand_dq_t;
    o_nand_cle   <= l_nand_cle;
    o_nand_ale   <= l_nand_ale;
    o_nand_ce_n  <= l_nand_ce_n;
    r_nand_we_n  <= l_nand_we_n; //we
    o_nand_wr_n  <= l_nand_wr_n; //re
    o_nand_wp_n  <= l_nand_wp_n;
    o_nand_dqs_t <= l_nand_dqs_t;  
  end
  
  assign b_nand_dq_o = r_nand_dq_o ;
  always @ (posedge i_clk_200) //posedge
  begin
       o_nand_dq_o <= b_nand_dq_o;
  end
  
  //clk out
  assign o_nand_clk = (w_m_ch_cmplt) ? w_clk_o : r_nand_we_n ; 
  
  //dqs out
  always @ (posedge i_clk)
  begin
       r_dqs_ce <= w_dqs_ce;
  end
  
  always@(posedge i_clk) begin
    r_nand_rb <= w_nand_rb;
  end

    IDELAYCTRL IDELAYCTRL_INST (
    .REFCLK(i_clk_200), //default 200MHz
    .RST(~i_rstn),
    .RDY()
    );
    
  IDELAYE2 #(
  .CINVCTRL_SEL          ("FALSE"),
  .DELAY_SRC             ("IDATAIN"),
  .HIGH_PERFORMANCE_MODE ("TRUE"),
  .IDELAY_TYPE           ("FIXED"),
  .IDELAY_VALUE          (31),   //from 0 to 31
  .PIPE_SEL              ("FALSE"),
  .REFCLK_FREQUENCY      (200.0),
  .SIGNAL_PATTERN        ("DATA")
  )IODELAY_INST (
  .CNTVALUEOUT(), //don't use
  .DATAOUT    (w_nand_dqs_i),
  .C          (1'b0),
  .CE         (1'b0),
  .CINVCTRL   (1'b0),
  .CNTVALUEIN (5'b0), //don't use
  .DATAIN     (1'b0),  //don't use
  .IDATAIN    (i_nand_dqs),
  .INC        (1'b0),
  .LD         (1'b0),
  .LDPIPEEN   (1'b0),
  .REGRST     (1'b0)
  );
 
 
 
 //pll_50M
  pll_50M pll(
  .CLK_IN1(i_clk),
  .CLK_OUT1(w_clk_o),  //50M
  .RESET(!i_rstn),
  .LOCKED());
  
  BUFGCE dqs_buf(
  .O(b_nand_dqs),
  .CE(!r_dqs_ce),
  .I(w_clk_o));
  
  buf buf_dqs(o_nand_dqs, b_nand_dqs);
  
  generate
    for (i=0; i<`CH; i=i+1) begin : ch_controller
      ch_controller ch (
        //system
        .i_bus_clk            (Bus2IP_Clk    ),
        //.i_clk_50             (w_clk_o),
        .i_bus_rst            (~Bus2IP_Resetn),
        //host interface
        .i_slv_rd_sel         (f_reg_rd_sel[(`CH_REG+`WAY_REG*`WAY)*(i+1)-1:(`CH_REG+`WAY_REG*`WAY)*i]),
        .i_slv_wr_sel         (f_reg_wr_sel[(`CH_REG+`WAY_REG*`WAY)*(i+1)-1:(`CH_REG+`WAY_REG*`WAY)*i]),
        .i_slv_data           (w_slv_i_data),
        .o_slv_data           (w_slv_o_data[`SLV_DATA_WD*(i+1)-1:`SLV_DATA_WD*i]),  
        .i_slv_addr           (w_slv_addr),
        .i_slv_rnw            (Bus2IP_RNW),
        .o_sp_write_ack       (w_prog_sp_ack),
        .o_sp_read_ack        (w_read_sp_ack),
        .i_slv_sp_wr_ack      (w_slv_wr_ack),
        .i_slv_sp_rd_ack      (w_slv_rd_ack),
        //dma interface
        .i_data_clk           (i_clk                 ),//(Bus2IP_Clk            ),
        .i_data_rst           (~Bus2IP_Resetn        ),
        .o_dma_addr           (w_dma_addr            ),
        .i_dma_data           (w_dma_i_data          ),
        .o_dma_data           (w_dma_o_data          ),
        .o_dma_length         (w_dma_length          ),
        .o_dma_rd_req         (IP2Bus_MstRd_Req      ),
        .o_dma_wr_req         (IP2Bus_MstWr_Req      ),
        .i_dma_cmd_ack        (w_b2ip_cmd_ack        ),
        .i_dma_cmplt          (w_b2ip_cmplt          ),
        .i_dma_rd_sof_n       (Bus2IP_MstRd_sof_n    ),
        .i_dma_rd_eof_n       (Bus2IP_MstRd_eof_n    ),
        .i_dma_rd_src_rdy_n   (Bus2IP_MstRd_src_rdy_n),
        .i_dma_rd_src_dsc_n   (Bus2IP_MstRd_src_dsc_n),
        .o_dma_rd_dst_rdy_n   (IP2Bus_MstRd_dst_rdy_n),
        .o_dma_rd_dst_dsc_n   (IP2Bus_MstRd_dst_dsc_n),
        .o_dma_wr_sof_n       (IP2Bus_MstWr_sof_n    ),
        .o_dma_wr_eof_n       (IP2Bus_MstWr_eof_n    ),
        .o_dma_wr_src_rdy_n   (IP2Bus_MstWr_src_rdy_n),
        .o_dma_wr_src_dsc_n   (IP2Bus_MstWr_src_dsc_n),
        .i_dma_wr_dst_rdy_n   (Bus2IP_MstWr_dst_rdy_n),
        .i_dma_wr_dst_dsc_n   (Bus2IP_MstWr_dst_dsc_n),
        //system - nand controller
        .i_nc_clk             (i_clk ),
        .i_nc_rstn            (i_rstn),
        //nand interface
        .i_nand_dq            (w_nand_dq_i[`CIO_WD*(i+1)-1:`CIO_WD*i]),
        .o_nand_dq            (w_nand_dq_o[`CIO_WD*(i+1)-1:`CIO_WD*i]),
        .o_nand_dq_t          (w_nand_dq_t[i]                        ),
        .o_nand_cle           (w_nand_cle[i]                         ),
        .o_nand_ale           (w_nand_ale[i]                         ),
        .o_nand_ce_n          (w_nand_ce_n[`WAY*(i+1)-1:`WAY*i]      ),
        .o_nand_we_n          (w_nand_we_n[i]                        ),
        .o_nand_wr_n          (w_nand_wr_n[i]                        ),
        .o_nand_wp_n          (w_nand_wp_n[i]                        ),
        .i_nand_rb            (r_nand_rb[`WAY*(i+1)-1:`WAY*i]        ),
        .i_nand_dqs           (w_nand_dqs_i                          ),
        .o_nand_dqs_t         (w_nand_dqs_t                          ),
        .i_clk_o              (w_clk_o                               ),
        .o_m_ch_cmplt         (w_m_ch_cmplt                          ),
        .o_dqs_ce             (w_dqs_ce                              ),
        .o_prog_start         (o_prog_start                          ),
        .o_prog_end           (o_prog_end                            ),
        .o_read_start         (o_read_start                          ),
        .o_read_end           (o_read_end                            ),
        .o_erase_start        (o_erase_start                         ),
        .o_erase_end          (o_erase_end                           ),
        .o_op_fail            (o_op_fail                             )
      );
    end
  endgenerate

endmodule
                  