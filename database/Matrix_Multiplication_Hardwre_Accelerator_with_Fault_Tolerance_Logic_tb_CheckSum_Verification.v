// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/16 13:05:20
// Design Name: 
// Module Name: tb_CheckSum_Verification
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
module tb_CheckSum_Verification;
//要求是第15行第16列发生错误
// CheckSum_Verification Parameters
parameter PERIOD  = 10;


// CheckSum_Verification Inputs
reg   [1055:0]  dataCf_in                  = 0 ;
reg   clk                                  = 0 ;
reg   verify_enable                        = 0 ;
reg   [1:0]   detect_correct               = 0 ;
reg   fetch_Cf_row                         = 0 ;

// CheckSum_Verification Outputs
wire  [32:0]  column_indicator             ;
wire  error                                ;
wire  column_verify_ready                  ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

CheckSum_Verification  u_CheckSum_Verification (
    //input
    .dataCf_in               ( dataCf_in            [1055:0] ),
    .clk                     ( clk                           ),
    .verify_enable           ( verify_enable                 ),
    .detect_correct          (detect_correct        [1:0]    ),
    .fetch_Cf_row            (fetch_Cf_row                   ),
    //output
    .column_indicator        ( column_indicator     [32:0]   ),
    .error                   ( error                         ),
    .column_verify_ready     ( column_verify_ready           )
);
integer i,j;
reg [31:0] dataCf_value [0:32][0:32];
//这边dataCf_value指示的故障MAC出错可以放在第16列出错，观察
//给全编码矩阵赋初值，该全编码矩阵为全1阵和2倍的单位阵相乘所得结果
//编程这么简单，这么好玩的东西，怎么可能不会

initial begin
    for(i=0;i<33;i=i+1) begin
        for(j=0;j<33;j=j+1) begin
            if(((i==32)||(j==32))&&(i!=j)) begin
                dataCf_value[i][j]= 32'd64;
            end else if((i==32)&&(j==32)) begin
                dataCf_value[i][j] = 32'd2048;
            end else if((i==0)&&(j==16)) begin
                dataCf_value[i][j] = 32'd1;
            end else begin
                dataCf_value[i][j] = 32'd2;
            end
        end
    end
end

integer k = 0;
initial begin
    #6
    detect_correct = 2'd1;
    #20 
    verify_enable = 1'b1;
    #20
    @(negedge clk) begin
        fetch_Cf_row <= 1'b1;
        for (j = 0 ; j < 33 ; j = j + 1 ) begin
            dataCf_in[32*j+:32] = dataCf_value [k][j];
        end
        k = k + 1;
    end
    //上述代码块执行完毕后，k为1
    repeat(32) begin
        @(negedge u_CheckSum_Verification.flag_fetch_Cf_over) begin
            @(negedge clk) begin
                fetch_Cf_row = 1'b0;
                @(negedge clk) begin
                    fetch_Cf_row = 1'b1;
                    for ( j = 0 ; j < 33 ; j = j + 1 ) begin
                        dataCf_in[32*j+:32] = dataCf_value [k][j];
                    end
                    k = k + 1;
                end
            end
        end
    end

    @(posedge u_CheckSum_Verification.error) begin
        #30 verify_enable = 1'b0;
    end
    //上述代码块执行完后，k=33

end

initial
begin
    #1780
    $finish;
end

endmodule
