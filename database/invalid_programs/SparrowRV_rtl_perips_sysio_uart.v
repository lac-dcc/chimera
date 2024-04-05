`include "defines.v"
module uart(

    input wire clk,
    input wire rst_n,

    input wire[7:0] waddr_i,
    input wire[`MemBus] data_i,
    input wire[3:0] sel_i,
    input wire we_i,
    input wire[7:0] raddr_i,
    input wire rd_i,
    output wire[`MemBus] data_o,

	output wire tx_pin,
    input wire rx_pin

);

// 设置串口配置：115200, 8，N，1
localparam BAUD_DEF = 115200;
localparam BAUD_DIV = `CPU_CLOCK_HZ / BAUD_DEF;

localparam S_IDLE       = 4'b0001;
localparam S_START      = 4'b0010;
localparam S_SEND_BYTE  = 4'b0100;
localparam S_STOP       = 4'b1000;


reg[3:0] state;
reg[3:0] next_state;
reg[15:0] cycle_cnt;
reg tx_bit;
reg[3:0] bit_cnt;

reg rx_q0;
reg rx_q1;
wire rx_negedge;
reg rx_start;                      // RX使能
reg[3:0] rx_clk_edge_cnt;          // clk沿的个数
reg rx_clk_edge_level;             // clk沿电平
reg rx_done;
reg[15:0] rx_clk_cnt;
reg[15:0] rx_div_cnt;
reg[7:0] rx_data;
reg rx_over;

// 寄存器(偏移)地址
localparam UART_CTRL    = 8'h0;
localparam UART_STATUS  = 8'h4;
localparam UART_BAUD    = 8'h8;
localparam UART_TXDATA  = 8'hc;
localparam UART_RXDATA  = 8'h10;

// UART控制寄存器，可读可写
// bit[0]: UART TX使能, 1: enable, 0: disable
// bit[1]: UART RX使能, 1: enable, 0: disable
reg [1:0] uart_ctrl;

// UART状态寄存器
// 只读，bit[0]: TX空闲状态标志, 1: busy, 0: idle
// 可读可写，bit[1]: RX接收完成标志, 1: over, 0: receiving
reg [1:0] uart_status;

// UART波特率寄存器(分频系数)，可读可写
reg [15:0] uart_div;

// UART发送数据寄存器，可读可写
reg [15:0] uart_tx;

// UART接收数据寄存器，只读
reg [7:0] uart_rx;

wire wen = we_i;
wire ren = rd_i;
wire write_reg_ctrl_en = wen & (waddr_i[7:0] == UART_CTRL);//写uart_ctrl，以下同理
wire write_reg_status_en = wen & (waddr_i[7:0] == UART_STATUS);
wire write_reg_baud_en = wen & (waddr_i[7:0] == UART_BAUD);
wire write_reg_txdata_en = wen & (waddr_i[7:0] == UART_TXDATA);
wire tx_start = write_reg_txdata_en & sel_i[0] & uart_ctrl[0] & (~uart_status[0]);//发送启动标志
wire rx_recv_over = uart_ctrl[1] & rx_over;//接收完成标志

assign tx_pin = tx_bit;


// 写uart_rxdata
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        uart_rx <= 8'h0;
    end else begin
        // 接收完成时，保存接收到的数据
        if (rx_recv_over) begin
            uart_rx[7:0] <= rx_data;
        end
    end
end

// 写uart_txdata
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        uart_tx <= 15'h0;
    end else begin
        // 开始发送时，保存要发送的数据
        if (tx_start) begin
            uart_tx[7:0] <= data_i[7:0];
        end
    end
end

// 写uart_status
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        uart_status <= 2'h0;
    end else begin
        if (write_reg_status_en & sel_i[0]) begin
            // 写RX完成标志
            uart_status[1] <= data_i[1];
        end 
        else begin
            // 开始发送数据时，置位TX忙标志
            if (tx_start) begin
                uart_status[0] <= 1'b1;
            // 发送完成时，清TX忙标志
            end else if ((state == S_STOP) & (cycle_cnt == uart_div[15:0])) begin
                uart_status[0] <= 1'b0;
            // 接收完成，置位接收完成标志
            end
            if (rx_recv_over) begin
                uart_status[1] <= 1'b1;
            end
        end
    end
end

// 写uart_ctrl
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        uart_ctrl <= 2'h0;
    end else begin
        if (write_reg_ctrl_en & sel_i[0]) begin
            uart_ctrl <= data_i[1:0];
        end
    end
end

// 写uart_baud
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        uart_div <= BAUD_DIV;
    end else begin
        if (write_reg_baud_en) begin
            if (sel_i[0]) begin
                uart_div[7:0] <= data_i[7:0];
            end
            if (sel_i[1]) begin
                uart_div[15:8] <= data_i[15:8];
            end
        end
    end
end

reg[31:0] data_r;

// 读寄存器
always @ (posedge clk) begin
    if (ren) begin
        case (raddr_i[7:0])
            UART_CTRL:   data_r <= {30'h0, uart_ctrl};
            UART_STATUS: data_r <= {30'h0, uart_status};
            UART_BAUD:   data_r <= {16'h0, uart_div};
            UART_RXDATA: data_r <= {24'h0, uart_rx};
            default:     data_r <= 32'h0;
        endcase
    end 
    else begin
        data_r <= data_r;
    end
end

assign data_o = data_r;

// *************************** TX发送 ****************************

always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= S_IDLE;
    end else begin
        state <= next_state;
    end
end

always @ (*) begin
    case (state)
        S_IDLE: begin
            if (tx_start) begin
                next_state = S_START;
            end else begin
                next_state = S_IDLE;
            end
        end
        S_START: begin
            if (cycle_cnt == uart_div[15:0]) begin
                next_state = S_SEND_BYTE;
            end else begin
                next_state = S_START;
            end
        end
        S_SEND_BYTE: begin
            if ((cycle_cnt == uart_div[15:0]) & (bit_cnt == 4'd7)) begin
                next_state = S_STOP;
            end else begin
                next_state = S_SEND_BYTE;
            end
        end
        S_STOP: begin
            if (cycle_cnt == uart_div[15:0]) begin
                next_state = S_IDLE;
            end else begin
                next_state = S_STOP;
            end
        end
        default: begin
            next_state = S_IDLE;
        end
    endcase
end

// cycle_cnt
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cycle_cnt <= 16'h0;
    end else begin
        if (state == S_IDLE) begin
            cycle_cnt <= 16'h0;
        end else begin
            if (cycle_cnt == uart_div[15:0]) begin
                cycle_cnt <= 16'h0;
            end else begin
                cycle_cnt <= cycle_cnt + 16'h1;
            end
        end
    end
end

// bit_cnt
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        bit_cnt <= 4'h0;
    end else begin
        case (state)
            S_IDLE: begin
                bit_cnt <= 4'h0;
            end
            S_SEND_BYTE: begin
                if (cycle_cnt == uart_div[15:0]) begin
                    bit_cnt <= bit_cnt + 4'h1;
                end
            end
        endcase
    end
end

// tx_bit
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        tx_bit <= 1'b0;
    end else begin
        case (state)
            S_IDLE, S_STOP: begin
                tx_bit <= 1'b1;
            end
            S_START: begin
                tx_bit <= 1'b0;
            end
            S_SEND_BYTE: begin
                tx_bit <= uart_tx[bit_cnt];
            end
        endcase
    end
end

// *************************** RX接收 ****************************

always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_q0 <= 1'b0;
        rx_q1 <= 1'b0;	
    end else begin
        rx_q0 <= rx_pin;
        rx_q1 <= rx_q0;
    end
end

// 下降沿检测(检测起始信号)
assign rx_negedge = rx_q1 & (~rx_q0);

// 产生开始接收数据信号，接收期间一直有效
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_start <= 1'b0;
    end else begin
        if (uart_ctrl[1]) begin
            if (rx_negedge) begin
                rx_start <= 1'b1;
            end else if (rx_clk_edge_cnt == 4'd9) begin
                rx_start <= 1'b0;
            end
        end else begin
            rx_start <= 1'b0;
        end
    end
end

always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_div_cnt <= 16'h0;
    end else begin
        // 第一个时钟沿只需波特率分频系数的一半
        if (rx_start == 1'b1 && rx_clk_edge_cnt == 4'h0) begin
            rx_div_cnt <= {1'b0, uart_div[15:1]};
        end else begin
            rx_div_cnt <= uart_div[15:0];
        end
    end
end

// 对时钟进行计数
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_clk_cnt <= 16'h0;
    end else if (rx_start == 1'b1) begin
        // 计数达到分频值
        if (rx_clk_cnt == rx_div_cnt) begin
            rx_clk_cnt <= 16'h0;
        end else begin
            rx_clk_cnt <= rx_clk_cnt + 16'h1;
        end
    end else begin
        rx_clk_cnt <= 16'h0;
    end
end

// 每当时钟计数达到分频值时产生一个上升沿脉冲
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_clk_edge_cnt <= 4'h0;
        rx_clk_edge_level <= 1'b0;
    end else if (rx_start == 1'b1) begin
        // 计数达到分频值
        if (rx_clk_cnt == rx_div_cnt) begin
            // 时钟沿个数达到最大值
            if (rx_clk_edge_cnt == 4'd9) begin
                rx_clk_edge_cnt <= 4'h0;
                rx_clk_edge_level <= 1'b0;
            end else begin
                // 时钟沿个数加1
                rx_clk_edge_cnt <= rx_clk_edge_cnt + 4'h1;
                // 产生上升沿脉冲
                rx_clk_edge_level <= 1'b1;
            end
        end else begin
            rx_clk_edge_level <= 1'b0;
        end
    end else begin
        rx_clk_edge_cnt <= 4'h0;
        rx_clk_edge_level <= 1'b0;
    end
end

// bit序列
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_data <= 8'h0;
        rx_over <= 1'b0;
    end else begin
        if (rx_start == 1'b1) begin
            // 上升沿
            if (rx_clk_edge_level == 1'b1) begin
                case (rx_clk_edge_cnt)
                    // 起始位
                    1: begin

                    end
                    // 第1位数据位
                    2: begin
                        if (rx_pin) begin
                            rx_data <= 8'h80;
                        end else begin
                            rx_data <= 8'h0;
                        end
                    end
                    // 剩余数据位
                    3, 4, 5, 6, 7, 8, 9: begin
                        rx_data <= {rx_pin, rx_data[7:1]};
                        // 最后一位接收完成，置位接收完成标志
                        if (rx_clk_edge_cnt == 4'h9) begin
                            rx_over <= 1'b1;
                        end
                    end
                endcase
            end
        end else begin
            rx_data <= 8'h0;
            rx_over <= 1'b0;
        end
    end
end



endmodule
