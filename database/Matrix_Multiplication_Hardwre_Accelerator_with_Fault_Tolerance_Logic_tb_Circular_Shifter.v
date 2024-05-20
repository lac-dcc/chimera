// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/16 13:16:33
// Design Name: 
// Module Name: tb_Circular_Shifter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tb_Circular_Shifter;

// Circular_Shifter Parameters
parameter PERIOD  = 10;


// Circular_Shifter Inputs
reg   [1055:0]  dataBr_Cf_in               = 0 ;
reg   shift_direction                      = 0 ;
reg   [5:0]  step_size                     = 0 ;
reg   clk                                  = 0 ;
// reg   rst_n                                = 0 ;
reg   shift_enable                         = 0 ;
reg   direct_connection                 = 0 ;
// Circular_Shifter Outputs
wire  [1055:0]  dataBr_Cf_out              ;
wire  shift_ready                          ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

Circular_Shifter  u_Circular_Shifter (
    .dataBr_Cf_in            ( dataBr_Cf_in     [1055:0] ),
    .shift_direction         ( shift_direction           ),
    .step_size               ( step_size        [6:0]    ),
    .clk                     ( clk                       ),
    .shift_enable            ( shift_enable              ),
    .direct_connection       (direct_connection          ),

    .dataBr_Cf_out           ( dataBr_Cf_out    [1055:0] ),
    .shift_ready             ( shift_ready               )
);

initial begin
    # 23
    shift_enable = 1'b1;
    # 40
    shift_enable = 1'b0;
    step_size = 6'd3;
    shift_direction = 1'b0;//右移
    # 40
    shift_enable = 1'b1;
    # 100
    direct_connection = 1'b1;//直接连接输入输出端口
end

reg [31:0] reg_data_in [32:0];
integer i,j;
initial begin
    for (i = 0 ;i < 33 ;i = i+1) begin
        if((i == 0)||(i == 32))begin
            reg_data_in[i] = 32'h1111_1111;
        end else if((i == 1)||(i == 31))begin
            reg_data_in[i] = 32'h2222_2222;
        end else if((i == 2)||(i==30))begin
            reg_data_in[i] = 32'h3333_3333;
        end else begin
            reg_data_in[i] = 32'd0;
        end
    end
end

initial begin
    for (j = 0;j < 33;j = j+1 ) begin
        dataBr_Cf_in[32*j+:32] = reg_data_in[j];
    end
    //下面这两个信号不是shift_enable和direct_connection
    shift_direction = 1'b1;//下移位
    step_size = 6'd2;//移位步长是2
end

initial
begin
    # 300
    $finish;
end

endmodule
