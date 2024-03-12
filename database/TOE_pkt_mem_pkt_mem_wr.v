`timescale 1ns / 1ps
module pkt_mem_wr #(
    parameter    DAT_TYP       = "ETH"       ,   
    parameter    CHN_NUM       = 6           ,   
    parameter    DWID          = 256         ,   
    parameter    MSG_WID       = 13          ,   
    parameter    crc_WID       = 16          ,   
    parameter    PIMWID        = 48          ,   
    parameter    PTR_WID       = 9           ,   
    parameter    PLST_WID      = 16          ,   
    parameter    CELL_RAM_AWID = 12              
)
(
    input   wire                        clk                         ,   
    input   wire                        rst                         ,   
    input   wire                        in_cell_vld                 ,   
    output  wire                        in_cell_rdy                 ,   
    input   wire [DWID-1:0]             in_cell_dat                 ,   
    input   wire [MSG_WID-1:0]          in_cell_msg                 ,   
    output  reg                         pkt_info_vld                ,   
    input   wire                        pkt_info_rdy                ,   
    output  reg  [PIMWID-1:0]           pkt_info_msg                ,   
    input   wire                        fptr_fifo_nempty            ,   
    output  wire                        fptr_fifo_ren               ,   
    input   wire [PTR_WID-1:0]          fptr_fifo_rdata             ,   
    output  reg                         plst_ram_wen                ,   
    output  reg  [PTR_WID-1:0]          plst_ram_waddr              ,   
    output  reg  [PLST_WID-1:0]         plst_ram_wdata              ,   
    output  wire                        cell_ram_wen                ,   
    output  wire [CELL_RAM_AWID-1:0]    cell_ram_waddr              ,   
    output  wire [DWID-1:0]             cell_ram_wdata                  
);
localparam    CHN_ID_MSB    = 15                                    ;    
localparam    CHN_ID_LSB    = 12                                    ;    
localparam    PKT_ERR_MSB   = 11                                   ;    
localparam    PKT_ERR_LSB   = 11                                   ;    
localparam    CELL_MTY_MSB  = 8                                    ;    
localparam    CELL_MTY_LSB  = 4                                    ;    
localparam    CELL_SOC_MSB  = 3                                    ;    
localparam    CELL_SOC_LSB  = 3                                    ;    
localparam    CELL_EOC_MSB  = 2                                    ;    
localparam    CELL_EOC_LSB  = 2                                    ;    
localparam    CELL_SOP_MSB  = 1                                    ;    
localparam    CELL_SOP_LSB  = 1                                    ;    
localparam    CELL_EOP_MSB  = 0                                    ;    
localparam    CELL_EOP_LSB  = 0                                    ;    
localparam    MTY_WID       = 5                                    ;    
localparam    CID_WID       = clogb2(CHN_NUM)                      ;    
localparam    PLEN_WID      = 16                                   ;    
localparam    PPTR_WID      = CELL_RAM_AWID                        ;    
reg                                     req_ptr_vld                ;    
reg  [PTR_WID-1:0]                      req_ptr                    ;    
reg  [CHN_NUM*PTR_WID-1:0]              first_ptr     		   ;    
reg  [CHN_NUM*PTR_WID-1:0]              curr_ptr      		   ;    
reg  [CHN_NUM*PTR_WID-1:0]              pre_ptr       		   ;    
reg  [CHN_NUM*1-1:0]                    sop_flag      		   ;    
reg  [PLEN_WID*CHN_NUM-1:0]             pkt_len                    ;    
reg  [CHN_NUM*PTR_WID-1:0]              first_ptr_dbg     ;    
reg  [CHN_NUM*PTR_WID-1:0]              curr_ptr_dbg      ;    
reg  [CHN_NUM*PTR_WID-1:0]              pre_ptr_dbg       ;    
reg  [CHN_NUM*1      -1:0]              sop_flag_dbg      ;    
reg  [CHN_NUM*PLEN_WID-1:0]             pkt_len_dbg       ;    
reg  [CHN_NUM*PTR_WID-1:0]              first_ptr_d1               ;    
reg  [CHN_NUM*PTR_WID-1:0]              first_ptr_d2               ;    
reg  [CHN_NUM*PTR_WID-1:0]              first_ptr_d3               ;    
reg  [CHN_NUM*PTR_WID-1:0]              first_ptr_d4               ;    
reg  [CHN_NUM*PTR_WID-1:0]              first_ptr_d5               ;    
reg  [CHN_NUM*PTR_WID-1:0]              first_ptr_d6               ;    
reg  [CHN_NUM*PTR_WID-1:0]              first_ptr_d7               ;    
wire [CID_WID-1:0]                      in_cell_cid                ;    
reg                                     in_cell_vld_d1             ;    
reg  [DWID-1:0]                         in_cell_dat_d1             ;    
reg  [MSG_WID-1:0]                        in_cell_msg_d1             ;    
wire [CID_WID-1:0]                      in_cell_cid_d1             ;    
wire [CID_WID-1:0]                      in_cell_cid_d2             ;    
reg                                     in_cell_vld_d2             ;    
reg  [MSG_WID-1:0]                        in_cell_msg_d2             ;    
reg                                     in_cell_vld_d3             ;    
reg  [MSG_WID-1:0]                        in_cell_msg_d3             ;    
reg                                     in_cell_vld_d4             ;    
reg  [MSG_WID-1:0]                        in_cell_msg_d4             ;    
reg                                     in_cell_vld_d5             ;    
reg  [MSG_WID-1:0]                        in_cell_msg_d5             ;    
reg                                     in_cell_vld_d6             ;    
reg  [MSG_WID-1:0]                        in_cell_msg_d6             ;    
reg                                     in_cell_vld_d7             ;    
reg  [MSG_WID-1:0]                        in_cell_msg_d7             ;    
wire [CID_WID-1:0]                      in_cell_cid_d7             ;    
wire [crc_WID-1:0]                      crc_out                    ;    
reg  [PPTR_WID-PTR_WID-1:0]             cell_wr_cnt                ;    
reg  [PPTR_WID-PTR_WID-1:0]             cell_wr_cnt_d1             ;    
integer					k1			;
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        req_ptr_vld <= 1'b0 ;
    end
    else if ( fptr_fifo_ren == 1'b1 )
    begin
        req_ptr_vld <= 1'b1 ;
    end
    else if (( in_cell_vld == 1'b1 ) && ( in_cell_msg[CELL_SOC_LSB] == 1'b1 ))
    begin
        req_ptr_vld <= 1'b0 ;
    end
    else ;
end
assign in_cell_rdy = req_ptr_vld & pkt_info_rdy ;
assign fptr_fifo_ren = (( req_ptr_vld == 1'b0 ) && ( fptr_fifo_nempty == 1'b1 )) ? 1'b1 : 1'b0 ;
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        req_ptr <= {PTR_WID{1'b0}} ;
    end
    else if ( fptr_fifo_ren == 1'b1 )
    begin
        req_ptr <= fptr_fifo_rdata ;
    end
    else ;
end
genvar i ;
generate
for ( i = 0 ; i < CHN_NUM ; i = i +1 )
begin : ptr_loop
    always @( posedge clk or posedge rst )
    begin
        if ( rst == 1'b1 )
        begin
            first_ptr[i*PTR_WID+:PTR_WID] <= {PTR_WID{1'b0}} ;
            curr_ptr[i*PTR_WID+:PTR_WID]  <= {PTR_WID{1'b0}} ;
            pre_ptr[i*PTR_WID+:PTR_WID]   <= {PTR_WID{1'b0}} ;
            sop_flag[i*1+:1]  		  <= 1'b0 ;
        end
        else if (( in_cell_vld == 1'b1 ) && ( in_cell_msg[CELL_SOC_LSB] == 1'b1 )
              && ( in_cell_msg[CHN_ID_MSB:CHN_ID_LSB] == i ))
        begin
            curr_ptr[i*PTR_WID+:PTR_WID] <= req_ptr ;
            pre_ptr[i*PTR_WID+:PTR_WID]  <= curr_ptr[i*PTR_WID+:PTR_WID] ;
            if ( in_cell_msg[CELL_SOP_LSB] == 1'b1 )
            begin
                first_ptr[i*PTR_WID+:PTR_WID] <= req_ptr ;
                sop_flag[i*1+:1]  <= 1'b1 ;
            end
            else
            begin
                first_ptr[i*PTR_WID+:PTR_WID] <= first_ptr[i*PTR_WID+:PTR_WID] ;
                sop_flag[i*1+:1] <= 1'b0 ;
            end
        end
        else ;
    end
end
endgenerate
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        in_cell_vld_d1 <= 1'b0 ;
        in_cell_dat_d1 <= {DWID{1'b0}} ;
        in_cell_msg_d1 <= {MSG_WID{1'b0}} ;
    end
    else
    begin
        in_cell_vld_d1 <= in_cell_vld ;
        in_cell_dat_d1 <= in_cell_dat ;
        in_cell_msg_d1 <= in_cell_msg ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        in_cell_vld_d2 <= 1'b0 ;
        in_cell_msg_d2 <= {MSG_WID{1'b0}} ;
        in_cell_vld_d3 <= 1'b0 ;
        in_cell_msg_d3 <= {MSG_WID{1'b0}} ;
        in_cell_vld_d4 <= 1'b0 ;
        in_cell_msg_d4 <= {MSG_WID{1'b0}} ;
        in_cell_vld_d5 <= 1'b0 ;
        in_cell_msg_d5 <= {MSG_WID{1'b0}} ;
        in_cell_vld_d6 <= 1'b0 ;
        in_cell_msg_d6 <= {MSG_WID{1'b0}} ;
        in_cell_vld_d7 <= 1'b0 ;
        in_cell_msg_d7 <= {MSG_WID{1'b0}} ;
    end
    else
    begin
        in_cell_vld_d2 <= in_cell_vld_d1 ;
        in_cell_msg_d2 <= in_cell_msg_d1 ;
        in_cell_vld_d3 <= in_cell_vld_d2 ;
        in_cell_msg_d3 <= in_cell_msg_d2 ;
        in_cell_vld_d4 <= in_cell_vld_d3 ;
        in_cell_msg_d4 <= in_cell_msg_d3 ;
        in_cell_vld_d5 <= in_cell_vld_d4 ;
        in_cell_msg_d5 <= in_cell_msg_d4 ;
        in_cell_vld_d6 <= in_cell_vld_d5 ;
        in_cell_msg_d6 <= in_cell_msg_d5 ;
        in_cell_vld_d7 <= in_cell_vld_d6 ;
        in_cell_msg_d7 <= in_cell_msg_d6 ;
    end
end
genvar j ;
generate
for ( j = 0 ; j < CHN_NUM ; j = j +1 )
begin : plen_loop
    always @( posedge clk or posedge rst )
    begin
        if ( rst == 1'b1 )
        begin
            pkt_len[j*PLEN_WID+:PLEN_WID] <= {PLEN_WID{1'b0}} ;
        end
        else if (( in_cell_vld_d6 == 1'b1 ) && ( in_cell_msg_d6[CHN_ID_MSB:CHN_ID_LSB] == j ))
        begin
            if (( in_cell_msg_d6[CELL_SOC_LSB] == 1'b1 ) && ( in_cell_msg_d6[CELL_EOC_LSB] == 1'b1 ) &&( in_cell_msg_d6[CELL_SOP_LSB] == 1'b1 ))
            begin
                pkt_len[j*PLEN_WID+:PLEN_WID] <= DWID/8 - {{(PLEN_WID-MTY_WID){1'b0}},in_cell_msg_d6[CELL_MTY_MSB:CELL_MTY_LSB]} ;
            end
            else if (( in_cell_msg_d6[CELL_SOC_LSB] == 1'b1 ) && ( in_cell_msg_d6[CELL_SOP_LSB] == 1'b1 ))
            begin
                pkt_len[j*PLEN_WID+:PLEN_WID] <= DWID/8 ;
            end
            else if ( in_cell_msg_d6[CELL_EOC_LSB] == 1'b1 )
            begin
                pkt_len[j*PLEN_WID+:PLEN_WID]<= pkt_len[j*PLEN_WID+:PLEN_WID] + DWID/8 - {{(PLEN_WID-MTY_WID){1'b0}},in_cell_msg_d6[CELL_MTY_MSB:CELL_MTY_LSB]} ;
            end
            else
            begin
                pkt_len[j*PLEN_WID+:PLEN_WID] <= pkt_len[j*PLEN_WID+:PLEN_WID] + DWID/8 ;
            end
        end
        else ;
    end
end
endgenerate
assign in_cell_cid    = in_cell_msg[CHN_ID_LSB +: CID_WID] ;
assign in_cell_cid_d1 = in_cell_msg_d1[CHN_ID_LSB +: CID_WID] ;
assign in_cell_cid_d2 = in_cell_msg_d2[CHN_ID_LSB +: CID_WID] ;
assign in_cell_cid_d7 = in_cell_msg_d7[CHN_ID_LSB +: CID_WID] ;
reg [15:0] plen;  
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        plen <= 16'h0 ;
    end
    else
    begin
		plen <= in_cell_dat[127:112] + 16'd14; 
    end
end
crc_gen #(
    .DAT_TYP                ( DAT_TYP                   ),
    .CHN_NUM                ( CHN_NUM                   ),
    .DWID                   ( DWID                      )
) u_crc_pre (
    .clk                    ( clk                       ),              
    .rst                    ( rst                       ),              
    .vld                    ( in_cell_vld_d1            ),              
    .cid                    ( in_cell_msg_d1[CHN_ID_LSB+:CID_WID] ),              
    .soc                    ( in_cell_msg_d1[CELL_SOC_LSB] ),              
    .eoc                    ( in_cell_msg_d1[CELL_EOC_LSB] ),              
    .sop                    ( in_cell_msg_d1[CELL_SOP_LSB] ),              
    .eop                    ( in_cell_msg_d1[CELL_EOP_LSB] ),              
    .mty                    ( in_cell_msg_d1[CELL_MTY_MSB:CELL_MTY_LSB] ),              
    .plen                   ( plen                      ),              
    .data                   ( in_cell_dat_d1            ),              
    .crc_out_vld            (                           ),              
    .crc_out                ( crc_out                   )               
);
genvar k ;
generate
for ( k = 0 ; k < CHN_NUM ; k = k +1 )
begin : delay_loop
    always @( posedge clk or posedge rst )
    begin
        if ( rst == 1'b1 )
        begin
            first_ptr_d1[k*PTR_WID+:PTR_WID] <= {PTR_WID{1'b0}} ;
            first_ptr_d2[k*PTR_WID+:PTR_WID] <= {PTR_WID{1'b0}} ;
            first_ptr_d3[k*PTR_WID+:PTR_WID] <= {PTR_WID{1'b0}} ;
            first_ptr_d4[k*PTR_WID+:PTR_WID] <= {PTR_WID{1'b0}} ;
            first_ptr_d5[k*PTR_WID+:PTR_WID] <= {PTR_WID{1'b0}} ;
            first_ptr_d6[k*PTR_WID+:PTR_WID] <= {PTR_WID{1'b0}} ;
            first_ptr_d7[k*PTR_WID+:PTR_WID] <= {PTR_WID{1'b0}} ;
        end
        else
        begin
            first_ptr_d1[k*PTR_WID+:PTR_WID] <= first_ptr[k*PTR_WID+:PTR_WID] ;
            first_ptr_d2[k*PTR_WID+:PTR_WID] <= first_ptr_d1[k*PTR_WID+:PTR_WID] ;
            first_ptr_d3[k*PTR_WID+:PTR_WID] <= first_ptr_d2[k*PTR_WID+:PTR_WID] ;
            first_ptr_d4[k*PTR_WID+:PTR_WID] <= first_ptr_d3[k*PTR_WID+:PTR_WID] ;
            first_ptr_d5[k*PTR_WID+:PTR_WID] <= first_ptr_d4[k*PTR_WID+:PTR_WID] ;
            first_ptr_d6[k*PTR_WID+:PTR_WID] <= first_ptr_d5[k*PTR_WID+:PTR_WID] ;
            first_ptr_d7[k*PTR_WID+:PTR_WID] <= first_ptr_d6[k*PTR_WID+:PTR_WID] ;
        end
    end
end
endgenerate
reg [3:0] cid_tmp;
always@( * ) begin
   cid_tmp = 0;
   cid_tmp[CID_WID-1:0] = in_cell_cid_d7;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        pkt_info_vld <= 1'b0 ;
        pkt_info_msg <= {PIMWID{1'b0}} ;
    end
    else if (( in_cell_vld_d7 == 1'b1 ) && ( in_cell_msg_d7[CELL_EOC_LSB] == 1'b1 ) && ( in_cell_msg_d7[CELL_EOP_LSB] == 1'b1 ))
    begin
        pkt_info_vld <= 1'b1 ;
        pkt_info_msg[47:36] <= first_ptr_d6[in_cell_cid_d7*PTR_WID+:PTR_WID];
        pkt_info_msg[35:20] <= pkt_len[in_cell_cid_d7*PLEN_WID+:PLEN_WID];
        pkt_info_msg[19:4]  <= crc_out[crc_WID-1:0];
        pkt_info_msg[3:0]   <= cid_tmp[3:0];
    end
    else
    begin
        pkt_info_vld <= 1'b0 ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        plst_ram_wen   <= 1'b0 ;
        plst_ram_waddr <= {PTR_WID{1'b0}} ;
        plst_ram_wdata <= {PLST_WID{1'b0}} ;
    end
    else if (( in_cell_vld_d1 == 1'b1 ) && ( in_cell_msg_d1[CELL_EOC_LSB] == 1'b1 ))
    begin
        if ( sop_flag[in_cell_cid_d1] == 1'b0 )
        begin
            plst_ram_wen <= 1'b1 ;
        end
        else
        begin
            plst_ram_wen <= 1'b0 ;
        end
        plst_ram_waddr <= pre_ptr[in_cell_cid_d1*PTR_WID+:PTR_WID] ;
        plst_ram_wdata <= {sop_flag[in_cell_cid_d1], in_cell_msg_d1[CELL_EOP_LSB], 2'b11 , curr_ptr[in_cell_cid_d1*PTR_WID+:PTR_WID], {(PPTR_WID-PTR_WID){1'b0}}} ;
    end
    else if (( in_cell_vld_d2 == 1'b1 ) && ( in_cell_msg_d2[CELL_EOC_LSB] == 1'b1 ) && ( in_cell_msg_d2[CELL_EOP_LSB] == 1'b1 ))
    begin
        plst_ram_wen   <= 1'b1 ;
        plst_ram_waddr <= curr_ptr[in_cell_cid_d2*PTR_WID+:PTR_WID] ;
        plst_ram_wdata <= {sop_flag[in_cell_cid_d2], 1'b1, 2'b11 ,first_ptr[in_cell_cid_d2*PTR_WID+:PTR_WID], {(PPTR_WID-PTR_WID){1'b0}}} ;
    end
    else
    begin
        plst_ram_wen   <= 1'b0 ;
        plst_ram_waddr <= plst_ram_waddr ;
        plst_ram_wdata <= plst_ram_wdata ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        cell_wr_cnt <= {(PPTR_WID-PTR_WID){1'b0}} ;
    end
    else if ( in_cell_vld == 1'b1 )
    begin
        if ( in_cell_msg[CELL_EOC_LSB] == 1'b1 )
        begin
            cell_wr_cnt <= {(PPTR_WID-PTR_WID){1'b0}} ;
        end
        else
        begin
            cell_wr_cnt <= cell_wr_cnt + {{(PPTR_WID-PTR_WID-1){1'b0}},1'b1} ;
        end
    end
    else ;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        cell_wr_cnt_d1 <= {(PPTR_WID-PTR_WID){1'b0}} ;
    end
    else
    begin
        cell_wr_cnt_d1 <= cell_wr_cnt ;
    end
end
assign cell_ram_wen   = in_cell_vld_d1 ;
assign cell_ram_waddr = {curr_ptr[in_cell_cid_d1*PTR_WID+:PTR_WID], cell_wr_cnt_d1} ;
assign cell_ram_wdata = in_cell_dat_d1 ;
always@(*)begin
    for( k1=0; k1<CHN_NUM; k1=k1+1 ) begin
	first_ptr_dbg[k1*PTR_WID  +: PTR_WID  ]  = first_ptr[k1*PTR_WID+:PTR_WID]   ;    
	curr_ptr_dbg [k1*PTR_WID  +: PTR_WID  ]  = curr_ptr [k1*PTR_WID+:PTR_WID]   ;    
	pre_ptr_dbg  [k1*PTR_WID  +: PTR_WID  ]  = pre_ptr  [k1*PTR_WID+:PTR_WID]   ;    
	sop_flag_dbg [k1*1        +: 1        ]  = sop_flag [k1*1+:1]   ;    
    end
end
function integer clogb2;
  input integer depth;
  integer depth_reg;
        begin
        depth_reg = depth;
        for (clogb2=0; depth_reg>0; clogb2=clogb2+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**clogb2 >= depth*2 )begin
          clogb2 = clogb2 - 1;
        end
        end 
endfunction
endmodule
