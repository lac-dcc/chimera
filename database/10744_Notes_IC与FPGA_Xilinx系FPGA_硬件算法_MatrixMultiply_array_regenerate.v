// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module array_regenerate#(
           parameter BITWIDTH = 8,
           parameter X_ROW = 3,
           parameter XCOL_YROW = 3,
           parameter Y_COL = 3
       )(
           input wire sys_clk,
           input wire sys_rst_n,
           input wire calculate_flag,

           input wire signed [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] X, //X: X_ROW*X_COL matrix
           input wire signed [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] Y, //Y: Y_ROW*Y_COL matrix

           output wire signed [Y_COL * BITWIDTH - 1: 0] in_col,
           output wire signed [X_ROW * BITWIDTH - 1: 0] in_row
       );

reg signed [BITWIDTH - 1: 0] data_buffer_row [0: XCOL_YROW + X_ROW - 2][0: X_ROW - 1]; //matrix X regenerate as row buffer
reg signed [BITWIDTH - 1: 0] data_buffer_col [0: XCOL_YROW + Y_COL - 2][0: Y_COL - 1]; //matrix Y regenerate as col buffer

//trans array into matrix 
//regenerate as 2-dimension array
//wait for sending to SA
genvar r, s;
generate
    for (s = 0;s < X_ROW;s = s + 1) begin
        assign in_row[(X_ROW * BITWIDTH - 1) - (s * BITWIDTH) -: BITWIDTH] = data_buffer_row[0][s];
    end

    for (r = 0;r < XCOL_YROW + X_ROW - 1;r = r + 1) begin
        for (s = 0;s < X_ROW;s = s + 1) begin
            always @(posedge sys_clk or negedge sys_rst_n) begin
                if (!sys_rst_n) begin
                    data_buffer_row[r][s] <= {BITWIDTH{1'b0}};
                end
                else if (calculate_flag) begin
                    if (r < XCOL_YROW + X_ROW - 2) begin
                        data_buffer_row[r][s] <= data_buffer_row[r + 1][s];
                    end
                    else begin
                        data_buffer_row[r][s] <= {BITWIDTH{1'b0}};
                    end
                end
                else begin
                    if ((s <= r) && (s >= r - (XCOL_YROW - 1))) begin
                        data_buffer_row[r][s] <= X[((BITWIDTH * XCOL_YROW * X_ROW - 1) - ((s * BITWIDTH * XCOL_YROW) + ((r - s) * BITWIDTH))) -: BITWIDTH];
                    end
                    else begin
                        data_buffer_row[r][s] <= {BITWIDTH{1'b0}};
                    end
                end
            end
        end
    end
endgenerate

genvar p, q;
generate
    for (q = 0;q < Y_COL;q = q + 1) begin
        assign in_col[(Y_COL * BITWIDTH - 1) - (q * BITWIDTH) -: BITWIDTH] = data_buffer_col[0][q];
    end

    for (p = 0;p < XCOL_YROW + Y_COL - 1;p = p + 1) begin
        for (q = 0;q < Y_COL;q = q + 1) begin
            always @(posedge sys_clk or negedge sys_rst_n) begin
                if (!sys_rst_n) begin
                    data_buffer_col[p][q] <= {BITWIDTH{1'b0}};
                end
                else if (calculate_flag) begin
                    if (p < XCOL_YROW + Y_COL - 2) begin
                        data_buffer_col[p][q] <= data_buffer_col[p + 1][q];
                    end
                    else begin
                        data_buffer_col[p][q] <= {BITWIDTH{1'b0}};
                    end
                end
                else begin
                    if ((q <= p) && (q >= p - (XCOL_YROW - 1))) begin
                        data_buffer_col[p][q] <= Y[((BITWIDTH * Y_COL * XCOL_YROW - 1) - (((p - q) * BITWIDTH * Y_COL) + (q * BITWIDTH))) -: BITWIDTH];
                    end
                    else begin
                        data_buffer_col[p][q] <= {BITWIDTH{1'b0}};
                    end
                end
            end
        end
    end
endgenerate

endmodule
