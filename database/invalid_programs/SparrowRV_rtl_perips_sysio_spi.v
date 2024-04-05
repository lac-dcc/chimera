`include "defines.v"
module spi(

    input wire clk,
    input wire rst_n,

    input wire[7:0] waddr_i,
    input wire[`MemBus] data_i,
    input wire[3:0] sel_i,
    input wire we_i,
    input wire[7:0] raddr_i,
    input wire rd_i,
    output reg[`MemBus] data_o,


    output reg spi_mosi,             // spi控制器输出、spi设备输入信号
    input wire spi_miso,             // spi控制器输入、spi设备输出信号
    output wire spi_cs,              // spi设备片选
    output reg spi_clk               // spi设备时钟，最大频率为输入clk的一半

);

localparam SPI_CTRL   = 4'h0;    // spi_ctrl寄存器地址偏移
localparam SPI_DATA   = 4'h4;    // spi_data寄存器地址偏移
localparam SPI_STATUS = 4'h8;    // spi_status寄存器地址偏移

// spi控制寄存器
// addr: 0x00
// [0]: 1: enable, 0: disable
// [1]: CPOL
// [2]: CPHA
// [3]: select slave, 1: select, 0: deselect
// [15:8]: clk div
reg[15:0] spi_ctrl;
// spi数据寄存器
// addr: 0x04
// [7:0] cmd or inout data
reg[15:0] spi_data;
// spi状态寄存器
// addr: 0x08
// [0]: 1: busy, 0: idle
reg spi_status;

reg[8:0] clk_cnt;               // 分频计数
reg en;                         // 使能，开始传输信号，传输期间一直有效
reg[4:0] spi_clk_edge_cnt;      // spi clk时钟沿的个数
reg spi_clk_edge_level;         // spi clk沿电平
reg[7:0] rdata;                 // 从spi设备读回来的数据
reg done;                       // 传输完成信号
reg[3:0] bit_index;             // 数据bit索引
wire[8:0] div_cnt;


assign spi_cs = ~spi_ctrl[3];   // SPI设备片选信号

assign div_cnt = spi_ctrl[15:8];// 0: 2分频，1：4分频，2：8分频，3：16分频，4：32分频，以此类推，分频数=2^(div_cnt+1)

// 总线接口 写
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        spi_ctrl <= 16'h0;
        spi_data <= 16'h0;
        spi_status <= 1'b0;
    end else begin
        spi_status <= en;
        if (we_i == 1'b1) begin
            case (waddr_i[3:0])
                SPI_CTRL: begin
                    if(sel_i[0])
                        spi_ctrl[7:0] <= data_i[7:0];
                    if(sel_i[1])
                        spi_ctrl[15:8] <= data_i[15:8];
                end
                SPI_DATA: begin
                    spi_data <= data_i[15:0];
                end
                default: begin

                end
            endcase
        end else begin
            spi_ctrl[0] <= 1'b0;
            // 发送完成后更新数据寄存器
            if (done == 1'b1) begin
                spi_data <= {8'h0, rdata};
            end
        end
    end
end

// 总线接口 读
always @ (posedge clk) begin
    if (rd_i == 1'b1) begin
        case (raddr_i[3:0])
            SPI_CTRL: begin
                data_o <= {16'h0, spi_ctrl};
            end
            SPI_DATA: begin
                data_o <= {24'h0, spi_data[7:0]};
            end
            SPI_STATUS: begin
                data_o <= {31'h0, spi_status};
            end
            default: begin
                data_o <= 32'h0;
            end
        endcase
    end
    else begin
        data_o <= data_o;
    end
end

// 产生使能信号
// 传输期间一直有效
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        en <= 1'b0;
    end else begin
        if (spi_ctrl[0] == 1'b1) begin
            en <= 1'b1;
        end else if (done == 1'b1) begin
            en <= 1'b0;
        end else begin
            en <= en;
        end
    end
end

// 对输入时钟进行计数
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        clk_cnt <= 9'h0;
    end else if (en == 1'b1) begin
        if (clk_cnt == div_cnt) begin
            clk_cnt <= 9'h0;
        end else begin
            clk_cnt <= clk_cnt + 1'b1;
        end
    end else begin
        clk_cnt <= 9'h0;
    end
end

// 对spi clk沿进行计数
// 每当计数到分频值时产生一个上升沿脉冲
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        spi_clk_edge_cnt <= 5'h0;
        spi_clk_edge_level <= 1'b0;
    end else if (en == 1'b1) begin
        // 计数达到分频值
        if (clk_cnt == div_cnt) begin
            if (spi_clk_edge_cnt == 5'd17) begin
                spi_clk_edge_cnt <= 5'h0;
                spi_clk_edge_level <= 1'b0;
            end else begin
                spi_clk_edge_cnt <= spi_clk_edge_cnt + 1'b1;
                spi_clk_edge_level <= 1'b1;
            end
        end else begin
            spi_clk_edge_level <= 1'b0;
        end
    end else begin
        spi_clk_edge_cnt <= 5'h0;
        spi_clk_edge_level <= 1'b0;
    end
end

// bit序列
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        spi_clk <= 1'b0;
        rdata <= 8'h0;
        spi_mosi <= 1'b0;
        bit_index <= 4'h0;
    end else begin
        if (en) begin
            if (spi_clk_edge_level == 1'b1) begin
                case (spi_clk_edge_cnt)
                    // 第奇数个时钟沿
                    1, 3, 5, 7, 9, 11, 13, 15: begin
                        spi_clk <= ~spi_clk;
                        if (spi_ctrl[2] == 1'b1) begin
                            spi_mosi <= spi_data[bit_index];   // 送出1bit数据
                            bit_index <= bit_index - 1'b1;
                        end else begin
                            rdata <= {rdata[6:0], spi_miso};   // 读1bit数据
                        end
                    end
                    // 第偶数个时钟沿
                    2, 4, 6, 8, 10, 12, 14, 16: begin
                        spi_clk <= ~spi_clk;
                        if (spi_ctrl[2] == 1'b1) begin
                            rdata <= {rdata[6:0], spi_miso};   // 读1bit数据
                        end else begin
                            spi_mosi <= spi_data[bit_index];   // 送出1bit数据
                            bit_index <= bit_index - 1'b1;
                        end
                    end
                    17: begin
                        spi_clk <= spi_ctrl[1];
                    end
                endcase
            end
        end else begin
            // 初始状态
            spi_clk <= spi_ctrl[1];
            if (spi_ctrl[2] == 1'b0) begin
                spi_mosi <= spi_data[7];           // 送出最高位数据
                bit_index <= 4'h6;
            end else begin
                bit_index <= 4'h7;
            end
        end
    end
end

// 产生结束(完成)信号
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        done <= 1'b0;
    end else begin
        if (en && spi_clk_edge_cnt == 5'd17) begin
            done <= 1'b1;
        end else begin
            done <= 1'b0;
        end
    end
end



endmodule
