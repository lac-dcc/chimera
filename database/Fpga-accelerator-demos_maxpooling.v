`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/10 10:55:00
// Design Name: 
// Module Name: maxpooling
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


module maxpooling(
    input               clk             ,
    input               rst_n           ,

    input               valid_input     ,
    input   [32:0]      input_data      ,

    output              out_valid       ,
    output  [32:0]      out_data
    );

    reg     [ 9:0]      count            ;
    reg     [ 4:0]      max_cnt          ;
    reg                 out_flag         ;

    wire    [32:0]      ram_reg          ;
    wire    [32:0]      max_col_1_reg    ;
    wire    [32:0]      max_col_2_reg    ;

    reg     [32:0]      win_pool  [3:0]  ;

   always @ (posedge clk or negedge rst_n)begin
        if (!rst_n)
            count <= 10'd0;
        else if (valid_input)
            count <= count + 1'b1;
        else
            count <= count;
    end

    always @ (posedge clk or negedge rst_n)begin
        if (!rst_n)
            max_cnt <= 5'd0;
        else if (count >= 10'd25 && count <= 10'd576 && max_cnt == 5'd24)
            max_cnt <= 5'd1;
        else if (count >= 10'd25 && count <= 10'd576)
            max_cnt <= max_cnt + 1'b1;
        else
            max_cnt <= max_cnt;
    end

    always @ (posedge clk or negedge rst_n)begin
        if (!rst_n)
            out_flag <= 1'd0;
            else if (max_cnt >= 5'd1 && max_cnt <= 5'd23)
            out_flag <= ~ out_flag;
        else
            out_flag <= 1'b0;
    end

    always @ (posedge clk or negedge rst_n)begin
        if (!rst_n)begin
            win_pool[0] <= 32'd0;
            win_pool[1] <= 32'd0;
            win_pool[2] <= 32'd0;
            win_pool[3] <= 32'd0;
        end
        else if (count >= 10'd24 && count <= 10'd576)begin
            win_pool[0] <= ram_reg;
            win_pool[1] <= input_data;
            win_pool[2] <= win_pool[0];
            win_pool[3] <= win_pool[1];
        end
        else begin
            win_pool[0] <= win_pool[0];
            win_pool[1] <= win_pool[1];
            win_pool[2] <= win_pool[2];
            win_pool[3] <= win_pool[3];
        end
    end

    assign max_col_1_reg = win_pool[0] > win_pool[1] ? win_pool[0] : win_pool[1];
    assign max_col_2_reg = win_pool[2] > win_pool[3] ? win_pool[2] : win_pool[3];
    assign out_data      = out_valid == 1'b0 ? 32'd0 : max_col_2_reg > max_col_1_reg ? max_col_2_reg : max_col_1_reg;
    assign out_valid     = count >= 10'd24 && max_cnt >= 5'd2 && max_cnt <=5'd24 && out_flag ? 1'b1 : 1'b0;
    
    data_fifo fifo_inst(
        .CLK    (clk        ),
        .D      (input_data ),
        .CE     (valid_input),
        .Q      (ram_reg    )
    );
endmodule
