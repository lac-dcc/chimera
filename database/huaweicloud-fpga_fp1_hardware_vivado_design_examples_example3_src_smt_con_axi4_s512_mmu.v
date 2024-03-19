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
`timescale 1ns / 100ps

module axi4_s512_mmu   #(
                 parameter         AXI_ADDR_WIDTH  = 64  ,
                 parameter         DATA_WIDTH      = 512 ,
                 parameter         FIFO_DATA_WIDTH = 576 ,
                 parameter         SOP_POS         = 520 ,
                 parameter         EOP_POS         = 519 ,
                 parameter         ERR_POS         = 518 ,
                 parameter         MOD_POS         = 512 ,
                 parameter         MOD_WIDTH       = 6   ,
                 parameter         PKT_TYPE_POS    = 537 , 
                 parameter         PKT_TYPE_WIDTH  = 4   , 
                 parameter         PKT_LEN_WIDTH   = 16       
                  )
                 (

                 //globe signals
                 input                        				clk_sys                     ,//i 1  
                 input                       				rst                         ,//i 1  
          
                 //interface with axi4 master          
                 input           [  3:0]                    m_awid 						,
                 input           [AXI_ADDR_WIDTH-1:0]       m_awaddr 					,
                 input           [  7:0]                    m_awlen 					,
                 input           [  2:0]                    m_awsize 					,
                 input                                      m_awvalid 				    ,
                 output  reg                                s_awready 				    ,
                 
                 input           [3:0]                      m_wid                       , 
                 input           [DATA_WIDTH-1:0]           m_wdata 					,
                 input           [ 63:0]                    m_wstrb 					,
                 input                                      m_wlast 					,
                 input                                      m_wvalid 					,
                 output  reg                                s_wready 					,
                        
                 output  reg     [  3:0]                    s_bid 						,
                 output  reg     [  1:0]                    s_bresp 					,
                 output  reg                                s_bvalid 					,
                 input                                      m_bready 					,
                        
                 //interface with data fifo                        
                 output  reg                                axi2fifo_wr 			    ,
                 output  reg     [FIFO_DATA_WIDTH-1:0]      axi2fifo_wdata 		        ,
                 input                                      fifo2axi_ff 			    ,
                 
                 //interface with cmd fifo
                 output  reg                                axi2fifo_cmd_wr 			,
                 output  wire    [53:0]                     axi2fifo_cmd_wdata 		    ,
                 input                                      fifo2axi_cmd_ff 			,    

                 //sta, cnt, err              
                 output  reg     [ 15:0]                    axi2fifo_len              	,
                 output          [  7:0]                    axi4_sl_fsm_state           ,
                 output  reg                                axi4_sl_tran_cnt_en       	,
                 output  reg                                axi4_sl_tranok_cnt_en     	,
                 output  reg                                axi4_sl_frm_cnt_en        	,
                 output  reg                                axi4_sl_wr_cnt_en        	,
              
                 output  reg     [ 31:0]                    reg_axi4_sl_sta           	,
                 output  reg     [ 31:0]                    reg_axi4_sl_err                   

                 );

/********************************************************************************************************************\
    parameters
\********************************************************************************************************************/
parameter	  S_IDLE             = 2'b00      ; 
parameter	  S_RECV_DATA        = 2'b01      ;
parameter	  S_SEND_ACK         = 2'b10      ;
parameter	  S_BUSY             = 2'b11      ;
/********************************************************************************************************************\
    signals
\********************************************************************************************************************/
reg       [1:0]         			fsm_axi4_state_curr           ;
reg       [1:0]         			fsm_axi4_state_next           ;
reg    	  [7:0]         			rx_tran_num                   ;
reg       [PKT_TYPE_WIDTH-1:0]      rx_chan_id                    ; 
reg       [AXI_ADDR_WIDTH-1:0]      rx_wstrb                      ;
reg       [MOD_WIDTH-1:0]           axi2fifo_wdata_mod            ;
wire      [PKT_LEN_WIDTH-1:0]       axi2fifo_wdata_len            ;
reg                                 axi2fifo_wdata_sop            ;
reg                                 axi2fifo_wdata_eop            ;
wire      [3:0]                     axi2fifo_wdata_id             ;
wire      [10:0]                    axi2fifo_wdata_rsv            ;
reg       [8:0]                     axi2fifo_wdata_chk            ;
reg                                 axi2fifo_wdata_err            ;
reg       [DATA_WIDTH-1:0]          axi2fifo_wdata_pre            ;
reg                                 axi2fifo_wr_pre               ;
reg                                 m_wr_1dly                     ;

reg       [2:0]                     cmd_awsize                    ;
reg       [7:0]                     cmd_awlen                     ;
reg       [35:0]                    cmd_awaddr                    ;
reg       [3:0]                     cmd_awid                      ;
reg                                 m_wlast_1dly                  ;

wire                                axi4_wdata_err                ;
/********************************************************************************************************************\
    process
\********************************************************************************************************************/
always @ (posedge clk_sys or posedge rst)
begin 
    if (rst == 1'b1) begin
        fsm_axi4_state_curr <= S_IDLE;
    end
    else begin
        fsm_axi4_state_curr <= fsm_axi4_state_next;
    end
end

//state jump
always @ (*)
begin 
    case (fsm_axi4_state_curr)
        S_IDLE :	
        begin 
            if ((s_awready == 1'b1) & (m_awvalid == 1'b1)) begin
                fsm_axi4_state_next = S_RECV_DATA; 
            end 
            else if (fifo2axi_ff == 1'b1) begin
                fsm_axi4_state_next = S_BUSY;
            end            
            else begin
                fsm_axi4_state_next = S_IDLE;
            end
        end

        S_BUSY:
        begin
            if (fifo2axi_ff == 1'b0)  begin
                fsm_axi4_state_next = S_IDLE;
            end
            else begin
                fsm_axi4_state_next = S_BUSY;
            end
        end

        S_RECV_DATA :	
        begin 
            if(m_wlast == 1'b1) begin
                fsm_axi4_state_next = S_SEND_ACK;
            end
            else begin 
                fsm_axi4_state_next = S_RECV_DATA;
            end
        end
        
        S_SEND_ACK : 
        begin 
            if((m_bready == 1'b1) & (fifo2axi_ff == 1'b0)) begin
                fsm_axi4_state_next = S_IDLE;
            end
            else begin 
                fsm_axi4_state_next = S_SEND_ACK;
            end
        end
        
        default : /* default */;
    endcase
end

//state process
always @ (posedge clk_sys or posedge rst)
begin 
    if(rst == 1'b1) begin
        s_awready <= 1'b1;
        s_wready  <= 1'b0;
        s_bvalid  <= 1'b0;
    end
    else begin
        case (fsm_axi4_state_curr)
            S_BUSY:
            begin
                if (fifo2axi_ff == 1'b0) begin
                    s_awready <= 1'b1;
                end
                else begin
                    s_awready <= 1'b0;
                end 
            end

            S_IDLE:
            begin
                if ((m_awvalid == 1'b1)&(s_awready == 1'b1)) begin
                    s_awready  <= 1'b0;
                    s_wready   <= 1'b1;
                end
                else if (fifo2axi_ff == 1'b1) begin
                    s_awready  <= 1'b0;
                end                
                else;
            end

            S_RECV_DATA:
            begin 
                if((m_wvalid == 1'b1)&(m_wlast == 1'b1)) begin
                    s_wready <= 1'b0;
                    s_bvalid <= 1'b1;
                end
                else;
            end
            
            S_SEND_ACK:
            begin 
                if (m_bready == 1'b1) begin
                    s_awready <= ~fifo2axi_ff;
                    s_bvalid  <= 1'b0;
                end
                else;
            end
            
            default : /* default */;
        endcase 
    end
end
//******************************************************************************
//lock info
always @ (posedge clk_sys or posedge rst)
begin 
    if(rst == 1'b1) begin
        rx_tran_num  <= 8'd0;
        rx_chan_id   <= {PKT_TYPE_WIDTH{1'b0}};
    end
    else if ((m_awvalid == 1'b1) & (s_awready == 1'b1)) begin
        rx_tran_num  <= m_awlen + 8'd1;
        rx_chan_id   <= m_awaddr[PKT_TYPE_WIDTH-1:0];
    end
    else ;
end

always @ (*)
begin 
    if((m_wvalid == 1'b1) & (s_wready == 1'b1)) begin
        rx_wstrb = m_wstrb;
    end
    else begin 
        rx_wstrb = 64'd0;
    end
end
//******************************************************************************
//axi4 --> fifo wr
always @ (posedge clk_sys or posedge rst)
begin
    if(rst == 1'b1) begin
        axi2fifo_wr_pre <= 1'b0;
    end
    else begin 
        axi2fifo_wr_pre <= m_wvalid & s_wready;
    end
end

always @ (posedge clk_sys or posedge rst)
begin 
    if(rst == 1'b1) begin
        axi2fifo_wr <= 1'b0;
    end
    else begin 
        axi2fifo_wr <= axi2fifo_wr_pre;
    end
end

//axi4 --> fifo wdata
always @ (posedge clk_sys)
begin 
    axi2fifo_wdata_pre <= m_wdata[511:0]; 
end
always @ (posedge clk_sys)
begin
		axi2fifo_wdata[539:0] <= {	
                                   axi2fifo_wdata_chk,axi2fifo_wdata_rsv,
                                   axi2fifo_wdata_eop,
                                   axi2fifo_wdata_err,axi2fifo_wdata_mod,
                                   axi2fifo_wdata_pre
                                 };
end

always @ (posedge clk_sys)
begin 
	s_bid   <= cmd_awid;
    s_bresp <= 2'd0;
end

//******************************************************************************
//axi4 --> fifo cmd wr
always @ (posedge clk_sys or posedge rst)
begin 
    if(rst == 1'b1) begin
        axi2fifo_cmd_wr <= 1'b0;
    end
    else if (m_wlast_1dly == 1'b1) begin 
        axi2fifo_cmd_wr <= 1'b1;
    end
    else begin
        axi2fifo_cmd_wr <= 1'b0;
    end
end

always @ (posedge clk_sys or posedge rst)
begin 
    if(rst == 1'b1) begin
        m_wlast_1dly <= 1'b0;
    end
    else begin
        m_wlast_1dly <= m_wlast;
    end
end

always @ (posedge clk_sys or posedge rst)
begin 
    if(rst == 1'b1) begin
        cmd_awsize <= 3'd0;
        cmd_awlen  <= 8'd0;
        cmd_awaddr <= 36'd0;
        cmd_awid   <= 4'd0;
    end
    else if ((m_awvalid & s_awready) == 1'b1) begin
        cmd_awsize <= m_awsize;
        cmd_awlen  <= m_awlen ;
        cmd_awaddr <= m_awaddr[35:0];
        cmd_awid   <= m_awid  ;
    end
    else;
end

//axi4 --> fifo cmd wdata
assign axi2fifo_cmd_wdata = {3'd0,cmd_awlen,cmd_awsize,cmd_awid,cmd_awaddr};

//******************************************************************************
//mod process
always @ (posedge clk_sys)
begin 
        case(rx_wstrb)
            64'h1		                :	axi2fifo_wdata_mod <= 6'd63;
            64'h3		                :	axi2fifo_wdata_mod <= 6'd62;
            64'h7		                :	axi2fifo_wdata_mod <= 6'd61;
            64'hf		                :	axi2fifo_wdata_mod <= 6'd60;
            64'h1f		                :	axi2fifo_wdata_mod <= 6'd59;
            64'h3f		                :	axi2fifo_wdata_mod <= 6'd58;
            64'h7f		                :	axi2fifo_wdata_mod <= 6'd57;
            64'hff		                :	axi2fifo_wdata_mod <= 6'd56;
            64'h1ff		                :	axi2fifo_wdata_mod <= 6'd55;
            64'h3ff		                :	axi2fifo_wdata_mod <= 6'd54;
            64'h7ff		                :	axi2fifo_wdata_mod <= 6'd53;
            64'hfff		                :	axi2fifo_wdata_mod <= 6'd52;
            64'h1fff		            :	axi2fifo_wdata_mod <= 6'd51;
            64'h3fff		            :	axi2fifo_wdata_mod <= 6'd50;
            64'h7fff		            :	axi2fifo_wdata_mod <= 6'd49;
            64'hffff		            :	axi2fifo_wdata_mod <= 6'd48;
            64'h1_ffff		            :	axi2fifo_wdata_mod <= 6'd47;
            64'h3_ffff		            :	axi2fifo_wdata_mod <= 6'd46;
            64'h7_ffff		            :	axi2fifo_wdata_mod <= 6'd45;
            64'hf_ffff		            :	axi2fifo_wdata_mod <= 6'd44;
            64'h1f_ffff		            :	axi2fifo_wdata_mod <= 6'd43;
            64'h3f_ffff		            :	axi2fifo_wdata_mod <= 6'd42;
            64'h7f_ffff		            :	axi2fifo_wdata_mod <= 6'd41;
            64'hff_ffff		            :	axi2fifo_wdata_mod <= 6'd40;
            64'h1ff_ffff                :	axi2fifo_wdata_mod <= 6'd39;
            64'h3ff_ffff	            :	axi2fifo_wdata_mod <= 6'd38;
            64'h7ff_ffff		        :	axi2fifo_wdata_mod <= 6'd37;
            64'hfff_ffff		        :	axi2fifo_wdata_mod <= 6'd36;
            64'h1fff_ffff		        :	axi2fifo_wdata_mod <= 6'd35;
            64'h3fff_ffff		        :	axi2fifo_wdata_mod <= 6'd34;
            64'h7fff_ffff		        :	axi2fifo_wdata_mod <= 6'd33;
            64'hffff_ffff		        :	axi2fifo_wdata_mod <= 6'd32;
            64'h1_ffff_ffff		        :	axi2fifo_wdata_mod <= 6'd31;
            64'h3_ffff_ffff		        :	axi2fifo_wdata_mod <= 6'd30;
            64'h7_ffff_ffff		        :	axi2fifo_wdata_mod <= 6'd29;
            64'hf_ffff_ffff		        :	axi2fifo_wdata_mod <= 6'd28;
            64'h1f_ffff_ffff	        :	axi2fifo_wdata_mod <= 6'd27;
            64'h3f_ffff_ffff	        :	axi2fifo_wdata_mod <= 6'd26;
            64'h7f_ffff_ffff		    :	axi2fifo_wdata_mod <= 6'd25;
            64'hff_ffff_ffff		    :	axi2fifo_wdata_mod <= 6'd24;
            64'h1ff_ffff_ffff		    :	axi2fifo_wdata_mod <= 6'd23;
            64'h3ff_ffff_ffff	        :	axi2fifo_wdata_mod <= 6'd22;
            64'h7ff_ffff_ffff		    :	axi2fifo_wdata_mod <= 6'd21;
            64'hfff_ffff_ffff		    :	axi2fifo_wdata_mod <= 6'd20;
            64'h1fff_ffff_ffff		    :	axi2fifo_wdata_mod <= 6'd19;
            64'h3fff_ffff_ffff		    :	axi2fifo_wdata_mod <= 6'd18;
            64'h7fff_ffff_ffff		    :	axi2fifo_wdata_mod <= 6'd17;
            64'hffff_ffff_ffff		    :	axi2fifo_wdata_mod <= 6'd16;
            64'h1_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd15;
            64'h3_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd14;
            64'h7_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd13;
            64'hf_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd12;
            64'h1f_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd11;
            64'h3f_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd10;
            64'h7f_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd9;
            64'hff_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd8;
            64'h1ff_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd7;
            64'h3ff_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd6;
            64'h7ff_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd5;
            64'hfff_ffff_ffff_ffff	    :	axi2fifo_wdata_mod <= 6'd4;
            64'h1fff_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd3;
            64'h3fff_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd2;
            64'h7fff_ffff_ffff_ffff		:	axi2fifo_wdata_mod <= 6'd1;
        default                         :	axi2fifo_wdata_mod <= 6'd0;
        endcase
end

//length process
assign axi2fifo_wdata_len = ({8'd0,rx_tran_num} << 6) - {10'd0,axi2fifo_wdata_mod};

//frm id process
assign axi2fifo_wdata_id = rx_chan_id;

//reserve 
assign axi2fifo_wdata_rsv = 11'd0;

//sop bit calculate
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1 ) begin
        axi2fifo_wdata_sop <= 1'b0;
    end
    else begin
        axi2fifo_wdata_sop <= m_wvalid & s_wready & (~m_wr_1dly);
    end
end

//eop bit calculate
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1 ) begin 
        axi2fifo_wdata_eop <= 1'b0;
    end
    else begin
        axi2fifo_wdata_eop <= m_wvalid & s_wready & m_wlast;
    end
end

//err bit calculate
assign axi4_wdata_err = 1'b0;
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1 ) begin
        axi2fifo_wdata_err <= 1'b0;
    end
    else begin
        axi2fifo_wdata_err <= axi4_wdata_err & m_wvalid & s_wready & m_wlast;
    end
end

//check
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1 ) begin
        axi2fifo_wdata_chk <= 9'h0;
    end
    else begin
        axi2fifo_wdata_chk <= 9'h0;
    end
end

//******************************************************************************
//DFX: err, sta, cnt
//******************************************************************************
always @ (posedge clk_sys)
begin 
    reg_axi4_sl_err <= 32'd0;
    reg_axi4_sl_sta <= 32'd0;
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        axi2fifo_len <= 16'd0;
    end
    else if(axi2fifo_wr == 1'b1) begin
        axi2fifo_len <= axi2fifo_wdata_len; 
    end
    else;
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        axi4_sl_tran_cnt_en <= 1'b0;
    end
    else begin 
        axi4_sl_tran_cnt_en <= m_awvalid & s_awready; 
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if(rst == 1'b1) begin
        axi4_sl_tranok_cnt_en <= 1'b0;
    end
    else begin 
        axi4_sl_tranok_cnt_en <= m_bready & s_bvalid; 
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if(rst == 1'b1) begin
        axi4_sl_frm_cnt_en <= 1'b0;
    end
    else begin 
        axi4_sl_frm_cnt_en <= axi2fifo_wr & axi2fifo_wdata[EOP_POS]; 
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if(rst == 1'b1) begin
        axi4_sl_wr_cnt_en <= 1'b0;
    end
    else begin 
        axi4_sl_wr_cnt_en <= axi2fifo_wr_pre; 
    end
end 

assign axi4_sl_fsm_state = {4'd0,fsm_axi4_state_next,fsm_axi4_state_curr};

always @ (posedge clk_sys or posedge rst)
begin 
    if (rst == 1'b1) begin
        m_wr_1dly <= 1'b0;
    end
    else begin
        m_wr_1dly <= m_wvalid & s_wready;
    end
end

endmodule
