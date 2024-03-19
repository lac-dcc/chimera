//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          i2c_dri
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        i2c驱动模块，供其他需使用i2c协议的模块例化
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//


module i2c_dri
    #(// slave address（器件地址），放此处方便参数传递
      parameter   SLAVE_ADDR =  7'b1010000   ,
      parameter   CLK_FREQ   = 26'd50_000_000,   // i2c_dri模块的驱动时钟频率(CLK_FREQ)
      parameter   I2C_FREQ   = 18'd250_000       // I2C的SCL时钟频率
     )(
          //global clock
          input                clk        ,      // i2c_dri模块的驱动时钟(CLK_FREQ)
          input                rst_n      ,      // 复位信号

          //i2c interface
          input                i2c_exec   ,      // I2C触发执行信号
          input                bit_ctrl   ,      // 字地址位控制(16b/8b)
          input                i2c_rh_wl  ,      // I2C读写控制信号
          input        [15:0]  i2c_addr   ,      // I2C器件内地址
          input        [ 7:0]  i2c_data_w ,      // I2C要写的数据
          output  reg  [ 7:0]  i2c_data_r ,      // I2C读出的数据
          output  reg          i2c_done   ,      // I2C一次操作完成
          output  reg          scl        ,      // I2C的SCL时钟信号
          inout                sda        ,      // I2C的SDA信号

          //user interface
          output  reg          dri_clk           // 驱动I2C操作的驱动时钟
     );

//localparam define
localparam  st_idle     = 8'b0000_0001;          // 空闲状态
localparam  st_sladdr   = 8'b0000_0010;          // 发送器件地址(slave address)
localparam  st_addr16   = 8'b0000_0100;          // 发送16位字地址
localparam  st_addr8    = 8'b0000_1000;          // 发送8位字地址
localparam  st_data_wr  = 8'b0001_0000;          // 写数据(8 bit)
localparam  st_addr_rd  = 8'b0010_0000;          // 发送器件地址读
localparam  st_data_rd  = 8'b0100_0000;          // 读数据(8 bit)
localparam  st_stop     = 8'b1000_0000;          // 结束I2C操作

//reg define
reg            sda_dir     ;                     // I2C数据(SDA)方向控制
reg            sda_out     ;                     // SDA输出信号
reg            st_done     ;                     // 状态结束
reg            wr_flag     ;                     // 写标志
reg    [ 6:0]  cnt         ;                     // 计数
reg    [ 7:0]  cur_state   ;                     // 状态机当前状态
reg    [ 7:0]  next_state  ;                     // 状态机下一状态
reg    [15:0]  addr_t      ;                     // 地址
reg    [ 7:0]  data_r      ;                     // 读取的数据
reg    [ 7:0]  data_wr_t   ;                     // I2C需写的数据的临时寄存
reg    [ 9:0]  clk_cnt     ;                     // 分频时钟计数

//wire define
wire          sda_in      ;                      // SDA输入信号
wire   [8:0]  clk_divide  ;                      // 模块驱动时钟的分频系数

//*****************************************************
//**                    main code
//*****************************************************

//SDA控制
assign  sda     = sda_dir ?  sda_out : 1'bz;     // SDA数据输出或高阻
assign  sda_in  = sda ;                          // SDA数据输入
assign  clk_divide = (CLK_FREQ/I2C_FREQ) >> 3;   // 模块驱动时钟的分频系数

