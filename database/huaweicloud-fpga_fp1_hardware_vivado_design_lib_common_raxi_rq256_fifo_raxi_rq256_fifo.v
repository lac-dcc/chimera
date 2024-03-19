//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying 
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details. 
//------------------------------------------------------------------------------

`resetall
`timescale 1ns/1ns

module raxi_rq256_fifo #
    (
        parameter A_DTH         =    9        ,
        parameter EOP_POS       =    262      ,
        parameter ERR_POS       =    261      ,
        parameter FULL_LEVEL    =    9'd400
    )
    (
    //clk domain from pcie ipcore
    input                   pcie_clk                ,
    input                   pcie_rst                ,
    input                   pcie_link_up            ,
    //clk domain of user side
    input                   user_clk                ,
    input                   user_rst                ,
    
    output                  s_axis_rq_tlast         ,
    output      [255:0]     s_axis_rq_tdata         ,
    output      [59:0]      s_axis_rq_tuser         ,
    output  reg [31:0]      s_axis_rq_tkeep         ,
    input                   s_axis_rq_tready        ,
    output  reg             s_axis_rq_tvalid        ,

    input       [15:0]      reg_tmout_us_cfg        ,
    output                  reg_tmout_us_err        ,

    input                   rq_tx_wr                ,
    input       [287:0]     rq_tx_wdata             ,
    output                  rq_tx_ff                ,

    output      [A_DTH-1:0] rq_wr_data_cnt          ,
    output      [A_DTH-1:0] rq_rd_data_cnt          ,
    
    output      [1:0]       fifo_status             ,
    output                  fifo_err                ,
    output  reg             rq_tx_cnt
    );

/********************************************************************************************************************\
    parameters
\********************************************************************************************************************/
localparam  U_DLY       = 0             ;
/********************************************************************************************************************\
    signals
\********************************************************************************************************************/
wire    [287:0]     rq_tx_wdata_prty    ;
wire                chk_rsult_rq_tx     ;

wire                rq_tx_rd            ;
wire    [287:0]     rq_tx_rdata         ;
wire                rq_tx_ef            ;
wire    [3:0]       rq_tuser_first_be   ;
wire    [3:0]       rq_tuser_last_be    ;

