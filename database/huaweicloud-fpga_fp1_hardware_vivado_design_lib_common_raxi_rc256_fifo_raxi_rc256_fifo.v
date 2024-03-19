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

module raxi_rc256_fifo #
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

    input       [255:0]     m_axis_rc_tdata         ,
    input       [74:0]      m_axis_rc_tuser         ,
    input                   m_axis_rc_tlast         ,
    input       [31:0]      m_axis_rc_tkeep         ,
    input                   m_axis_rc_tvalid        ,
    output  reg             m_axis_rc_tready        ,

    input                   rc_rx_rd                ,
    output                  rc_rx_ef                ,
    output      [287:0]     rc_rx_rdata             ,

    output      [A_DTH-1:0] rc_wr_data_cnt          ,
    output      [A_DTH-1:0] rc_rd_data_cnt          ,
    
    output      [1:0]       fifo_status             ,
    output                  fifo_err                ,
    output  reg             rc_rx_cnt               ,
    output  reg             rc_rx_drop_cnt          
    );

/********************************************************************************************************************\
    parameters
\********************************************************************************************************************/
localparam  U_DLY       = 0             ;
/********************************************************************************************************************\
    signals
\********************************************************************************************************************/
wire    [31:0]      rc_tuser_byte_en    ;
wire                rc_tuser_is_sof0    ;
wire                rc_tuser_is_sof1    ;
wire    [3:0]       rc_tuser_is_eof0    ;
wire    [3:0]       rc_tuser_is_eof1    ;
wire                rc_tuser_discontinue;
wire    [31:0]      rc_tuser_parity     ;

wire                rc_rx_ff            ;
reg                 rc_rx_wr            ;
reg     [287:0]     rc_rx_wdata         ;
wire    [287:0]     rc_rx_wdata_prty    ;
wire                chk_rsult_rc_rx     ;

wire                rc_rx_ff_err        ;
reg                 rc_rx_rd_1dly       ;
//*********************************************************************************************************************
//    process
//*********************************************************************************************************************
assign  rc_tuser_byte_en        = m_axis_rc_tuser[31:0];
assign  rc_tuser_is_sof0        = m_axis_rc_tuser[32];
assign  rc_tuser_is_sof1        = m_axis_rc_tuser[33];
assign  rc_tuser_is_eof0        = m_axis_rc_tuser[37:34];
assign  rc_tuser_is_eof1        = m_axis_rc_tuser[41:38];
assign  rc_tuser_discontinue    = m_axis_rc_tuser[42];
assign  rc_tuser_parity         = m_axis_rc_tuser[74:43];

