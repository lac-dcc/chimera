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

module axis_s512_mmu #
    (
        parameter EOP_POS       =    519      ,
        parameter ERR_POS       =    518      ,
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

    input       [511:0]     m_axis_rc_tdata         ,
    input       [74:0]      m_axis_rc_tuser         ,
    input                   m_axis_rc_tlast         ,
    input       [63:0]      m_axis_rc_tkeep         ,
    input                   m_axis_rc_tvalid        ,
    output  reg             m_axis_rc_tready        ,

    output  reg             rc_rx_wr                ,
    output  wire[539:0]     rc_rx_wdata             ,
    input                   rc_rx_ff                ,

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

reg     [539:0]     rc_rx_wdata_pre     ;
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
        rc_rx_wdata_pre[511:0] <= #U_DLY 512'h0;
    end
    else begin
        rc_rx_wdata_pre[511:0]<= {m_axis_rc_tdata[7:0    ],m_axis_rc_tdata[15:8   ],m_axis_rc_tdata[23:16  ],m_axis_rc_tdata[31:24  ],
                                  m_axis_rc_tdata[39:32  ],m_axis_rc_tdata[47:40  ],m_axis_rc_tdata[55:48  ],m_axis_rc_tdata[63:56  ],
                                  m_axis_rc_tdata[71:64  ],m_axis_rc_tdata[79:72  ],m_axis_rc_tdata[87:80  ],m_axis_rc_tdata[95:88  ],
                                  m_axis_rc_tdata[103:96 ],m_axis_rc_tdata[111:104],m_axis_rc_tdata[119:112],m_axis_rc_tdata[127:120],
                                  m_axis_rc_tdata[135:128],m_axis_rc_tdata[143:136],m_axis_rc_tdata[151:144],m_axis_rc_tdata[159:152],
                                  m_axis_rc_tdata[167:160],m_axis_rc_tdata[175:168],m_axis_rc_tdata[183:176],m_axis_rc_tdata[191:184],
                                  m_axis_rc_tdata[199:192],m_axis_rc_tdata[207:200],m_axis_rc_tdata[215:208],m_axis_rc_tdata[223:216],
                                  m_axis_rc_tdata[231:224],m_axis_rc_tdata[239:232],m_axis_rc_tdata[247:240],m_axis_rc_tdata[255:248],
                                  m_axis_rc_tdata[263:256],m_axis_rc_tdata[271:264],m_axis_rc_tdata[279:272],m_axis_rc_tdata[287:280],
                                  m_axis_rc_tdata[295:288],m_axis_rc_tdata[303:296],m_axis_rc_tdata[311:304],m_axis_rc_tdata[319:312],
                                  m_axis_rc_tdata[327:320],m_axis_rc_tdata[335:328],m_axis_rc_tdata[343:336],m_axis_rc_tdata[351:344],
                                  m_axis_rc_tdata[359:352],m_axis_rc_tdata[367:360],m_axis_rc_tdata[375:368],m_axis_rc_tdata[383:376],
                                  m_axis_rc_tdata[391:384],m_axis_rc_tdata[399:392],m_axis_rc_tdata[407:400],m_axis_rc_tdata[415:408],
                                  m_axis_rc_tdata[423:416],m_axis_rc_tdata[431:424],m_axis_rc_tdata[439:432],m_axis_rc_tdata[447:440],
                                  m_axis_rc_tdata[455:448],m_axis_rc_tdata[463:456],m_axis_rc_tdata[471:464],m_axis_rc_tdata[479:472],
                                  m_axis_rc_tdata[487:480],m_axis_rc_tdata[495:488],m_axis_rc_tdata[503:496],m_axis_rc_tdata[511:504]
                                 };
    end
end

//mod cal
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wdata_pre[517:512] <= #U_DLY 6'h0;
    end
    else if ((m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast) == 1'b1) begin
        case( m_axis_rc_tkeep )
            64'h1		                :	rc_rx_wdata_pre[517:512] <= 6'd63;
        	64'h3		                :	rc_rx_wdata_pre[517:512] <= 6'd62;
        	64'h7		                :	rc_rx_wdata_pre[517:512] <= 6'd61;
        	64'hf		                :	rc_rx_wdata_pre[517:512] <= 6'd60;
        	64'h1f		                :	rc_rx_wdata_pre[517:512] <= 6'd59;
        	64'h3f		                :	rc_rx_wdata_pre[517:512] <= 6'd58;
        	64'h7f		                :	rc_rx_wdata_pre[517:512] <= 6'd57;
        	64'hff		                :	rc_rx_wdata_pre[517:512] <= 6'd56;
        	64'h1ff		                :	rc_rx_wdata_pre[517:512] <= 6'd55;
        	64'h3ff		                :	rc_rx_wdata_pre[517:512] <= 6'd54;
        	64'h7ff		                :	rc_rx_wdata_pre[517:512] <= 6'd53;
        	64'hfff		                :	rc_rx_wdata_pre[517:512] <= 6'd52;
        	64'h1fff		            :	rc_rx_wdata_pre[517:512] <= 6'd51;
        	64'h3fff		            :	rc_rx_wdata_pre[517:512] <= 6'd50;
        	64'h7fff		            :	rc_rx_wdata_pre[517:512] <= 6'd49;
        	64'hffff		            :	rc_rx_wdata_pre[517:512] <= 6'd48;
        	64'h1_ffff		            :	rc_rx_wdata_pre[517:512] <= 6'd47;
        	64'h3_ffff		            :	rc_rx_wdata_pre[517:512] <= 6'd46;
        	64'h7_ffff		            :	rc_rx_wdata_pre[517:512] <= 6'd45;
        	64'hf_ffff		            :	rc_rx_wdata_pre[517:512] <= 6'd44;
        	64'h1f_ffff		            :	rc_rx_wdata_pre[517:512] <= 6'd43;
        	64'h3f_ffff		            :	rc_rx_wdata_pre[517:512] <= 6'd42;
        	64'h7f_ffff		            :	rc_rx_wdata_pre[517:512] <= 6'd41;
        	64'hff_ffff		            :	rc_rx_wdata_pre[517:512] <= 6'd40;
        	64'h1ff_ffff                :	rc_rx_wdata_pre[517:512] <= 6'd39;
        	64'h3ff_ffff	            :	rc_rx_wdata_pre[517:512] <= 6'd38;
        	64'h7ff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd37;
        	64'hfff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd36;
        	64'h1fff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd35;
        	64'h3fff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd34;
        	64'h7fff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd33;
        	64'hffff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd32;
        	64'h1_ffff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd31;
        	64'h3_ffff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd30;
        	64'h7_ffff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd29;
        	64'hf_ffff_ffff		        :	rc_rx_wdata_pre[517:512] <= 6'd28;
        	64'h1f_ffff_ffff	        :	rc_rx_wdata_pre[517:512] <= 6'd27;
        	64'h3f_ffff_ffff	        :	rc_rx_wdata_pre[517:512] <= 6'd26;
        	64'h7f_ffff_ffff		    :	rc_rx_wdata_pre[517:512] <= 6'd25;
        	64'hff_ffff_ffff		    :	rc_rx_wdata_pre[517:512] <= 6'd24;
        	64'h1ff_ffff_ffff		    :	rc_rx_wdata_pre[517:512] <= 6'd23;
        	64'h3ff_ffff_ffff	        :	rc_rx_wdata_pre[517:512] <= 6'd22;
        	64'h7ff_ffff_ffff		    :	rc_rx_wdata_pre[517:512] <= 6'd21;
        	64'hfff_ffff_ffff		    :	rc_rx_wdata_pre[517:512] <= 6'd20;
        	64'h1fff_ffff_ffff		    :	rc_rx_wdata_pre[517:512] <= 6'd19;
        	64'h3fff_ffff_ffff		    :	rc_rx_wdata_pre[517:512] <= 6'd18;
        	64'h7fff_ffff_ffff		    :	rc_rx_wdata_pre[517:512] <= 6'd17;
        	64'hffff_ffff_ffff		    :	rc_rx_wdata_pre[517:512] <= 6'd16;
        	64'h1_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd15;
        	64'h3_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd14;
        	64'h7_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd13;
        	64'hf_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd12;
        	64'h1f_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd11;
        	64'h3f_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd10;
        	64'h7f_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd9;
        	64'hff_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd8;
        	64'h1ff_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd7;
        	64'h3ff_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd6;
        	64'h7ff_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd5;
        	64'hfff_ffff_ffff_ffff	    :	rc_rx_wdata_pre[517:512] <= 6'd4;
        	64'h1fff_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd3;
        	64'h3fff_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd2;
        	64'h7fff_ffff_ffff_ffff		:	rc_rx_wdata_pre[517:512] <= 6'd1;
        default                     	:	rc_rx_wdata_pre[517:512] <= 6'd0;
        endcase
    end
    else begin
        rc_rx_wdata_pre[517:512] <= #U_DLY 6'h0;
    end
end

//err bit cal
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wdata_pre[ERR_POS] <= #U_DLY 1'b0;
    end
    else begin
        rc_rx_wdata_pre[ERR_POS] <= #U_DLY m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast & rc_tuser_discontinue;
    end
end

//eop bit cal
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wdata_pre[EOP_POS] <= #U_DLY 1'b0;
    end
    else begin
        rc_rx_wdata_pre[EOP_POS] <= #U_DLY m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast;
    end
end

//rsv reset
always @ ( posedge pcie_clk or posedge pcie_rst )
begin
    if (pcie_rst == 1'b1) begin
        rc_rx_wdata_pre[539:520] <= #U_DLY 20'h0;
    end
    else begin
        rc_rx_wdata_pre[539:520] <= #U_DLY 20'h0;
    end
end

assign rc_rx_wdata[539:0] =  {rc_rx_wdata_pre[539:512],
                              rc_rx_wdata_pre[7:0    ],rc_rx_wdata_pre[15:8   ],rc_rx_wdata_pre[23:16  ],rc_rx_wdata_pre[31:24  ],
                              rc_rx_wdata_pre[39:32  ],rc_rx_wdata_pre[47:40  ],rc_rx_wdata_pre[55:48  ],rc_rx_wdata_pre[63:56  ],
                              rc_rx_wdata_pre[71:64  ],rc_rx_wdata_pre[79:72  ],rc_rx_wdata_pre[87:80  ],rc_rx_wdata_pre[95:88  ],
                              rc_rx_wdata_pre[103:96 ],rc_rx_wdata_pre[111:104],rc_rx_wdata_pre[119:112],rc_rx_wdata_pre[127:120],
                              rc_rx_wdata_pre[135:128],rc_rx_wdata_pre[143:136],rc_rx_wdata_pre[151:144],rc_rx_wdata_pre[159:152],
                              rc_rx_wdata_pre[167:160],rc_rx_wdata_pre[175:168],rc_rx_wdata_pre[183:176],rc_rx_wdata_pre[191:184],
                              rc_rx_wdata_pre[199:192],rc_rx_wdata_pre[207:200],rc_rx_wdata_pre[215:208],rc_rx_wdata_pre[223:216],
                              rc_rx_wdata_pre[231:224],rc_rx_wdata_pre[239:232],rc_rx_wdata_pre[247:240],rc_rx_wdata_pre[255:248],
                              rc_rx_wdata_pre[263:256],rc_rx_wdata_pre[271:264],rc_rx_wdata_pre[279:272],rc_rx_wdata_pre[287:280],
                              rc_rx_wdata_pre[295:288],rc_rx_wdata_pre[303:296],rc_rx_wdata_pre[311:304],rc_rx_wdata_pre[319:312],
                              rc_rx_wdata_pre[327:320],rc_rx_wdata_pre[335:328],rc_rx_wdata_pre[343:336],rc_rx_wdata_pre[351:344],
                              rc_rx_wdata_pre[359:352],rc_rx_wdata_pre[367:360],rc_rx_wdata_pre[375:368],rc_rx_wdata_pre[383:376],
                              rc_rx_wdata_pre[391:384],rc_rx_wdata_pre[399:392],rc_rx_wdata_pre[407:400],rc_rx_wdata_pre[415:408],
                              rc_rx_wdata_pre[423:416],rc_rx_wdata_pre[431:424],rc_rx_wdata_pre[439:432],rc_rx_wdata_pre[447:440],
                              rc_rx_wdata_pre[455:448],rc_rx_wdata_pre[463:456],rc_rx_wdata_pre[471:464],rc_rx_wdata_pre[479:472],
                              rc_rx_wdata_pre[487:480],rc_rx_wdata_pre[495:488],rc_rx_wdata_pre[503:496],rc_rx_wdata_pre[511:504]
                            };

always @ ( posedge user_clk or posedge user_rst )
begin
    if (user_rst == 1'b1) begin
        rc_rx_cnt        <= #U_DLY 1'b0;
        rc_rx_drop_cnt   <= #U_DLY 1'b0;
    end
    else begin
        rc_rx_cnt        <= #U_DLY m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast;
        rc_rx_drop_cnt   <= #U_DLY m_axis_rc_tvalid & m_axis_rc_tready & m_axis_rc_tlast & rc_tuser_discontinue;
    end
end

endmodule
