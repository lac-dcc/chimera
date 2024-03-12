`timescale 1ns / 1ps
module cpkt_mix  #(
        parameter RAM_STYLE   = "block" ,
        parameter DWID        = 256     ,   
        parameter CELL_LEN    = 4       ,   
        parameter AWID        = 6       ,   
        parameter AFULL_TH    = 8       ,
        parameter KEY_WID     = 16      ,
        parameter QUE_NUM     = 8       ,
        parameter CELL_GAP    = 12      ,
        parameter LIMIT_RATE_EN = 0     ,
        parameter DBG_WID     = 32
) (
    input    wire                       clk      ,     
    input    wire                       rst      ,     
    input    wire                       cfg_limit_rate_en ,
    input    wire                       in_vld   ,
    input    wire   [DWID-1:0]          in_data  ,
    input    wire                       in_soc   ,
    input    wire   [KEY_WID-1:0]       in_key   ,
    output   wire                       in_rdy   ,
    output   wire   [DWID-1:0]          out_data ,
    output   reg                        out_vld  ,
    input    wire                       out_rdy  ,
    output   wire   [DBG_WID-1:0]       dbg_sig
);
localparam SEL_WID  = clogb2(QUE_NUM)  ;
localparam CELL_WID = clogb2(CELL_LEN) ;
localparam GAP_WID  = clogb2(CELL_GAP+CELL_LEN)  ;
integer i ;
reg   [KEY_WID*QUE_NUM-1:0]  que_key_reg          ;
reg   [      1*QUE_NUM-1:0]  flag_key_equ         ;
reg   [QUE_NUM-1:0]          flag_que_fifo_wen    ;
reg   [QUE_NUM-1:0]          que_fifo_wen    ;
reg   [DWID-1:0]             que_fifo_wdata  ;
wire  [QUE_NUM-1:0]          que_fifo_nafull ;
reg   [QUE_NUM-1:0]          que_fifo_rd    ;
wire  [DWID-1:0]             que_fifo_rdata  ;
wire  [QUE_NUM-1:0]          que_fifo_nempty ;
reg   [GAP_WID-1:0]          rd_cpkt_cnt     ;
reg   [SEL_WID-1:0]          polling_cnt     ;
reg   [QUE_NUM-1:0]          que_fifo_nempty_d1 ;
reg   [QUE_NUM-1:0]          que_fifo_nempty_d2 ;
reg   [QUE_NUM-1:0]          que_fifo_nempty_reg;
reg                          in_vld_d1   ;
reg   [DWID-1:0]             in_data_d1  ;
reg                          in_soc_d1   ;
reg   [KEY_WID-1:0]          in_key_d1   ;
reg                          out_rdy_reg ;  
assign  in_rdy = &que_fifo_nafull ;
always @(posedge clk)
begin
  in_vld_d1   <= in_vld   ;
  in_data_d1  <= in_data  ;
  in_soc_d1   <= in_soc   ;
  in_key_d1   <= in_key   ;
  que_fifo_wdata <= in_data ;
end
reg [QUE_NUM-1:0] key_bitmap;
always @(posedge clk or posedge rst)
begin
    if(rst==1'b1)
    begin
        key_bitmap <= {QUE_NUM{1'b0}};
    end
    else if( in_soc==1'b1 && in_vld==1'b1 )
    begin
        for( i=0; i<QUE_NUM; i=i+1 ) begin
                if(in_key[SEL_WID-1:0]==i)begin
                        key_bitmap[i] <= 1'b1;
                end
                else begin
                        key_bitmap[i] <= 1'b0;
                end
        end
    end
end
always @( * )
begin
   que_fifo_wen = key_bitmap & {QUE_NUM{in_vld_d1}};
end
always @(posedge clk or posedge rst)
begin
  if(rst == 1'b1)
  begin
      que_fifo_nempty_d1 <= 1'b0; 
      que_fifo_nempty_d2 <= 1'b0; 
  end
  else 
  begin
      que_fifo_nempty_d1 <= que_fifo_nempty ;
      que_fifo_nempty_d2 <= que_fifo_nempty_d1 ;
  end
end
always @(posedge clk or posedge rst)
begin
        if(rst == 1'b1)
        begin
                polling_cnt <= {SEL_WID{1'b0}};
        end
        else
        begin
                if(rd_cpkt_cnt == (CELL_LEN+CELL_GAP-1) && out_rdy_reg==1'b1 )
                begin
                        if(polling_cnt == QUE_NUM-1)
                        begin
                                polling_cnt <= {SEL_WID{1'b0}};
                        end
                        else
                        begin
                                polling_cnt <= polling_cnt + 1'b1 ;
                        end
                end
        end
end
always @(posedge clk or posedge rst)
begin
        if(rst == 1'b1)
        begin
                rd_cpkt_cnt <= {GAP_WID{1'b0}} ;
        end  
        else
        begin
                if(rd_cpkt_cnt == (CELL_LEN+CELL_GAP-1))
                begin
                        rd_cpkt_cnt <= {GAP_WID{1'b0}} ;
                end
                else if( rd_cpkt_cnt == 0 && que_fifo_nempty_reg[polling_cnt]==1'b0 && LIMIT_RATE_EN==0 )
                begin
                        rd_cpkt_cnt <= (CELL_LEN+CELL_GAP-1) ;
                end
                else if( rd_cpkt_cnt == 0 && que_fifo_nempty_reg[polling_cnt]==1'b0 && LIMIT_RATE_EN==1 && cfg_limit_rate_en==1'b0 )
                begin
                        rd_cpkt_cnt <= (CELL_LEN+CELL_GAP-1) ;
                end
                else  
                begin
                        rd_cpkt_cnt <= rd_cpkt_cnt + 1'b1 ;
                end
        end  
end
always @(posedge clk or posedge rst)
begin
  if(rst == 1'b1)
  begin
    que_fifo_rd <= 0 ;
  end
  else
  begin
      for( i=0;i<QUE_NUM;i=i+1 )
      begin
          if( polling_cnt==i                                     
              && que_fifo_nempty_reg[polling_cnt]==1'b1          
              && out_rdy_reg==1'b1                               
              && rd_cpkt_cnt==0                                  
              )
          begin
              que_fifo_rd[i] <= 1'b1 ;
          end
          else if(rd_cpkt_cnt==CELL_LEN)
          begin
              que_fifo_rd[i] <= 1'b0 ;
          end
      end
  end
end
always @(posedge clk or posedge rst)
begin
  if(rst == 1'b1)
  begin
    out_vld <= 1'b0 ;
  end
  else
  begin
    out_vld <= |que_fifo_rd ;
  end
end
assign out_data = que_fifo_rdata ;
always @(posedge clk or posedge rst)
begin
  if(rst == 1'b1)
  begin
     out_rdy_reg <= 0;
  end  
  else
  begin
    if( rd_cpkt_cnt == (CELL_LEN+CELL_GAP-1) && out_rdy==1'b1 )
    begin
      out_rdy_reg <= 1'b1;
    end
    else if( rd_cpkt_cnt == (CELL_LEN+CELL_GAP-1) && out_rdy==1'b0 )
    begin
      out_rdy_reg <= 1'b0;
    end
  end  
end
always @(posedge clk or posedge rst)
begin
  if(rst == 1'b1)
  begin
     que_fifo_nempty_reg <= 0;
  end  
  else
  begin
      que_fifo_nempty_reg <= que_fifo_nempty;
  end  
end
bfifo_mq_reg #(
  .RAM_STYLE ( RAM_STYLE ) ,
  .MQNUM     ( QUE_NUM   ) ,
  .DWID      ( DWID      ) ,
  .AWID      ( AWID      ) ,
  .AFULL_TH  ( AFULL_TH  ) ,
  .AEMPTY_TH (           ) ,
  .DBG_WID   ( DBG_WID   )
) u_bfifo_mq_reg(
  .clk       ( clk             ),
  .rst       ( rst             ),
  .wen       ( que_fifo_wen    ),
  .wdata     ( que_fifo_wdata  ),
  .nfull     (                 ),
  .nafull    ( que_fifo_nafull ),
  .woverflow (                 ),
  .cnt_free  (                 ),
  .ren       ( que_fifo_rd    ),
  .rdata     ( que_fifo_rdata  ),
  .nempty    ( que_fifo_nempty ),
  .naempty   (                 ),
  .roverflow (                 ),
  .cnt_used  (                 ),
  .dbg       (                 )
);
assign dbg_sig = {32'b0};
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
