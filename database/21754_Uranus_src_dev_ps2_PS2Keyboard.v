// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0


`timescale 1ns / 1ps
module PS2Keyboard(
        //keyboard control
        input clk                  , // 50Mhz clock
        input rst                  , // reset
        input ps2k_clk             , // PS/2 clock
        input ps2k_data            , // PS/2 data
        output interrupt           ,// 中断信号
        output ps2_state           , // keybord status, =1 when key is pressed
       //ar 
       input   wire[3 :0]  arid    ,
       input   wire[31:0]  araddr  ,
       input   wire[7 :0]  arlen   ,
       input   wire[2 :0]  arsize  ,
       input   wire[1 :0]  arburst ,
       input   wire[1 :0]  arlock  ,
       input   wire[3 :0]  arcache ,
       input   wire[2 :0]  arprot  ,
       input   wire        arvalid ,
       output  wire        arready ,
       //r
       output  wire[3 :0]  rid     ,
       output  wire[31:0]  rdata   ,
       output  wire[1 :0]  rresp   ,
       output  wire        rlast   ,
       output  wire        rvalid  ,
       input   wire        rready  ,
       //aw
       input   wire[3 :0]  awid    ,
       input   wire[31:0]  awaddr  ,
       input   wire[7 :0]  awlen   ,
       input   wire[2 :0]  awsize  ,
       input   wire[1 :0]  awburst ,
       input   wire[1 :0]  awlock  ,
       input   wire[3 :0]  awcache ,
       input   wire[2 :0]  awprot  ,
       input   wire        awvalid ,
       output  wire        awready ,
       //w
       input   wire[3 :0]  wid     ,
       input   wire[31:0]  wdata   ,
       input   wire[3 :0]  wstrb   ,
       input   wire        wlast   ,
       input   wire        wvalid  ,
       output  wire        wready  ,
       output  wire[3 :0]  bid     ,
       output  wire[1 :0]  bresp   ,
       output  wire        bvalid  ,
       input   wire        bready 
       );
//-----------------------{axi_interface}begin------------------//
//axi 接口的读控制相关信号因为有改动故 移动到了 253行到269行
       reg     busy,write,R_or_W;
       wire    ar_enter    = arvalid & arready;              //进入读状态，读数据开始
       wire    r_retire    = rvalid  & rready & rlast;
       wire    aw_enter    = awvalid & awready;
       wire    w_enter     = wvalid  & wready & wlast;
       wire    b_retire    = bvalid  & bready;
   //Mode
       assign  arready     = ~busy & (!R_or_W | !awvalid);   //读地址接收准备好，前提：总线不忙，且写地址无效  （或没进入读状态？）
       assign  awready     = ~busy & ( R_or_W | !arvalid);   
   
       reg [3 :0]  buf_id;
       reg [31:0]  buf_addr;
       reg [7 :0]  buf_len;
       reg [2 :0]  buf_size;
   //busy 
       always @ (posedge clk)  begin
           if (!rst)   busy  <= 1'b0;
           else if (ar_enter | aw_enter)   busy    <= 1'b1;
           else if (r_retire | b_retire)   busy    <= 1'b0;
       end
   //contronl_id
       always @ (posedge clk)  begin
           if (!rst)   begin
               R_or_W      <= 1'b0;
               buf_id      <= 4'b0;
               buf_addr    <= 31'h0;
               buf_len     <= 8'b0;
               buf_size    <= 3'b0;
           end 
           else if (ar_enter | aw_enter)   begin
               R_or_W      <= ar_enter;
               buf_id      <= ar_enter ? arid   : awid   ;
               buf_addr    <= ar_enter ? araddr : awaddr ;
               buf_len     <= ar_enter ? arlen  : awlen  ;
               buf_size    <= ar_enter ? arsize : awsize ;
           end
       end
   //write
       reg wready_reg;
       assign  wready  = wready_reg;
       always @ (posedge clk)  begin
           if      (!rst           )   wready_reg  <= 1'b0;
           else if (aw_enter       )   wready_reg  <= 1'b1;
           else if (w_enter & wlast)   wready_reg  <= 1'b0;
       end     
 //b
       reg bvalid_reg;
       assign  bvalid = bvalid_reg;
       always @ (posedge clk)  begin
           if      (!rst    )  bvalid_reg  <= 1'b0;
           else if (w_enter )  bvalid_reg  <= 1'b1;
           else if (b_retire)  bvalid_reg  <= 1'b0;
       end
   
       assign  rid     = buf_id;
       assign  bid     = buf_id;
       assign  bresp   = 2'b0;
       assign  rresp   = 2'b0;
//-----------------{axi_interface}end----------------//
    
    reg ps2k_clk_r0, ps2k_clk_r1, ps2k_clk_r2;      //ps2k_clk status register
    wire neg_ps2k_clk;                             // ps2k_clk neg-edge flag
    always @(posedge clk or negedge rst) begin 
        if (!rst) begin
            ps2k_clk_r0 <= 1'b0;
            ps2k_clk_r1 <= 1'b0;
            ps2k_clk_r2 <= 1'b0;
        end
        else begin   // storage current status
            ps2k_clk_r0 <= ps2k_clk;
            ps2k_clk_r1 <= ps2k_clk_r0;
            ps2k_clk_r2 <= ps2k_clk_r1;
        end
    end
    assign neg_ps2k_clk = ~ps2k_clk_r1 & ps2k_clk_r2;   // falling edge

    reg[7:0] ps2_byte_r;   // receive a byte from PS/2
    reg[7:0] temp_data;    // current data
    reg[3:0] counter;
   
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            counter <= 4'd0;
            temp_data <= 8'd0;
        end
        else if (neg_ps2k_clk&!isDone) begin   // at falling edge of ps2k_clk //当接收完后便不再接收
            case (counter)
                4'd0: counter <= counter + 1'b1;
                4'd1: begin
                    counter <=counter + 1'b1;
                    temp_data[0] <= ps2k_data;   // bit 0
                end
                4'd2: begin
                    counter <= counter + 1'b1;
                    temp_data[1] <= ps2k_data;   // bit 1
                end
                4'd3: begin
                    counter <= counter + 1'b1;
                    temp_data[2] <= ps2k_data;   // bit 2
                end
                4'd4: begin
                    counter <= counter + 1'b1;
                    temp_data[3] <= ps2k_data;   // bit 3
                end
                4'd5: begin
                    counter <= counter + 1'b1;
                    temp_data[4] <= ps2k_data;   // bit 4
                end
                4'd6: begin
                    counter <= counter + 1'b1;
                    temp_data[5] <= ps2k_data;   // bit 5
                end
                4'd7: begin
                    counter <= counter + 1'b1;
                    temp_data[6] <= ps2k_data;   // bit 6
                end
                4'd8: begin
                    counter <= counter + 1'b1;
                    temp_data[7] <= ps2k_data;   // bit 7
                end
                4'd9: counter <= counter + 1'b1;   // ignore parity bit
                4'd10: counter <= 4'd0;          // clear counter
                default: ;
            endcase
        end
    end

    reg [7:0] keycode_r[15:0]; // 通码寄存器堆
    integer i;
    always@(posedge clk or negedge rst)begin
        if(!rst)
            for(i=0;i<16;i=i+1)begin
                  keycode_r[i] <=1'b0;
            end
    end        //通码寄存器堆初始化
    
    reg key_f0;        // =1 if no key is pressed (PS/2 break)
    reg ps2_state_r;   // keybord status, =1 when key is pressed
      reg isDone;      
    always @(posedge clk or negedge rst) begin
        // process the data received, only consider 1-byte long keycode
        if (!rst) begin
            key_f0 <= 1'b0;
            ps2_state_r <= 1'b0;
            isDone <=1'b0;   
        end
        else if (counter == 4'd10   &&  neg_ps2k_clk) begin
            // just received a byte
            if (temp_data == 8'hf0)begin
                key_f0 <= 1'b1;
                isDone <= 1'b1;
                temp_data <=1'b0;
                end                      
            else begin
                if (!key_f0) begin             // a key is pressed
                    ps2_state_r <= 1'b1;
            //      ps2_byte_r <= temp_data;       //去掉了ps2_byte_r这个变量，通过axi的rdata传输数据
                end
                else begin
                    ps2_state_r <= 1'b0;
                    key_f0 <= 1'b0;
                end
            end 
        end
    end
    
     assign ps2_state = ps2_state_r;
     assign interrupt = ps2_state;
     
    reg [3:0] tail_ptr;//尾指针，指向有效信息的后一个寄存器的后一个寄存器
    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            tail_ptr <= 4'b0000;
        end
        else if(counter == 4'd10 && neg_ps2k_clk&&!key_f0) begin
             if(((tail_ptr!=1'b0&(keycode_r[tail_ptr-1] !=temp_data))|!tail_ptr))begin //当tail指向0号时写入，tail不是指向0号时，比较队尾的通码和temp里临时通码不同才可写入
                keycode_r[tail_ptr] <=temp_data;                             
                tail_ptr <= tail_ptr+1;
            end
        end 
     end
 
    // read   axi总线接口部分
           reg rvalid_reg;
           reg rlast_reg;
           assign  rvalid  = rvalid_reg;
           assign  rlast   = rlast_reg;
           always @ (posedge clk)  begin
               if (!rst) begin
                  rvalid_reg   <= 1'b0;
                  rlast_reg    <= 1'b0;
               end else if (busy & R_or_W & !r_retire&isDone) begin //进入读，且写指针不是指向0号寄存器的，读数据才有效
                  rvalid_reg  <= 1'b1;
                 // rlast_reg   <= 1'b1;
                  end
               else if (r_retire)  begin
                  rvalid_reg  <= 1'b0;
               end
           end
    reg [31:0]  data_out;
   assign  rdata   = data_out;  

    reg [3:0] head_ptr;//头指针 
    integer k;
    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            data_out <= 32'b0;
            head_ptr <= 4'b0;
        end
        else if(!r_retire&isDone)begin
                data_out[31:24] = keycode_r[head_ptr+2'b11];
                data_out[23:16] = keycode_r[head_ptr+2'b10];
                data_out[15:8]  = keycode_r[head_ptr+1]; 
                data_out[7:0]   = keycode_r[head_ptr];
                 if(tail_ptr<= 4+head_ptr) begin
                  rlast_reg =1'b1; //如果尾指针与头指针距离足够近，说明这是最后一组数据
                  head_ptr =4'b0 ;  //头指针归
                  tail_ptr =4'b0 ; //尾指针归零
                  isDone   =1'b0;
                  for(k=0;k<16;k=k+1)
                    keycode_r[k] =0;
                 end          
                else head_ptr <= head_ptr+4;//否则，传输完一组数据后，移动头指针，传送下一组
       end
   end
   reg ps2k_state_r0,ps2k_state_r1,ps2k_state_r2;
   wire neg_ps2k_state;                          // ps2k_state neg-edge flag
   always @(posedge clk or negedge rst) begin
       if (!rst) begin
           ps2k_state_r0 <= 1'b0;
           ps2k_state_r1 <= 1'b0;
           ps2k_state_r2 <= 1'b0;
       end
       else begin   // storage current status
           ps2k_state_r0 <= ps2_state_r;
           ps2k_state_r1 <= ps2k_state_r0;
           ps2k_state_r2 <= ps2k_state_r1;
       end
   end
   assign neg_ps2k_state = ~ps2k_state_r1 & ps2k_clk_r2; //检测ps2下降沿，即按键松开     
endmodule // PS2Keyboard