wire                rq_tx_ff_err        ;
reg                 rq_tx_rd_1dly       ;
//*********************************************************************************************************************
//    process
//*********************************************************************************************************************
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if ( pcie_rst == 1'b1) begin
        s_axis_rq_tvalid <= #U_DLY 1'b0;
    end
    else if ( s_axis_rq_tlast == 1'b1) begin
        s_axis_rq_tvalid <= #U_DLY 1'b0;
    end
    else if (((~rq_tx_ef) & pcie_link_up)== 1'b1) begin
        s_axis_rq_tvalid <= #U_DLY 1'b1;
    end
    else;
end

assign rq_tx_rd = s_axis_rq_tvalid & s_axis_rq_tready;

always @ (*)
begin
    case (rq_tx_rdata[260:256])
        5'd31    :        s_axis_rq_tkeep =  32'h1		      ;
        5'd30    :        s_axis_rq_tkeep =  32'h3		      ;
        5'd29    :        s_axis_rq_tkeep =  32'h7		      ;
        5'd28    :        s_axis_rq_tkeep =  32'hf		      ;
        5'd27    :        s_axis_rq_tkeep =  32'h1f		      ;
        5'd26    :        s_axis_rq_tkeep =  32'h3f		      ;
        5'd25    :        s_axis_rq_tkeep =  32'h7f		      ;
        5'd24    :        s_axis_rq_tkeep =  32'hff		      ;
        5'd23    :        s_axis_rq_tkeep =  32'h1ff		  ;
        5'd22    :        s_axis_rq_tkeep =  32'h3ff		  ;
        5'd21    :        s_axis_rq_tkeep =  32'h7ff		  ;
        5'd20    :        s_axis_rq_tkeep =  32'hfff		  ;
        5'd19    :        s_axis_rq_tkeep =  32'h1fff	      ;
        5'd18    :        s_axis_rq_tkeep =  32'h3fff	      ;
        5'd17    :        s_axis_rq_tkeep =  32'h7fff	      ;
        5'd16    :        s_axis_rq_tkeep =  32'hffff	      ;
        5'd15    :        s_axis_rq_tkeep =  32'h1_ffff	      ;
        5'd14    :        s_axis_rq_tkeep =  32'h3_ffff	      ;
        5'd13    :        s_axis_rq_tkeep =  32'h7_ffff	      ;
        5'd12    :        s_axis_rq_tkeep =  32'hf_ffff	      ;
        5'd11    :        s_axis_rq_tkeep =  32'h1f_ffff	  ;
        5'd10    :        s_axis_rq_tkeep =  32'h3f_ffff	  ;
        5'd9     :        s_axis_rq_tkeep =  32'h7f_ffff	  ;
        5'd8     :        s_axis_rq_tkeep =  32'hff_ffff	  ;
        5'd7     :        s_axis_rq_tkeep =  32'h1ff_ffff     ;
        5'd6     :        s_axis_rq_tkeep =  32'h3ff_ffff     ;
        5'd5     :        s_axis_rq_tkeep =  32'h7ff_ffff     ;
        5'd4     :        s_axis_rq_tkeep =  32'hfff_ffff     ;
        5'd3     :        s_axis_rq_tkeep =  32'h1fff_ffff    ;
        5'd2     :        s_axis_rq_tkeep =  32'h3fff_ffff    ;
        5'd1     :        s_axis_rq_tkeep =  32'h7fff_ffff    ;
        default  :        s_axis_rq_tkeep =  32'hffff_ffff    ;
    endcase

end

assign s_axis_rq_tlast      = rq_tx_rdata[EOP_POS] & rq_tx_rd;

//s_axis_rq_tdata完成DW顺序调整
assign s_axis_rq_tdata      =  {rq_tx_rdata[7:0    ],rq_tx_rdata[15:8   ],rq_tx_rdata[23:16  ],rq_tx_rdata[31:24  ],
                                rq_tx_rdata[39:32  ],rq_tx_rdata[47:40  ],rq_tx_rdata[55:48  ],rq_tx_rdata[63:56  ],
                                rq_tx_rdata[71:64  ],rq_tx_rdata[79:72  ],rq_tx_rdata[87:80  ],rq_tx_rdata[95:88  ],
                                rq_tx_rdata[103:96 ],rq_tx_rdata[111:104],rq_tx_rdata[119:112],rq_tx_rdata[127:120],
                                rq_tx_rdata[135:128],rq_tx_rdata[143:136],rq_tx_rdata[151:144],rq_tx_rdata[159:152],
                                rq_tx_rdata[167:160],rq_tx_rdata[175:168],rq_tx_rdata[183:176],rq_tx_rdata[191:184],
                                rq_tx_rdata[199:192],rq_tx_rdata[207:200],rq_tx_rdata[215:208],rq_tx_rdata[223:216],
                                rq_tx_rdata[231:224],rq_tx_rdata[239:232],rq_tx_rdata[247:240],rq_tx_rdata[255:248]
                                };

assign rq_tuser_first_be    = rq_tx_rdata[270:267];
assign rq_tuser_last_be     = rq_tx_rdata[266:263];
assign s_axis_rq_tuser      = { 52'h0, rq_tuser_last_be, rq_tuser_first_be };

//prty_add 
prty_add 
      #(
      .DATA_WTH    (279                     ),
      .CELL_WTH    (32                      )
       )
u_prty_add_rq_fifo
       (
       .data_in    (rq_tx_wdata[278:0]      ), 
       .data_out   (rq_tx_wdata_prty        ) 
       );

//prty_chk
prty_chk
      #(
      .DATA_WTH    (288                     ),
      .CELL_WTH    (32                      ) 
       )
u_prty_chk_rq_fifo
       (
       .clks       (pcie_clk                ), 
       .data_in    (rq_tx_rdata             ), 
       .data_out   (                        ), 
       .chk_rsult  (chk_rsult_rq_tx         ) 
       );

//rq tx fifo
asyn_frm_fifo_288x512_sa
    #(
    .DATA_WIDTH         ( 288               ),
    .ADDR_WIDTH         ( A_DTH             ),
    .EOP_POS            ( EOP_POS           ),
    .ERR_POS            ( ERR_POS           ),
    .FULL_LEVEL         ( FULL_LEVEL        ),
    .ERR_DROP           ( 1'b1              )
    )
    u_rq_tx_fifo
    (
    .rd_clk             ( pcie_clk          ),
    .rd_rst             ( pcie_rst          ),
    .wr_clk             ( user_clk          ),
    .wr_rst             ( user_rst          ),
    .wr                 ( rq_tx_wr          ),
    .wdata              ( rq_tx_wdata_prty  ),
    .wafull             ( rq_tx_ff          ),
    .wr_data_cnt        ( rq_wr_data_cnt    ),
    .rd                 ( rq_tx_rd          ),
    .rdata              ( rq_tx_rdata       ),
    .rempty             ( rq_tx_ef          ),
    .rd_data_cnt        ( rq_rd_data_cnt    ),
    .empty_full_err     ( rq_tx_ff_err      )
    );

always @ ( posedge user_clk or posedge user_rst )
begin
    if ( user_rst == 1'b1 ) begin
        rq_tx_cnt     <= #U_DLY 1'b0;
        rq_tx_rd_1dly <= #U_DLY 1'b0;
    end
    else begin
        rq_tx_cnt     <= #U_DLY s_axis_rq_tlast;
        rq_tx_rd_1dly <= #U_DLY rq_tx_rd;
    end
end

assign  fifo_status = { rq_tx_ff, rq_tx_ef};
assign  fifo_err    =  rq_tx_ff_err | (chk_rsult_rq_tx & rq_tx_rd_1dly);

axi_time_out u_axi_time_out
(
    .clks                   (pcie_clk            ),
    .reset                  (pcie_rst            ),
    
    .vld_in                 (s_axis_rq_tvalid    ),
    .ready_in               (s_axis_rq_tready    ),
    .reg_tmout_us_cfg       (reg_tmout_us_cfg    ),
    .time_out               (reg_tmout_us_err    )  
);

endmodule
