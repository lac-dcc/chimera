// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module re(input wire clk, input wire rst_n, input wire [7:0] in, output match);
assign match = (reg_4 | reg_9);

reg reg_0;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_0 <= 'd0;
    end else begin
        if (('d72 == in))
            reg_0 <= 'd1;
        else if (~(('d72 == in)))
            reg_0 <= 'd0;
    end
end

reg reg_1;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_1 <= 'd0;
    end else begin
        if ((reg_0 & ('d101 == in)))
            reg_1 <= 'd1;
        else if (~((reg_0 & ('d101 == in))))
            reg_1 <= 'd0;
    end
end

reg reg_2;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_2 <= 'd0;
    end else begin
        if ((reg_1 & ('d108 == in)))
            reg_2 <= 'd1;
        else if (~((reg_1 & ('d108 == in))))
            reg_2 <= 'd0;
    end
end

reg reg_3;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_3 <= 'd0;
    end else begin
        if ((reg_2 & ('d108 == in)))
            reg_3 <= 'd1;
        else if (~((reg_2 & ('d108 == in))))
            reg_3 <= 'd0;
    end
end

reg reg_4;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_4 <= 'd0;
    end else begin
        if (((reg_2 | reg_3) & ('d111 == in)))
            reg_4 <= 'd1;
        else if (~(((reg_2 | reg_3) & ('d111 == in))))
            reg_4 <= 'd0;
    end
end

reg reg_5;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_5 <= 'd0;
    end else begin
        if (((in == 'd87) | (in == 'd119)))
            reg_5 <= 'd1;
        else if (~(((in == 'd87) | (in == 'd119))))
            reg_5 <= 'd0;
    end
end

reg reg_6;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_6 <= 'd0;
    end else begin
        if ((reg_5 & ('d111 == in)))
            reg_6 <= 'd1;
        else if (~((reg_5 & ('d111 == in))))
            reg_6 <= 'd0;
    end
end

reg reg_7;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_7 <= 'd0;
    end else begin
        if ((reg_6 & ('d114 == in)))
            reg_7 <= 'd1;
        else if (~((reg_6 & ('d114 == in))))
            reg_7 <= 'd0;
    end
end

reg reg_8;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_8 <= 'd0;
    end else begin
        if ((reg_7 & ('d108 == in)))
            reg_8 <= 'd1;
        else if (~((reg_7 & ('d108 == in))))
            reg_8 <= 'd0;
    end
end

reg reg_9;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        reg_9 <= 'd0;
    end else begin
        if ((reg_8 & ('d100 == in)))
            reg_9 <= 'd1;
        else if (~((reg_8 & ('d100 == in))))
            reg_9 <= 'd0;
    end
end
endmodule
