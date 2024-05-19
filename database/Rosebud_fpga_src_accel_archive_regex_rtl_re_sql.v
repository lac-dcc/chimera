// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module re(input wire clk, input wire rst_n, input wire [7:0] in, output wire match);

reg reg_0;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_0 <= 'd0;
    end else begin
        if (('d73 == in))
            reg_0 <= 'd1;
        else if (~(('d73 == in)))
            reg_0 <= 'd0;
    end
end

reg reg_1;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_1 <= 'd0;
    end else begin
        if ((reg_0 & ('d78 == in)))
            reg_1 <= 'd1;
        else if (~((reg_0 & ('d78 == in))))
            reg_1 <= 'd0;
    end
end

reg reg_2;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_2 <= 'd0;
    end else begin
        if ((reg_1 & ('d83 == in)))
            reg_2 <= 'd1;
        else if (~((reg_1 & ('d83 == in))))
            reg_2 <= 'd0;
    end
end

reg reg_3;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_3 <= 'd0;
    end else begin
        if ((reg_2 & ('d69 == in)))
            reg_3 <= 'd1;
        else if (~((reg_2 & ('d69 == in))))
            reg_3 <= 'd0;
    end
end

reg reg_4;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_4 <= 'd0;
    end else begin
        if ((reg_3 & ('d82 == in)))
            reg_4 <= 'd1;
        else if (~((reg_3 & ('d82 == in))))
            reg_4 <= 'd0;
    end
end

reg reg_5;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_5 <= 'd0;
    end else begin
        if ((reg_4 & ('d84 == in)))
            reg_5 <= 'd1;
        else if (~((reg_4 & ('d84 == in))))
            reg_5 <= 'd0;
    end
end

reg reg_6;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_6 <= 'd0;
    end else begin
        if ((reg_6 | reg_5))
            reg_6 <= 'd1;
        else if (~((reg_6 | reg_5)))
            reg_6 <= 'd0;
    end
end

reg reg_7;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_7 <= 'd0;
    end else begin
        if ((reg_6 & ('d73 == in)))
            reg_7 <= 'd1;
        else if (~((reg_6 & ('d73 == in))))
            reg_7 <= 'd0;
    end
end

reg reg_8;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_8 <= 'd0;
    end else begin
        if ((reg_7 & ('d78 == in)))
            reg_8 <= 'd1;
        else if (~((reg_7 & ('d78 == in))))
            reg_8 <= 'd0;
    end
end

reg reg_9;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_9 <= 'd0;
    end else begin
        if ((reg_8 & ('d84 == in)))
            reg_9 <= 'd1;
        else if (~((reg_8 & ('d84 == in))))
            reg_9 <= 'd0;
    end
end

reg reg_10;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_10 <= 'd0;
    end else begin
        if ((reg_9 & ('d79 == in)))
            reg_10 <= 'd1;
        else if (~((reg_9 & ('d79 == in))))
            reg_10 <= 'd0;
    end
end

reg reg_11;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_11 <= 'd0;
    end else begin
        if (('d68 == in))
            reg_11 <= 'd1;
        else if (~(('d68 == in)))
            reg_11 <= 'd0;
    end
end

reg reg_12;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_12 <= 'd0;
    end else begin
        if ((reg_11 & ('d69 == in)))
            reg_12 <= 'd1;
        else if (~((reg_11 & ('d69 == in))))
            reg_12 <= 'd0;
    end
end

reg reg_13;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_13 <= 'd0;
    end else begin
        if ((reg_12 & ('d76 == in)))
            reg_13 <= 'd1;
        else if (~((reg_12 & ('d76 == in))))
            reg_13 <= 'd0;
    end
end

reg reg_14;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_14 <= 'd0;
    end else begin
        if ((reg_13 & ('d69 == in)))
            reg_14 <= 'd1;
        else if (~((reg_13 & ('d69 == in))))
            reg_14 <= 'd0;
    end
end

reg reg_15;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_15 <= 'd0;
    end else begin
        if ((reg_14 & ('d84 == in)))
            reg_15 <= 'd1;
        else if (~((reg_14 & ('d84 == in))))
            reg_15 <= 'd0;
    end
end

reg reg_16;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_16 <= 'd0;
    end else begin
        if ((reg_15 & ('d69 == in)))
            reg_16 <= 'd1;
        else if (~((reg_15 & ('d69 == in))))
            reg_16 <= 'd0;
    end
end

reg reg_17;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_17 <= 'd0;
    end else begin
        if ((reg_17 | reg_16))
            reg_17 <= 'd1;
        else if (~((reg_17 | reg_16)))
            reg_17 <= 'd0;
    end
end

reg reg_18;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_18 <= 'd0;
    end else begin
        if ((reg_17 & ('d70 == in)))
            reg_18 <= 'd1;
        else if (~((reg_17 & ('d70 == in))))
            reg_18 <= 'd0;
    end
end

reg reg_19;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_19 <= 'd0;
    end else begin
        if ((reg_18 & ('d82 == in)))
            reg_19 <= 'd1;
        else if (~((reg_18 & ('d82 == in))))
            reg_19 <= 'd0;
    end
end

reg reg_20;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_20 <= 'd0;
    end else begin
        if ((reg_19 & ('d79 == in)))
            reg_20 <= 'd1;
        else if (~((reg_19 & ('d79 == in))))
            reg_20 <= 'd0;
    end
end

reg reg_21;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_21 <= 'd0;
    end else begin
        if ((reg_20 & ('d77 == in)))
            reg_21 <= 'd1;
        else if (~((reg_20 & ('d77 == in))))
            reg_21 <= 'd0;
    end
end

reg reg_22;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_22 <= 'd0;
    end else begin
        if (('d85 == in))
            reg_22 <= 'd1;
        else if (~(('d85 == in)))
            reg_22 <= 'd0;
    end
end

reg reg_23;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_23 <= 'd0;
    end else begin
        if ((reg_22 & ('d80 == in)))
            reg_23 <= 'd1;
        else if (~((reg_22 & ('d80 == in))))
            reg_23 <= 'd0;
    end
end

reg reg_24;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_24 <= 'd0;
    end else begin
        if ((reg_23 & ('d68 == in)))
            reg_24 <= 'd1;
        else if (~((reg_23 & ('d68 == in))))
            reg_24 <= 'd0;
    end
end

reg reg_25;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_25 <= 'd0;
    end else begin
        if ((reg_24 & ('d65 == in)))
            reg_25 <= 'd1;
        else if (~((reg_24 & ('d65 == in))))
            reg_25 <= 'd0;
    end
end

reg reg_26;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_26 <= 'd0;
    end else begin
        if ((reg_25 & ('d84 == in)))
            reg_26 <= 'd1;
        else if (~((reg_25 & ('d84 == in))))
            reg_26 <= 'd0;
    end
end

reg reg_27;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_27 <= 'd0;
    end else begin
        if ((reg_26 & ('d69 == in)))
            reg_27 <= 'd1;
        else if (~((reg_26 & ('d69 == in))))
            reg_27 <= 'd0;
    end
end

reg reg_28;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_28 <= 'd0;
    end else begin
        if ((reg_28 | reg_27))
            reg_28 <= 'd1;
        else if (~((reg_28 | reg_27)))
            reg_28 <= 'd0;
    end
end

reg reg_29;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_29 <= 'd0;
    end else begin
        if ((reg_28 & ('d83 == in)))
            reg_29 <= 'd1;
        else if (~((reg_28 & ('d83 == in))))
            reg_29 <= 'd0;
    end
end

reg reg_30;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_30 <= 'd0;
    end else begin
        if ((reg_29 & ('d69 == in)))
            reg_30 <= 'd1;
        else if (~((reg_29 & ('d69 == in))))
            reg_30 <= 'd0;
    end
end

reg reg_31;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_31 <= 'd0;
    end else begin
        if ((reg_30 & ('d84 == in)))
            reg_31 <= 'd1;
        else if (~((reg_30 & ('d84 == in))))
            reg_31 <= 'd0;
    end
end

assign match = (reg_10 | reg_21 | reg_31);

endmodule