//生成I2C的SCL的四倍频率的驱动时钟用于驱动i2c的操作
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        dri_clk <=  1'b1;
        clk_cnt <= 10'd0;
    end
    else if(clk_cnt == clk_divide - 1'd1) begin
        clk_cnt <= 10'd0;
        dri_clk <= ~dri_clk;
    end
    else
        clk_cnt <= clk_cnt + 1'b1;
end

//(三段式状态机)同步时序描述状态转移
always @(posedge dri_clk or negedge rst_n) begin
    if(!rst_n)
        cur_state <= st_idle;
    else
        cur_state <= next_state;
end

//组合逻辑判断状态转移条件
always @( * ) begin
//    next_state = st_idle;
    case(cur_state)
        st_idle: begin                           // 空闲状态
           if(i2c_exec) begin
               next_state = st_sladdr;
           end
           else
               next_state = st_idle;
        end
        st_sladdr: begin
            if(st_done) begin
                if(bit_ctrl)                     // 判断是16位还是8位字地址
                   next_state = st_addr16;
                else
                   next_state = st_addr8 ;
            end
            else
                next_state = st_sladdr;
        end
        st_addr16: begin                         // 写16位字地址
            if(st_done) begin
                next_state = st_addr8;
            end
            else begin
                next_state = st_addr16;
            end
        end
        st_addr8: begin                          // 8位字地址
            if(st_done) begin
                if(wr_flag==1'b0)                // 读写判断
                    next_state = st_data_wr;
                else
                    next_state = st_addr_rd;
            end
            else begin
                next_state = st_addr8;
            end
        end
        st_data_wr: begin                        // 写数据(8 bit)
            if(st_done)
                next_state = st_stop;
            else
                next_state = st_data_wr;
        end
        st_addr_rd: begin                        // 写地址以进行读数据
            if(st_done) begin
                next_state = st_data_rd;
            end
            else begin
                next_state = st_addr_rd;
            end
        end
        st_data_rd: begin                        // 读取数据(8 bit)
            if(st_done)
                next_state = st_stop;
            else
                next_state = st_data_rd;
        end
        st_stop: begin                           // 结束I2C操作
            if(st_done)
                next_state = st_idle;
            else
                next_state = st_stop ;
        end
        default: next_state= st_idle;
    endcase
end

//时序电路描述状态输出
always @(posedge dri_clk or negedge rst_n) begin
    //复位初始化
    if(!rst_n) begin
        scl        <= 1'b1;
        sda_out    <= 1'b1;
        sda_dir    <= 1'b1;
        i2c_done   <= 1'b0;
        cnt        <= 1'b0;
        st_done    <= 1'b0;
        data_r     <= 1'b0;
        i2c_data_r <= 1'b0;
        wr_flag    <= 1'b0;
        addr_t     <= 1'b0;
        data_wr_t  <= 1'b0;
    end
    else begin
        st_done <= 1'b0 ;
        cnt     <= cnt +1'b1 ;
        case(cur_state)
             st_idle: begin                            // 空闲状态
                scl     <= 1'b1;
                sda_out <= 1'b1;
                sda_dir <= 1'b1;
                i2c_done<= 1'b0;
                cnt     <= 7'b0;
                if(i2c_exec) begin
                    wr_flag   <= i2c_rh_wl ;
                    addr_t    <= i2c_addr  ;
                    data_wr_t <= i2c_data_w;
                end
            end
            st_sladdr: begin                           // 写地址(器件地址和字地址)
                case(cnt)
                    7'd1 : sda_out <= 1'b0;            // 开始I2C
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= SLAVE_ADDR[6];   // 传送器件地址
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= SLAVE_ADDR[5];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= SLAVE_ADDR[4];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= SLAVE_ADDR[3];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= SLAVE_ADDR[2];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= SLAVE_ADDR[1];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= SLAVE_ADDR[0];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: sda_out <= 1'b0;            // 0:写
                    7'd33: scl <= 1'b1;
                    7'd35: scl <= 1'b0;
                    7'd36: begin
                        sda_dir <= 1'b0;               // 从机应答
                        sda_out <= 1'b1;
                    end
                    7'd37: scl     <= 1'b1;
                    7'd38: st_done <= 1'b1;
                    7'd39: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                    end
                    default :  ;
                endcase
            end
            st_addr16: begin
                case(cnt)
                    7'd0 : begin
                        sda_dir <= 1'b1 ;
                        sda_out <= addr_t[15];         // 传送字地址
                    end
                    7'd1 : scl <= 1'b1;
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= addr_t[14];
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= addr_t[13];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= addr_t[12];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= addr_t[11];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= addr_t[10];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= addr_t[9];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= addr_t[8];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: begin
                        sda_dir <= 1'b0;               // 从机应答
                        sda_out <= 1'b1;
                    end
                    7'd33: scl     <= 1'b1;
                    7'd34: st_done <= 1'b1;
                    7'd35: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                    end
                    default :  ;
                endcase
            end
            st_addr8: begin
                case(cnt)
                    7'd0: begin
                       sda_dir <= 1'b1 ;
                       sda_out <= addr_t[7];           // 字地址
                    end
                    7'd1 : scl <= 1'b1;
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= addr_t[6];
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= addr_t[5];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= addr_t[4];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= addr_t[3];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= addr_t[2];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= addr_t[1];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= addr_t[0];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: begin
                        sda_dir <= 1'b0;               // 从机应答
                        sda_out <= 1'b1;
                    end
                    7'd33: scl     <= 1'b1;
                    7'd34: st_done <= 1'b1;
                    7'd35: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                    end
                    default :  ;
                endcase
            end
            st_data_wr: begin                          // 写数据(8 bit)
                case(cnt)
                    7'd0: begin
                        sda_out <= data_wr_t[7];       // I2C写8位数据
                        sda_dir <= 1'b1;
                    end
                    7'd1 : scl <= 1'b1;
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= data_wr_t[6];
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= data_wr_t[5];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= data_wr_t[4];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= data_wr_t[3];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= data_wr_t[2];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= data_wr_t[1];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= data_wr_t[0];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: begin
                        sda_dir <= 1'b0;               // 从机应答
                        sda_out <= 1'b1;
                    end
                    7'd33: scl <= 1'b1;
                    7'd34: st_done <= 1'b1;
                    7'd35: begin
                        scl  <= 1'b0;
                        cnt  <= 1'b0;
                    end
                    default  :  ;
                endcase
            end
            st_addr_rd: begin                          // 写地址以进行读数据
                case(cnt)
                    7'd0 : begin
                        sda_dir <= 1'b1;
                        sda_out <= 1'b1;
                    end
                    7'd1 : scl <= 1'b1;
                    7'd2 : sda_out <= 1'b0;            // 重新开始
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= SLAVE_ADDR[6];   // 传送器件地址
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= SLAVE_ADDR[5];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= SLAVE_ADDR[4];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= SLAVE_ADDR[3];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= SLAVE_ADDR[2];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= SLAVE_ADDR[1];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= SLAVE_ADDR[0];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: sda_out <= 1'b1;            // 1:读
                    7'd33: scl <= 1'b1;
                    7'd35: scl <= 1'b0;
                    7'd36: begin
                        sda_dir <= 1'b0;               // 从机应答
                        sda_out <= 1'b1;
                    end
                    7'd37: scl     <= 1'b1;
                    7'd38: st_done <= 1'b1;
                    7'd39: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                    end
                    default : ;
                endcase
            end
            st_data_rd: begin                          // 读取数据(8 bit)
                case(cnt)
                    7'd0: sda_dir <= 1'b0;
                    7'd1: begin
                        data_r[7] <= sda_in;
                        scl       <= 1'b1;
                    end
                    7'd3: scl  <= 1'b0;
                    7'd5: begin
                        data_r[6] <= sda_in ;
                        scl       <= 1'b1   ;
                    end
                    7'd7: scl  <= 1'b0;
                    7'd9: begin
                        data_r[5] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd11: scl  <= 1'b0;
                    7'd13: begin
                        data_r[4] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd15: scl  <= 1'b0;
                    7'd17: begin
                        data_r[3] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd19: scl  <= 1'b0;
                    7'd21: begin
                        data_r[2] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd23: scl  <= 1'b0;
                    7'd25: begin
                        data_r[1] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd27: scl  <= 1'b0;
                    7'd29: begin
                        data_r[0] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd31: scl  <= 1'b0;
                    7'd32: begin
                        sda_dir <= 1'b1;              // 非应答
                        sda_out <= 1'b1;
                    end
                    7'd33: scl     <= 1'b1;
                    7'd34: st_done <= 1'b1;
                    7'd35: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                        i2c_data_r <= data_r;
                    end
                    default  :  ;
                endcase
            end
            st_stop: begin                            // 结束I2C操作
                case(cnt)
                    7'd0: begin
                        sda_dir <= 1'b1;              // 结束I2C
                        sda_out <= 1'b0;
                    end
                    7'd1 : scl     <= 1'b1;
                    7'd3 : sda_out <= 1'b1;
                    7'd15: st_done <= 1'b1;
                    7'd16: begin
                        cnt      <= 1'b0;
                        i2c_done <= 1'b1;             // 向上层模块传递I2C结束信号
                    end
                    default  : ;
                endcase
            end
        endcase
    end
end

endmodule