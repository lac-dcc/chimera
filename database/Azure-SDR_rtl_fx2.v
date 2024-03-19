/************************************************************************************************
*  Name         :fx2.v
*  Description  :fx2 usb for ADC
*  Origin       :200321
*  Author       :helrori2011@gmail.com
************************************************************************************************/
`define EP2_NOTHING  (cy_flaga==1'd0)//flaga fixed mode,PC->FPGA st_out
`define EP6_FULL     (cy_flagb==1'd0)//flagb fixed mode,FPGA->PC st_in
`define EP2_ADDRESS  (2'b00)
`define EP6_ADDRESS  (2'b10)
`define CYUSB_DELAY  (32'd20000000)//上电延迟,实际测试使用32'd20000000
module fx2
(
   input    wire            clk         ,        
   input    wire            clk_180     ,    //from pll,for FX2 slave fifo write clk
   input    wire            rst_n       ,
   //fifo   
   input    wire            up_req      ,
   output   wire            up_grant    ,
   input    wire    [15:0]  up_dat      ,    //prefetch
   output   reg             up_fin      ,

   output   reg             dn_val      ,
   output   reg     [15:0]  dn_dat      ,
   //cyusb outside
   inout    wire    [15:0]  cy_data     ,
   output   reg     [1 :0]  cy_addr     ,
   output   reg             cy_slrd_n   ,
   output   reg             cy_slwr_n   ,
   output   reg             cy_pkend_n  ,
   output   reg             cy_sloe_n   ,
   input    wire            cy_flaga    ,
   input    wire            cy_flagb    ,
   output   wire            cy_ifclk    ,
   output   reg             cy_ifclk_ok

);
//----------------------------------------------------------------------------------------------
reg             up_req_b;
reg     [31:0]  dly;
reg     [8 :0]  send_cnt;
reg     [3 :0]  cst,nst;
reg             read_en;
wire    [15:0]  cy_data_o;

localparam  DLY         = 0 ,
            REC_CHK     = 1 ,

            RD_BEG      = 2 ,
            RD_SLO      = 3 ,
            RD_NOW      = 4 ,
            RD_END      = 5 ,

            WR_BEG      = 6 ,
            WR_NOW      = 7 ,
            WR_PKE      = 8 ,
            WR_END      = 9 ,

            UP_FIN      = 10 ;


//----------------------------------------------------------------------------------------------
assign   cy_ifclk  = clk_180;
assign   cy_data   = (cy_slwr_n)?16'bz:cy_data_o;//cy_data默认高阻，仅当上载时接上cy_data_o
assign   up_grant  = ~cy_slwr_n;
assign   cy_data_o = up_dat;
always@(posedge clk_180 or negedge rst_n)begin if(!rst_n) cy_ifclk_ok <= 1'd0; else cy_ifclk_ok <= 1'd1;end

always@(posedge clk or negedge rst_n)begin if(!rst_n) cst  <= DLY; else cst  <= nst;end

always@(*)begin
    nst = cst;
    case(cst)
        DLY:begin       // 上电延迟
            nst = (dly >= `CYUSB_DELAY)?REC_CHK:DLY;
        end
        REC_CHK:begin   // 检查进入该模块的数据
            if ( !`EP2_NOTHING ) begin
                nst = RD_BEG;
            end else if( up_req_b && (!`EP6_FULL) )begin
                nst = WR_BEG;
            end
        end
        //--------------------------------------------------------------------------------------
        RD_BEG:begin     // 提早输出地址
            nst = RD_SLO;
        end
        RD_SLO:begin     // 提早将sloe_n置低
            nst = RD_NOW;
        end
        RD_NOW:begin     // 读512bytes
            nst = (send_cnt >= 9'd256)?RD_END:RD_NOW;
        end
        RD_END:begin   
            nst =  REC_CHK;
        end
        //--------------------------------------------------------------------------------------
        WR_BEG:begin
            nst = WR_NOW;
        end
        WR_NOW:begin    // 写512bytes
            nst = (send_cnt >= 9'd256)?WR_PKE:WR_NOW;
        end
        WR_PKE:begin       
            nst = WR_END;
        end
        WR_END:begin
            nst = UP_FIN;
        end
        UP_FIN:begin
            nst = REC_CHK;
        end
        //--------------------------------------------------------------------------------------        
        default:nst = DLY;
    endcase
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        dly            <= 32'd0;
        send_cnt       <= 9'd0;
        cy_addr        <= `EP2_ADDRESS;
        cy_slrd_n      <= 1;
        cy_sloe_n      <= 1;
        cy_slwr_n      <= 1;
        cy_pkend_n     <= 1;
        up_fin         <= 0;
    end else case(nst)
        DLY:begin
            dly     <= dly + 1'd1;
        end
        REC_CHK:begin
            dly     <= 32'd0;
        end
        //--------------------------------------------------------------------------------------
        RD_BEG:begin             
            cy_addr <= `EP2_ADDRESS;
        end
        RD_SLO:begin
            cy_sloe_n   <= 0;
        end        
        RD_NOW:begin//读512bytes
            cy_slrd_n   <= 0;
            send_cnt    <= send_cnt + 1'd1;
        end
        RD_END:begin               
            send_cnt    <= 9'd0;
            cy_slrd_n   <= 1;
            cy_sloe_n   <= 1;
        end
        //--------------------------------------------------------------------------------------
        WR_BEG:begin               
            cy_addr     <= `EP6_ADDRESS;
        end
        WR_NOW:begin//写512bytes
            cy_slwr_n   <= 0;
            send_cnt    <= send_cnt + 1'd1;
        end
        WR_PKE:begin  
            send_cnt    <= 9'd0;        
            cy_slwr_n   <= 1;
            cy_pkend_n  <= 1;//not use
        end
        WR_END:begin                
            cy_pkend_n  <= 1;
            up_fin      <= 1;
        end
        UP_FIN:begin
            up_fin      <= 0;
        end
        //--------------------------------------------------------------------------------------
        default:;
    endcase
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        up_req_b   <= 'd0;
    end else begin
        if(up_fin)
            up_req_b<=  1'd0;       //任务完成，撤回请求
        else if(up_req)begin
            up_req_b<=  1'd1;       //保存请求
        end else
            up_req_b<=  up_req_b;
    end
end

always@(posedge clk_180 or negedge rst_n)begin
    if(!rst_n)begin
        read_en <= 1'd0;
    end else if(cst == RD_SLO && nst == RD_NOW)begin
        read_en <= 1'd1;
    end else if(cst == RD_NOW && nst == RD_END)begin
        read_en <= 1'd0;
    end else read_en <= read_en ;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        dn_dat <= 16'd0;
        dn_val <=  1'd0;
    end else if(read_en)begin
        dn_dat <= cy_data;
        dn_val <= 1'd1;
    end else begin
        dn_dat <= dn_dat;
        dn_val <= 1'd0;
    end 
    
end



endmodule
