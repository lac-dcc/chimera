// This program was cloned from: https://github.com/xiaowuzxc/SparrowRV
// License: MIT License

`include "defines.v"
module gpio (
    input wire clk,
    input wire rst_n,

    input wire[7:0] waddr_i,
    input wire[`MemBus] data_i,
    input wire[3:0] sel_i,
    input wire we_i,
    input wire[7:0] raddr_i,
    input wire rd_i,
    output reg[`MemBus] data_o,

	output reg [31:0]gpio_oe,//输出使能
	output reg [31:0]gpio_out,//输出数据
    input wire [31:0]gpio_in//输入数据
);

// 寄存器(偏移)地址
localparam GPIO_DIN = 8'h0;//输入数据
localparam GPIO_OPT = 8'h4;//输出数据
localparam GPIO_OEC = 8'h8;//输出使能
localparam GPIO_ODC = 8'hc;//开漏模式

// 输入数据，只读
// [31:0]对应GPIO0-31的当前的高低电平
reg [31:0] gpio_din;

// 输出数据，读写
// [31:0]对应GPIO0-31的输出值
reg [31:0] gpio_opt;

/* 端口模式，读写
 * GPIO_OEC与GPIO_ODC共同决定GPIOx端口模式
 * | GPIO_OEC  | GPIO_ODC  | GPIOx  
 * |-----------|-----------|---------------
 * |     0     |     0     | 高阻输入
 * |     0     |     1     | 高阻输入且锁存
 * |     1     |     0     | 推挽输出
 * |     1     |     1     | 开漏输出
 * |-----------|-----------|---------------*/
reg [31:0] gpio_oec;
reg [31:0] gpio_odc;


// 总线接口 写
always @ (posedge clk) begin
        if (we_i == 1'b1) begin
            case (waddr_i)
                GPIO_DIN: ;
                GPIO_OPT: gpio_opt <= data_i;
                GPIO_OEC: gpio_oec <= data_i;
                GPIO_ODC: gpio_odc <= data_i;
                default: ;
            endcase
        end 
        else begin
        end
//    end
end

// 总线接口 读
always @ (posedge clk) begin
    if (rd_i == 1'b1) begin
        case (raddr_i)
                GPIO_DIN: data_o <= gpio_din;
                GPIO_OPT: data_o <= gpio_opt;
                GPIO_OEC: data_o <= gpio_oec;
                GPIO_ODC: data_o <= gpio_odc;
            default: begin
                data_o <= 32'h0;
            end
        endcase
    end
    else begin
        data_o <= data_o;
    end
end

//输入打拍
reg [31:0] gpio_in_r;
always @(posedge clk) begin
	gpio_in_r <= gpio_in;
    gpio_din <= gpio_in_r;
end

//输出模式、使能
genvar i;
generate
for (i=0; i<32; i=i+1) begin
    always @(*) begin
        case ({gpio_oec[i], gpio_odc[i]})
            2'b00: begin
                gpio_oe [i] = 1'b0;
                gpio_out[i] = 1'bx;
            end
            2'b01: begin
                gpio_oe [i] = 1'b0;
                gpio_out[i] = 1'bx;
            end
            2'b10: begin
                gpio_oe [i] = 1'b1;
                gpio_out[i] = gpio_opt[i];
            end
            2'b11: begin
                gpio_oe [i] = ~gpio_opt[i];
                gpio_out[i] = 1'b0;
            end
        endcase
    end
end
endgenerate


endmodule