// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

module uart_rx(
    input               sys_clk,                //50M系统时钟
    input               sys_rst_n,              //系统复位
    input               uart_rxd,               //接收数据线
    output reg          uart_rx_done,           //数据接收完成标志
    output reg [7:0]    uart_rx_data            //接收到的数据
);
//常量化波特率，可更改
parameter       BPS         = 115200;           //波特率115200bps，可更改
parameter       SYS_CLK_FRE = 50_000_000;       //50M系统时钟
localparam      BPS_CNT     = SYS_CLK_FRE/BPS;  //传输一位数据所需要的时钟个数
localparam      SAMPLE_NUM  = 5;                //采样个数

integer idx;

reg                             uart_rx_d0;                 //寄存1拍
reg                             uart_rx_d1;                 //寄存2拍
reg [15:0]                      clk_cnt;                    //时钟计数器
reg [3:0]                       rx_cnt;                     //接收计数器
reg                             rx_flag;                    //接收标志位
reg [7:0]                       uart_rx_data_reg;           //数据寄存

reg [SAMPLE_NUM-1:0]            uart_rx_data_sample;        //数据采样
reg [$clog2(SAMPLE_NUM+1)-1:0]  uart_rx_data_sample_1num;   //数据采样1的个数
wire                            uart_rx_data_sample_out;    //数据采样输出

wire                            neg_uart_rx_data;           //数据的下降沿

assign neg_uart_rx_data = uart_rx_d1 & (~uart_rx_d0);       //捕获数据线的下降沿，用来标志数据传输开始
//将数据线打两拍，作用1：同步不同时钟域信号，防止亚稳态；作用2：用以捕获下降沿
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        uart_rx_d0 <= 1'b0;
        uart_rx_d1 <= 1'b0;
    end
    else begin
        uart_rx_d0 <= uart_rxd;
        uart_rx_d1 <= uart_rx_d0;
    end        
end

//捕获到数据下降沿（起始位0）后，拉高传输开始标志位，并在第9个数据（终止位）的传输过程正中（数据比较稳定）再将传输开始标志位拉低，标志传输结束
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        rx_flag <= 1'b0;
    else begin 
        if(neg_uart_rx_data)
            rx_flag <= 1'b1;
        else if ((rx_cnt==4'd0) && (clk_cnt==(SAMPLE_NUM+1)*BPS_CNT/(SAMPLE_NUM+2)) && uart_rx_data_sample_out) // 检测到的下降沿实际为毛刺，取消接收数据
            rx_flag <= 1'b0;
        else if((rx_cnt==4'd9)&&(clk_cnt==BPS_CNT/2))//在第9个数据（终止位）的传输过程正中（数据比较稳定）再将传输开始标志位拉低，标志传输结束
            rx_flag <= 1'b0;
        else 
            rx_flag <= rx_flag;
    end
end

//时钟每计数一个BPS_CNT（传输一位数据所需要的时钟个数），即将数据计数器加1，并清零时钟计数器
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        clk_cnt <= 16'd0;
        rx_cnt  <= 4'd0;
    end else if(rx_flag) begin
        if(clk_cnt<BPS_CNT-1'b1) begin
            clk_cnt <= clk_cnt+1'b1;
            rx_cnt  <= rx_cnt;
        end else begin
            clk_cnt <= 16'd0;
            rx_cnt  <= rx_cnt+1'b1;
            
        end
    end else begin
        rx_cnt  <= 4'd0;
        clk_cnt <= 16'd0;
    end        
end

// 每个数据的传输过程中，对数据线进行采样
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        uart_rx_data_sample <= {SAMPLE_NUM{1'b1}};
    end else if(rx_flag) begin
        for( idx = 1; idx<SAMPLE_NUM+1; idx = idx + 1) begin
            if(clk_cnt==idx*BPS_CNT/(SAMPLE_NUM+2)) begin
                uart_rx_data_sample <= {uart_rx_data_sample[SAMPLE_NUM-2:0],uart_rxd};
            end
        end
    end   
end

// 采样标识，无意义，用于调试
reg sample_flag;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        sample_flag <= 1'b0;
    end else if (sample_flag) begin
        sample_flag <= 1'b0;
    end else if (rx_flag) begin
        for( idx = 1; idx<SAMPLE_NUM+2; idx = idx + 1) begin
            if(clk_cnt==idx*BPS_CNT/(SAMPLE_NUM+2)) begin
                sample_flag <= 1'b1;
            end
        end 
    end 
end

//对数据进行采样，将采样的数据进行求和，判断数据的1的个数
always @(*) begin
    uart_rx_data_sample_1num = 0;  
    for( idx = 0; idx<SAMPLE_NUM; idx = idx + 1) begin
        uart_rx_data_sample_1num = uart_rx_data_sample_1num + uart_rx_data_sample[idx];
    end
end

assign uart_rx_data_sample_out = (uart_rx_data_sample_1num >= (SAMPLE_NUM/2+1));

//在每个数据的传输过程正中（数据比较稳定）将数据线上的数据赋值给数据寄存器
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        uart_rx_data_reg <= 8'd0;
    else if(rx_flag)
        if (clk_cnt==(SAMPLE_NUM+1)*BPS_CNT/(SAMPLE_NUM+2)) begin
            case(rx_cnt)            
                4'd1:uart_rx_data_reg[0] <= uart_rx_data_sample_out;
                4'd2:uart_rx_data_reg[1] <= uart_rx_data_sample_out;
                4'd3:uart_rx_data_reg[2] <= uart_rx_data_sample_out;
                4'd4:uart_rx_data_reg[3] <= uart_rx_data_sample_out;
                4'd5:uart_rx_data_reg[4] <= uart_rx_data_sample_out;
                4'd6:uart_rx_data_reg[5] <= uart_rx_data_sample_out;
                4'd7:uart_rx_data_reg[6] <= uart_rx_data_sample_out;
                4'd8:uart_rx_data_reg[7] <= uart_rx_data_sample_out;
                default:;
            endcase
        end
        else
            uart_rx_data_reg <= uart_rx_data_reg;
    else
        uart_rx_data_reg <= 8'd0;
end

//当数据传输到终止位时，拉高传输完成标志位，并将数据输出
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        uart_rx_done <= 1'b0;
        uart_rx_data <= 8'd0;
    end    
    else if(rx_cnt==4'd9) begin
        uart_rx_done <= 1'b1;
        uart_rx_data <= uart_rx_data_reg;
    end        
    else begin
        uart_rx_done <= 1'b0;
        uart_rx_data <= 8'd0;
    end
end

endmodule