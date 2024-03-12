`timescale 1ns / 1ps
module sync_table_fifo #(
        parameter   CELL_CHN_NUM    = 2                   , 
        parameter   INFO_WID        = CELL_CHN_NUM        , 
        parameter   CDWID           = {16'd128, 16'd128}  , 
        parameter   CELLSZ          = {16'd1  , 16'd1 }   , 
        parameter   MAX_CELLSZ      = 4                   , 
        parameter   GAP_NUM         = 16                  , 
        parameter   CDWID_SUM       = 256                   
) (
        input wire    clk    ,
        input wire    rst    ,
        input   wire    [1-1            :0]   in_msg_nempty  ,
        output  reg     [1-1            :0]   in_msg_rd     ,
        input   wire    [INFO_WID-1     :0]   in_msg_rdata   ,
        input   wire    [CELL_CHN_NUM-1 :0]   in_cpkt_nempty  ,
        output  reg     [CELL_CHN_NUM-1 :0]   in_cpkt_rd     ,
        output  wire    [CELL_CHN_NUM-1 :0]   in_cpkt_reoc    ,
        input   wire    [CDWID_SUM-1    :0]   in_cpkt_rdata   ,
        output  reg     [1-1            :0]   out_msg_vld    ,
        input   wire    [1-1            :0]   out_msg_rdy    ,
        output  reg     [INFO_WID-1     :0]   out_msg_dat    ,
        output  reg     [CELL_CHN_NUM-1 :0]   out_cpkt_vld    ,
        output  reg     [CELL_CHN_NUM-1 :0]   out_cpkt_last   ,
        input   wire    [CELL_CHN_NUM-1 :0]   out_cpkt_rdy    ,
        output  reg     [CDWID_SUM-1    :0]   out_cpkt_dat    ,
        output  wire    [32-1           :0]   dbg_sig
);
genvar          i       ;  
genvar          j       ;
reg [15:0]  cnt_cpkt_vld;   
always @ (posedge clk or posedge rst) begin
        if( rst==1'b1 )begin
                cnt_cpkt_vld <= 0;
        end
        else begin
                if( cnt_cpkt_vld==(MAX_CELLSZ-1) )begin
                        cnt_cpkt_vld <= 0;
                end
                else if( (|in_cpkt_rd)==1'b1 ) begin
                        cnt_cpkt_vld <= cnt_cpkt_vld + 1'b1;
                end
                else if( cnt_cpkt_vld!=0 ) begin
                        cnt_cpkt_vld <= cnt_cpkt_vld + 1'b1;
                end
        end
end

reg    [1-1          :0]   in_msg_rd_d1  ;
reg    [INFO_WID-1   :0]   in_msg_rdata_d1 ;
always @ (posedge clk or posedge rst) begin
        if( rst==1'b1 )begin
                in_msg_rd_d1    <= 1'b0;
                in_msg_rdata_d1  <= 0;
        end
        else begin
                in_msg_rd_d1    <= in_msg_rd    ;
                in_msg_rdata_d1  <= in_msg_rdata  ;
        end
end


reg [15:0]  cnt_gap;   

always @ (posedge clk or posedge rst) begin
        if( rst==1'b1 )begin
                in_msg_rd   <= 1'b0;
        end
        else begin
                if( |in_cpkt_rd==1'b0
                        && cnt_cpkt_vld==0
                        && cnt_gap > GAP_NUM
                        && in_msg_rd==1'b0 && (in_msg_nempty==1'b1) && (out_msg_rdy==1'b1)
                && (in_msg_rdata[CELL_CHN_NUM-1:0] & in_cpkt_nempty)==in_msg_rdata[CELL_CHN_NUM-1:0] ) begin
                        in_msg_rd   <= 1'b1;
                end
                else begin
                        in_msg_rd   <= 1'b0;
                end
        end
end

always @ (posedge clk or posedge rst) begin
        if( rst==1'b1 )begin
                cnt_gap <= 0;
        end
        else begin
                if( in_msg_rd==1'b1 )begin
                        cnt_gap <= 0;
                end
                else begin
                        cnt_gap <= cnt_gap + 1'b1;
                end
        end
end

generate
for( i=0; i<CELL_CHN_NUM; i=i+1 ) begin : in_cpkt_rd_proc
        assign in_cpkt_reoc[i] = ( in_cpkt_rd[i]==1'b1 && cnt_cpkt_vld==(CELLSZ[16*i+:16]-1) ) ? 1'b1 : 1'b0;
end
endgenerate
always @ (posedge clk or posedge rst) begin
        if( rst==1'b1 )begin
                out_msg_vld  <= 0;
                out_cpkt_vld  <= 0;
                out_cpkt_last  <= 0;
                out_msg_dat <= 0;
                out_cpkt_dat <= 0;
        end
        else begin
                out_msg_vld  <= in_msg_rd_d1 ;
                out_cpkt_vld  <= in_cpkt_rd  ;
                out_cpkt_last <= in_cpkt_reoc  ;
                out_msg_dat <= in_msg_rdata_d1 ;
                out_cpkt_dat <= in_cpkt_rdata ;
        end
end

assign dbg_sig = 32'h0;
function integer wid_sum;
        input [16*8-1:0] wid;
        input num;
        integer i;
        begin
                wid_sum = 0;
                for ( i=0; i<num; i=i+1 ) begin
                        wid_sum = wid_sum + wid[i*16 +: 16];
                end
        end
endfunction

reg [CELL_CHN_NUM-1:0]  cpkt_vld_reg;   
always @ ( * ) begin
        cpkt_vld_reg = (in_msg_rdata[CELL_CHN_NUM-1:0] & in_cpkt_nempty[CELL_CHN_NUM-1:0]);
end
generate
for( j=0; j<CELL_CHN_NUM; j=j+1 )begin
        always @ (posedge clk or posedge rst) begin
                if( rst==1'b1 )begin
                        in_cpkt_rd[j]   <= 0;
                end
                else begin
                        if( in_msg_rd==1'b1 && cpkt_vld_reg[j]==1'b1 )begin
                                in_cpkt_rd[j] <= 1'b1;
                        end
                        else if( cnt_cpkt_vld==(CELLSZ[16*j+:16]-1) )begin
                                in_cpkt_rd[j] <= 1'b0;
                        end
                end
        end
end
endgenerate
endmodule
