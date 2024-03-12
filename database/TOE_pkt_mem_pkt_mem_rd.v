`timescale 1ns / 1ps
module pkt_mem_rd #(
    parameter    DWID          = 256         ,   
    parameter    CHN_NUM       = 4           ,   
    parameter    MSG_WID       = 13          ,   
    parameter    REQWID        = 37          ,   
    parameter    PTR_WID       = 9           ,   
    parameter    PLST_WID      = 16          ,   
    parameter    CELL_RAM_AWID = 12              
)
(
    input   wire                        clk                         ,   
    input   wire                        rst                         ,   
    input   wire [1-1:0]                pkt_req_vld                 ,   
    output  reg  [1-1:0]                pkt_req_rdy                 ,   
    input   wire [REQWID-1:0]           pkt_req_msg                 ,   
    output  reg  [1-1:0]                out_cell_vld                ,   
    input   wire [1-1:0]                out_cell_rdy                ,   
    output  wire [DWID-1:0]             out_cell_dat                ,   
    output  reg  [MSG_WID-1:0]          out_cell_msg                ,   
    input   wire                        fptr_fifo_nfull             ,   
    output  wire                        fptr_fifo_wen               ,   
    output  wire [PTR_WID-1:0]          fptr_fifo_wdata             ,   
    output  reg                         plst_ram_ren                ,   
    output  reg  [PTR_WID-1:0]          plst_ram_raddr              ,   
    input   wire [PLST_WID-1:0]         plst_ram_rdata              ,   
    output  reg                         plst_ram_wen                ,   
    output  reg  [PTR_WID-1:0]          plst_ram_waddr              ,   
    output  reg  [PLST_WID-1:0]         plst_ram_wdata              ,   
    output  wire                        cell_ram_ren                ,   
    output  wire [CELL_RAM_AWID-1:0]    cell_ram_raddr              ,   
    input   wire [DWID-1:0]             cell_ram_rdata                  
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
localparam    CID_WID       = 4                                    ;    
localparam    PLEN_WID      = 16                                   ;    
localparam    PPTR_WID      = CELL_RAM_AWID                        ;    
localparam    PKT_DROP_LSB  = 37                                  ;    
localparam    PKT_CID_MSB   = 36                                  ;    
localparam    PKT_CID_LSB   = 34                                  ;    
localparam    PKT_PPTR_MSB  = 33                                  ;    
localparam    PKT_PPTR_LSB  = 22                                  ;    
localparam    PKT_PLEN_MSB  = 21                                  ;    
localparam    PKT_PLEN_LSB  = 6                                   ;    
localparam    PKT_CRDT_MSB  = 5                                   ;    
localparam    PKT_CRDT_LSB  = 4                                   ;    
localparam    PKT_RSL_MSB   = 3                                   ;    
localparam    PKT_RSL_LSB   = 3                                   ;    
localparam    PKT_NXT_MSB   = 2                                   ;    
localparam    PKT_NXT_LSB   = 2                                   ;    
localparam    PKT_SOP_MSB   = 1                                   ;    
localparam    PKT_SOP_LSB   = 1                                   ;    
localparam    PKT_EOP_MSB   = 0                                   ;    
localparam    PKT_EOP_LSB   = 0                                   ;    
wire                                    pkt_drop_flag              ;    
reg                                     pkt_drop_flag_latch        ;    
wire [CID_WID-1:0]                      pkt_req_cid                ;    
reg  [CID_WID-1:0]                      pkt_req_cid_latch          ;    
reg                                     pkt_req                    ;    
reg  [PTR_WID-1:0]                      curr_ptr                   ;    
reg  [PTR_WID-1:0]                      curr_ptr_d1                ;    
reg  [PTR_WID*CHN_NUM-1:0]              next_ptr                   ;    
reg  [PLEN_WID-1:0]                     curr_plen                  ;    
reg  [PPTR_WID-PTR_WID:0]               wait_cnt                   ;    
reg                                     plst_ram_wen_pre           ;    
reg  [PTR_WID-1:0]                      plst_ram_waddr_pre         ;    
reg                                     plst_ram_wen_pd1           ;    
reg                                     plst_ram_wen_pd2           ;    
reg                                     plst_ram_wen_pd3           ;    
reg  [CHN_NUM-1:0]                      rls_flag                   ;    
reg                                     fptr_fifo_wen_r            ;    
wire                                    fptr_fifo_wen_init         ;    
wire [PTR_WID-1:0]                      fptr_fifo_wdata_init       ;    
wire                                    init_done                  ;    
reg                                     plst_ram_ren_d1            ;    
wire                                    plst_ram_ren_tmp           ;    
reg                                     cell_sop                   ;    
reg                                     cell_eop_latch             ;    
wire                                    cell_eop                   ;    
reg  [PPTR_WID-PTR_WID-1:0]             cell_rd_cnt                ;    
reg                                     cell_soc                   ;    
assign pkt_drop_flag = pkt_req_msg[PKT_DROP_LSB] ; 
assign pkt_req_cid   = pkt_req_msg[PKT_CID_MSB:PKT_CID_LSB] ;
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        pkt_req_cid_latch <= {CID_WID{1'b0}} ;
        pkt_drop_flag_latch <= 1'b0      ;    
    end
    else if (( pkt_req_vld == 1'b1 ) && ( pkt_req_rdy == 1'b1 ))
    begin
        pkt_req_cid_latch <= pkt_req_cid ;
        pkt_drop_flag_latch <= pkt_drop_flag      ;    
    end
    else ;
end
always @( * )
begin
    if (( init_done == 1'b1 ) && (( pkt_req == 1'b0 )
    || (( cell_ram_ren == 1'b1 ) && ( curr_plen <= DWID/8 ))))
    begin
        pkt_req_rdy = 1'b1 ;
    end
    else
    begin
        pkt_req_rdy = 1'b0 ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        curr_plen <= {PLEN_WID{1'b0}} ;
    end
    else if (( pkt_req_vld == 1'b1 ) && ( pkt_req_rdy == 1'b1 ))
    begin
        curr_plen <= pkt_req_msg[PKT_PLEN_MSB:PKT_PLEN_LSB] ;
    end
    else if ( cell_ram_ren == 1'b1 )
    begin
        if ( curr_plen <= DWID/8 )
        begin
            curr_plen <= {PLEN_WID{1'b0}} ;
        end
        else
        begin
            curr_plen <= curr_plen - DWID/8 ;
        end
    end
    else ;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        pkt_req <= 1'b0 ;
    end
    else if (( pkt_req_vld == 1'b1 ) && ( pkt_req_rdy == 1'b1 ))
    begin
        pkt_req <= 1'b1 ;
    end
    else if (( cell_ram_ren == 1'b1 ) && ( curr_plen <= DWID/8 ))
    begin
        pkt_req <= 1'b0 ;
    end
    else ;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        curr_ptr    <= {PTR_WID{1'b0}} ;
    end
    else if (( pkt_req_vld == 1'b1 ) && ( pkt_req_rdy == 1'b1 ))
    begin
        if ( pkt_req_msg[PKT_NXT_LSB] == 1'b0 )
        begin
            curr_ptr <= pkt_req_msg[PKT_PPTR_LSB +: PTR_WID] ;
        end
        else
        begin
            curr_ptr <= next_ptr[PTR_WID*pkt_req_cid+:PTR_WID] ;
        end
    end
    else if (( cell_ram_ren == 1'b1 ) && ( cell_rd_cnt == {(PPTR_WID-PTR_WID){1'b1}} ))
    begin
        curr_ptr <= next_ptr[PTR_WID*pkt_req_cid_latch+:PTR_WID] ;
    end
    else ;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        curr_ptr_d1 <= {PTR_WID{1'b0}} ;
    end
    else 
    begin
        curr_ptr_d1 <= curr_ptr ;
    end
end
assign plst_ram_ren_tmp = ((( pkt_req_vld == 1'b1 ) && ( pkt_req_rdy == 1'b1 ))
                    || (( pkt_req == 1'b1 ) && ( cell_rd_cnt == {(PPTR_WID-PTR_WID){1'b1}} ) ) ) ? 1'b1 : 1'b0 ;
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        plst_ram_ren <= 1'b0 ;
    end
    else 
    begin
        plst_ram_ren <= plst_ram_ren_tmp;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        plst_ram_ren_d1 <= 1'b0 ;
    end
    else
    begin
        plst_ram_ren_d1 <= plst_ram_ren ;
    end
end
genvar i ;
generate
for ( i = 0 ; i < CHN_NUM ; i = i +1 )
begin : nxt_ptr_loop
    always @( posedge clk or posedge rst )
    begin
        if ( rst == 1'b1 )
        begin
            next_ptr[PTR_WID*i+:PTR_WID] <= {PTR_WID{1'b0}} ;
        end
        else if (( plst_ram_ren_d1 == 1'b1 ) && ( pkt_req_cid_latch == i ))
        begin
            next_ptr[PTR_WID*i+:PTR_WID] <= plst_ram_rdata[PPTR_WID-PTR_WID +: PTR_WID] ;
        end
        else ;
    end
end
endgenerate
always @( posedge clk or posedge rst )
begin
    if( rst==1'b1 )
    begin
        plst_ram_raddr <= 0;
    end
    else if (( pkt_req_vld == 1'b1 ) && ( pkt_req_rdy == 1'b1 ))
    begin
        if ( pkt_req_msg[PKT_NXT_LSB] == 1'b0 )
        begin
            plst_ram_raddr <= pkt_req_msg[PKT_PPTR_LSB +: PTR_WID] ;
        end
        else
        begin
            plst_ram_raddr <= next_ptr[PTR_WID*pkt_req_cid+:PTR_WID] ;
        end
    end
    else
    begin
        plst_ram_raddr <= next_ptr[PTR_WID*pkt_req_cid_latch+:PTR_WID] ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        plst_ram_wen_pre   <= 1'b0 ;
        plst_ram_waddr_pre <= {PTR_WID{1'b0}} ;
    end
    else
    begin
        plst_ram_wen_pre   <= 1'b0 ;
        plst_ram_waddr_pre <= plst_ram_waddr_pre ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        plst_ram_wdata <= {PLST_WID{1'b0}} ;
    end
    else if ( plst_ram_wen_pre == 1'b1 )
    begin
        plst_ram_wdata[PLST_WID-1:PLST_WID-2] <= plst_ram_rdata[PLST_WID-1:PLST_WID-2] ;
        plst_ram_wdata[PLST_WID-3:PLST_WID-4] <= plst_ram_rdata[PLST_WID-3:PLST_WID-4] - 2'b1 ;
        plst_ram_wdata[PLST_WID-5:0]          <= plst_ram_rdata[PLST_WID-5:0] ;
    end
    else ;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        plst_ram_wen_pd1 <= 1'b0 ;
        plst_ram_wen_pd2 <= 1'b0 ;
        plst_ram_wen_pd3 <= 1'b0 ;
    end
    else
    begin
        plst_ram_wen_pd1 <= plst_ram_wen_pre ;
        plst_ram_wen_pd2 <= plst_ram_wen_pd1 ;
        plst_ram_wen_pd3 <= plst_ram_wen_pd2 ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        plst_ram_wen <= 1'b0 ;
    end
    else if (( plst_ram_wen_pre == 1'b1 ) || ( plst_ram_wen_pd1 == 1'b1 )
          || ( plst_ram_wen_pd2 == 1'b1 ) || ( plst_ram_wen_pd3 == 1'b1 ))
    begin
        plst_ram_wen <= 1'b1 ;
    end
    else
    begin
        plst_ram_wen <= 1'b0 ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        plst_ram_waddr <= {PTR_WID{1'b0}} ;
    end
    else
    begin
        plst_ram_waddr <= plst_ram_waddr_pre ;
    end
end
genvar j ;
generate
for ( j = 0 ; j < CHN_NUM ; j = j +1 )
begin : rls_flag_loop
    always @( posedge clk or posedge rst )
    begin
        if ( rst == 1'b1 )
        begin
            rls_flag[j] <= 1'b0 ;
        end
        else if (( pkt_req_vld == 1'b1 ) && ( pkt_req_rdy == 1'b1 ) && ( pkt_req_cid == j ))
        begin
            rls_flag[j] <= pkt_req_msg[PKT_RSL_LSB] ;
        end
        else if (( plst_ram_wen_pre == 1'b1 ) && ( pkt_req_cid_latch == j ))
        begin
            if ( plst_ram_rdata[PLST_WID-3:PLST_WID-4] == 2'b1 )
            begin
                rls_flag[j] <= 1'b1 ;
            end
            else
            begin
                rls_flag[j] <= 1'b0 ;
            end
        end
    end
end
endgenerate
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        fptr_fifo_wen_r <= 1'b0 ;
    end
    else if (( rls_flag[pkt_req_cid_latch] == 1'b1 ) && ( cell_ram_ren == 1'b1 )
         && (( cell_rd_cnt == {(PPTR_WID-PTR_WID){1'b1}} ) || ( curr_plen <= DWID/8 )))
    begin
        fptr_fifo_wen_r <= 1'b1 ;
    end
    else
    begin
        fptr_fifo_wen_r <= 1'b0 ;
    end
end
assign fptr_fifo_wen   = fptr_fifo_wen_init | fptr_fifo_wen_r ;
assign fptr_fifo_wdata = ( fptr_fifo_wen_init == 1'b1 ) ? fptr_fifo_wdata_init : curr_ptr_d1 ;
fptr_fifo_init #(
    .PTR_WID                ( PTR_WID                   )
) u_fptr_fifo_init (
    .clk                    ( clk                       ),              
    .rst                    ( rst                       ),              
    .fptr_fifo_wen          ( fptr_fifo_wen_init        ),              
    .fptr_fifo_wdata        ( fptr_fifo_wdata_init      ),              
    .init_done              ( init_done                 )               
);
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        cell_sop <= 1'b0 ;
    end
    else if (( pkt_req_vld == 1'b1 ) && ( pkt_req_rdy == 1'b1 ) && ( pkt_req_msg[PKT_NXT_LSB] == 1'b0 ))
    begin
        cell_sop <= 1'b1 ;
    end
    else if ( plst_ram_ren_tmp == 1'b1 )
    begin
        cell_sop <= 1'b0 ;
    end
    else ;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        cell_rd_cnt <= {(PPTR_WID-PTR_WID){1'b0}} ;
    end
    else if ( plst_ram_ren_tmp == 1'b1 )
    begin
        cell_rd_cnt <= {(PPTR_WID-PTR_WID){1'b0}} ;
    end
    else if ( cell_ram_ren == 1'b1 )
    begin
        cell_rd_cnt <= cell_rd_cnt + {{(PPTR_WID-PTR_WID-1){1'b0}},1'b1} ;
    end
    else ;
end
assign cell_ram_ren   = ( curr_plen != {PLEN_WID{1'b0}} && cell_rd_cnt!=0 ) ? 1'b1 : ( curr_plen != {PLEN_WID{1'b0}} && cell_rd_cnt==0 ) ? out_cell_rdy : 1'b0 ;
assign cell_ram_raddr = {curr_ptr, cell_rd_cnt} ;
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        out_cell_vld <= 1'b0 ;
    end
    else
    begin
            out_cell_vld <= cell_ram_ren & (~pkt_drop_flag_latch) ;
    end
end
assign out_cell_dat = cell_ram_rdata ;
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        cell_soc <= 1'b0 ;
    end
    else if ( plst_ram_ren_tmp == 1'b1 )
    begin
        cell_soc <= 1'b1 ;
    end
    else if ( cell_ram_ren == 1'b1 )
    begin
        cell_soc <= 1'b0 ;
    end
    else ;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        out_cell_msg <= {MSG_WID{1'b0}}  ;
    end
    else
    begin
        if (( cell_ram_ren == 1'b1 ) && ( curr_plen <= DWID/8 ))
        begin
            out_cell_msg[CELL_MTY_MSB:CELL_MTY_LSB] <= 5'h1f - curr_plen[4:0] ;
            out_cell_msg[CELL_EOP_LSB] <= 1'b1 ;
        end
        else
        begin
            out_cell_msg[CELL_MTY_MSB:CELL_MTY_LSB] <= {MTY_WID{1'b0}} ;
            out_cell_msg[CELL_EOP_LSB] <= 1'b0 ;
        end
        out_cell_msg[CHN_ID_MSB:CHN_ID_LSB] <= pkt_req_cid_latch ;
        out_cell_msg[PKT_ERR_LSB] <= 1'b0 ;
        if (( cell_ram_ren == 1'b1 ) && (( cell_rd_cnt == {(PPTR_WID-PTR_WID){1'b1}} ) || ( curr_plen <= DWID/8 )))
        begin
            out_cell_msg[CELL_EOC_LSB] <= 1'b1 ;
        end
        else
        begin
            out_cell_msg[CELL_EOC_LSB] <= 1'b0 ;
        end
        out_cell_msg[CELL_SOC_LSB] <= cell_soc ;
        out_cell_msg[CELL_SOP_LSB] <= cell_sop & cell_soc ;
    end
end
endmodule
