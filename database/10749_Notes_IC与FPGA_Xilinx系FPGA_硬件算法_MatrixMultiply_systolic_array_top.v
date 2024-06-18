// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale 1ns / 1ps 
// `include "pe_array.v"
// `include "array_regenerate.v"

//Z = X x Y
module systolic_array_top#(
           parameter BITWIDTH = 8,
           parameter IS_BITWIDTH_DOUBLE_SCALE = 1,
           parameter X_ROW = 3,
           parameter XCOL_YROW = 3,
           parameter Y_COL = 3
       )(
           input sys_clk,
           input sys_rst_n,
           input start,
           output reg done,

           input signed [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] X,  //X: X_ROW*X_COL matrix
           input signed [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] Y,  //Y: Y_ROW*Y_COL matrix
           output signed [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) * X_ROW * Y_COL - 1: 0] Z //Z: X_ROW*Y_COL matrix
       );
localparam IDLE = 2'b01;
localparam BUSY = 2'b10;

reg [1: 0] current_state;
reg [1: 0] next_state;

reg cal_en;
wire signed [Y_COL * BITWIDTH - 1: 0] in_col;
wire signed [X_ROW * BITWIDTH - 1: 0] in_row;

//systolic array PE
pe_array #(
             .BITWIDTH ( BITWIDTH ),
             .IS_BITWIDTH_DOUBLE_SCALE(IS_BITWIDTH_DOUBLE_SCALE),
             .X_ROW ( X_ROW ),
             .Y_COL ( Y_COL )
         )
         u_pe_array(
             //ports
             .clk ( sys_clk ),
             .rst_n ( sys_rst_n ),
             .en ( cal_en ),
             .in_row ( in_row ),
             .in_col ( in_col ),
             .result ( Z )
         );

//input data control
reg calculate_flag;

//format data
array_regenerate #(
                     .BITWIDTH ( BITWIDTH ),
                     .X_ROW ( X_ROW ),
                     .XCOL_YROW ( XCOL_YROW ),
                     .Y_COL ( Y_COL )
                 )
                 u_array_regenerate(
                     //ports
                     .sys_clk ( sys_clk ),
                     .sys_rst_n ( sys_rst_n ),
                     .calculate_flag ( calculate_flag ),
                     .X ( X ),
                     .Y ( Y ),
                     .in_col ( in_col ),
                     .in_row ( in_row )
                 );

//detect posedge of start signal
wire start_pos_sig;
reg start_d0;
reg start_d1;

assign start_pos_sig = (start_d0) & (~start_d1); //start signal posedge valid

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        start_d0 <= 1'b0;
        start_d1 <= 1'b0;
    end
    else begin
        start_d0 <= start;
        start_d1 <= start_d0;
    end
end

//calculate counter
reg [31: 0] cal_cnt;
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        cal_cnt <= 32'b0;
    end
    else begin
        if (cal_cnt > XCOL_YROW + X_ROW - 1) begin
            cal_cnt <= 32'b0;
        end
        else if (current_state == BUSY) begin
            cal_cnt <= cal_cnt + 1'd1;
        end
        else begin
            cal_cnt <= 32'b0;
        end
    end
end

//FSM
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end

always @( * ) begin
    case (current_state)
        IDLE: begin
            if (start_pos_sig) begin //start calculate when recv posedge of start
                next_state = BUSY;
            end
            else begin
                next_state = IDLE;
            end
        end
        BUSY: begin
            if (cal_cnt > XCOL_YROW + X_ROW - 1) begin //one calculation done when counter reach the end
                next_state = IDLE;
            end
            else begin
                next_state = BUSY;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        calculate_flag <= 1'b0;
        cal_en <= 1'b0;
        done <= 1'b1;
    end
    else begin
        case (current_state)
            IDLE: begin
                calculate_flag <= 1'b0;
                cal_en <= 1'b0;
                done <= 1'b1;
            end
            BUSY: begin
                calculate_flag <= 1'b1;
                cal_en <= 1'b1;
                done <= 1'b0;
            end
            default: begin
                calculate_flag <= 1'b0;
                cal_en <= 1'b0;
                done <= 1'b1;
            end
        endcase
    end
end

endmodule