always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        m_axis_rc_tready <= #U_DLY 1'b0;
    end
    else if ((rc_rx_ff & (( ~m_axis_rc_tvalid ) | (m_axis_rc_tvalid & m_axis_rc_tlast))) == 1'b1) begin
        m_axis_rc_tready <= #U_DLY 1'b0;
    end
    else if ((~rc_rx_ff) == 1'b1) begin
        m_axis_rc_tready <= #U_DLY 1'b1;
    end
    else;
end 

//m_axis_rc wr enable
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wr <= #U_DLY 1'b0;
    end
    else begin
        rc_rx_wr <= #U_DLY m_axis_rc_tvalid & m_axis_rc_tready;
    end
end 

//data order change
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wdata[255:0] <= #U_DLY 256'h0;
    end
    else begin
        rc_rx_wdata[255:0] <=  {m_axis_rc_tdata[7:0    ],m_axis_rc_tdata[15:8   ],m_axis_rc_tdata[23:16  ],m_axis_rc_tdata[31:24  ],
                                m_axis_rc_tdata[39:32  ],m_axis_rc_tdata[47:40  ],m_axis_rc_tdata[55:48  ],m_axis_rc_tdata[63:56  ],
                                m_axis_rc_tdata[71:64  ],m_axis_rc_tdata[79:72  ],m_axis_rc_tdata[87:80  ],m_axis_rc_tdata[95:88  ],
                                m_axis_rc_tdata[103:96 ],m_axis_rc_tdata[111:104],m_axis_rc_tdata[119:112],m_axis_rc_tdata[127:120],
                                m_axis_rc_tdata[135:128],m_axis_rc_tdata[143:136],m_axis_rc_tdata[151:144],m_axis_rc_tdata[159:152],
                                m_axis_rc_tdata[167:160],m_axis_rc_tdata[175:168],m_axis_rc_tdata[183:176],m_axis_rc_tdata[191:184],
                                m_axis_rc_tdata[199:192],m_axis_rc_tdata[207:200],m_axis_rc_tdata[215:208],m_axis_rc_tdata[223:216],
                                m_axis_rc_tdata[231:224],m_axis_rc_tdata[239:232],m_axis_rc_tdata[247:240],m_axis_rc_tdata[255:248]
                                };
    end
end

//mod cal
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wdata[260:256] <= #U_DLY 5'h0;
    end
    else if ((m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast) == 1'b1) begin
        case( m_axis_rc_tkeep )
        32'h1		    : rc_rx_wdata[260:256] <= #U_DLY 5'd31    ;
        32'h3		    : rc_rx_wdata[260:256] <= #U_DLY 5'd30    ;
        32'h7		    : rc_rx_wdata[260:256] <= #U_DLY 5'd29    ;
        32'hf		    : rc_rx_wdata[260:256] <= #U_DLY 5'd28    ;
        32'h1f		    : rc_rx_wdata[260:256] <= #U_DLY 5'd27    ;
        32'h3f		    : rc_rx_wdata[260:256] <= #U_DLY 5'd26    ;
        32'h7f		    : rc_rx_wdata[260:256] <= #U_DLY 5'd25    ;
        32'hff		    : rc_rx_wdata[260:256] <= #U_DLY 5'd24    ;
        32'h1ff		    : rc_rx_wdata[260:256] <= #U_DLY 5'd23    ;
        32'h3ff		    : rc_rx_wdata[260:256] <= #U_DLY 5'd22    ;
        32'h7ff		    : rc_rx_wdata[260:256] <= #U_DLY 5'd21    ;
        32'hfff		    : rc_rx_wdata[260:256] <= #U_DLY 5'd20    ;
        32'h1fff		: rc_rx_wdata[260:256] <= #U_DLY 5'd19    ;
        32'h3fff		: rc_rx_wdata[260:256] <= #U_DLY 5'd18    ;
        32'h7fff		: rc_rx_wdata[260:256] <= #U_DLY 5'd17    ;
        32'hffff		: rc_rx_wdata[260:256] <= #U_DLY 5'd16    ;
        32'h1_ffff		: rc_rx_wdata[260:256] <= #U_DLY 5'd15    ;
        32'h3_ffff		: rc_rx_wdata[260:256] <= #U_DLY 5'd14    ;
        32'h7_ffff		: rc_rx_wdata[260:256] <= #U_DLY 5'd13    ;
        32'hf_ffff		: rc_rx_wdata[260:256] <= #U_DLY 5'd12    ;
        32'h1f_ffff		: rc_rx_wdata[260:256] <= #U_DLY 5'd11    ;
        32'h3f_ffff		: rc_rx_wdata[260:256] <= #U_DLY 5'd10    ;
        32'h7f_ffff		: rc_rx_wdata[260:256] <= #U_DLY 5'd9     ;
        32'hff_ffff		: rc_rx_wdata[260:256] <= #U_DLY 5'd8     ;
        32'h1ff_ffff    : rc_rx_wdata[260:256] <= #U_DLY 5'd7     ;
        32'h3ff_ffff	: rc_rx_wdata[260:256] <= #U_DLY 5'd6     ;
        32'h7ff_ffff	: rc_rx_wdata[260:256] <= #U_DLY 5'd5     ;
        32'hfff_ffff	: rc_rx_wdata[260:256] <= #U_DLY 5'd4     ;
        32'h1fff_ffff	: rc_rx_wdata[260:256] <= #U_DLY 5'd3     ;
        32'h3fff_ffff	: rc_rx_wdata[260:256] <= #U_DLY 5'd2     ;
        32'h7fff_ffff	: rc_rx_wdata[260:256] <= #U_DLY 5'd1     ;
        default         : rc_rx_wdata[260:256] <= #U_DLY 5'd0     ;
        endcase
    end
    else begin
        rc_rx_wdata[260:256] <= #U_DLY 5'h0;
    end
end

//err bit cal
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wdata[ERR_POS] <= #U_DLY 1'b0;
    end
    else begin
        rc_rx_wdata[ERR_POS] <= #U_DLY m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast & rc_tuser_discontinue;
    end
end

//eop bit cal
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wdata[EOP_POS] <= #U_DLY 1'b0;
    end
    else begin
        rc_rx_wdata[EOP_POS] <= #U_DLY m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast;
    end
end

//rsv reset
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wdata[287:263] <= #U_DLY 25'h0;
    end
    else begin
        rc_rx_wdata[287:263] <= #U_DLY 25'h0;
    end
end

//prty_add 
prty_add
      #(
      .DATA_WTH    (279                     ),
      .CELL_WTH    (32                      )
       )
u_prty_add_rc_fifo
       (
       .data_in    (rc_rx_wdata[278:0]      ), 
       .data_out   (rc_rx_wdata_prty        ) 
       );

//prty_chk
prty_chk
      #(
      .DATA_WTH    (288                     ),
      .CELL_WTH    (32                      ) 
       )
u_prty_chk_rc_fifo
       (
       .clks       (user_clk                ), 
       .data_in    (rc_rx_rdata             ), 
       .data_out   (                        ), 
       .chk_rsult  (chk_rsult_rc_rx         ) 
       );

//rc rx fifo
asyn_frm_fifo_288x512_sa
    #(
    .DATA_WIDTH         ( 288               ),
    .ADDR_WIDTH         ( A_DTH             ),
    .EOP_POS            ( EOP_POS           ),
    .ERR_POS            ( ERR_POS           ),
    .FULL_LEVEL         ( FULL_LEVEL        ),
    .ERR_DROP           ( 1'b1              )
    )
    u_rc_rx_fifo
    (
    .rd_clk             ( user_clk          ),
    .rd_rst             ( user_rst          ),
    .wr_clk             ( pcie_clk          ),
    .wr_rst             ( pcie_rst          ),
    .wr                 ( rc_rx_wr          ),
    .wdata              ( rc_rx_wdata_prty  ),
    .wafull             ( rc_rx_ff          ),
    .wr_data_cnt        ( rc_wr_data_cnt    ),
    .rd                 ( rc_rx_rd          ),
    .rdata              ( rc_rx_rdata       ),
    .rempty             ( rc_rx_ef          ),
    .rd_data_cnt        ( rc_rd_data_cnt    ),
    .empty_full_err     ( rc_rx_ff_err      )
    );

always @ ( posedge user_clk or posedge user_rst )
begin
    if (user_rst == 1'b1) begin
        rc_rx_cnt        <= #U_DLY 1'b0;
        rc_rx_drop_cnt   <= #U_DLY 1'b0;
        rc_rx_rd_1dly    <= #U_DLY 1'b0;
    end
    else begin
        rc_rx_cnt        <= #U_DLY m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast;
        rc_rx_drop_cnt   <= #U_DLY m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast & rc_tuser_discontinue;
        rc_rx_rd_1dly    <= #U_DLY rc_rx_rd;
    end
end

assign  fifo_status = { rc_rx_ff, rc_rx_ef};
assign  fifo_err    =  rc_rx_ff_err | (chk_rsult_rc_rx & rc_rx_rd_1dly);

endmodule
