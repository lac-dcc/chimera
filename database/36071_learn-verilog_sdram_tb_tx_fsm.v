// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns / 1ns

module tb_tx_fsm();

    reg clk_rd;
    reg clk_wr;
    reg rst_n;

    initial begin
        rst_n = 1'b0;
        #25
        rst_n = 1'b1;
    end

    // 50 MHz clk_rd:
    initial begin
        clk_rd = 1'b1;
        forever begin
            #10 clk_rd = ~clk_rd;
        end
    end

    // 100 MHz clk_wr:
    initial begin
        clk_wr = 1'b1;
        #2
        forever begin
            #5 clk_wr = ~clk_wr;
        end
    end

    reg wr_req;
    reg [31:0] wr_data;
    wire rd_empty;
    wire out_tx_data;
    wire out_tx_en;

    tx_fsm #(
        .BAUD (5_000_000) // 波特率是时钟频率的1/10
    )
    component (
        .clk_wr (clk_wr),
        .clk_rd (clk_rd),
        .wr_rst_n (rst_n),
        .rd_rst_n (rst_n),
        .wr_req (wr_req),
        .wr_data (wr_data),
        .rd_empty (rd_empty),
        .out_tx_data (out_tx_data),
        .out_tx_en (out_tx_en)
    );

    initial begin
        tx_send(32'ha1b2c3d4);
        tx_send(32'h9f7e5d3c);
        $stop;
    end

    task tx_send;
        input reg [31:0] tx_task_data;
        begin
            wr_req = 1'b0;
            wr_data = tx_task_data;
            #55;
            wr_req <= 1'b1;
            #10;
            wr_req <= 1'b0;
            #10000;
        end
    endtask

    initial begin
        $dumpfile("tb_tx_fsm.vcd");
        $dumpvars(0, component);
    end

endmodule
