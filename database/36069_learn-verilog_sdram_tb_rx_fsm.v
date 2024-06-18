// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns / 1ns

module tb_rx_fsm();

    reg clk_wr;
    reg clk_rd;
    reg rst_n;

    initial begin
        rst_n = 1'b0;
        #25
        rst_n = 1'b1;
    end

    // 50 MHz clk_wr:
    initial begin
        clk_wr = 1'b1;
        forever begin
            #10 clk_wr = ~clk_wr;
        end
    end

    // 100 MHz clk_rd:
    initial begin
        clk_rd = 1'b1;
        #2
        forever begin
            #5 clk_rd = ~clk_rd;
        end
    end

    reg in_rx_data;
    reg in_op_ack;
    wire [7:0] out_op;
    wire [31:0] out_address;
    wire [31:0] out_data;

    rx_fsm #(
        .BAUD (5_000_000) // 波特率是时钟频率的1/10
    )
    component (
        .clk_wr (clk_wr),
        .clk_rd (clk_rd),
        .wr_rst_n (rst_n),
        .rd_rst_n (rst_n),
        .in_rx_data (in_rx_data),
        .op_ack (in_op_ack),
        .op (out_op),
        .address (out_address),
        .data (out_data)
    );

    initial begin
        rx_task(64'hfea1b2c3_6c7d8e9c);
        rx_task(64'hfdc9b8a7_10244096);
        rx_task(64'hfc123456_abcd0123); // bad op = fc
        #10000;
        $finish;
    end

    task rx_task;
        input reg [63:0] rx_task_data;
        reg [7:0] one_byte;
        begin
            in_rx_data = 1'b1;
            in_op_ack = 1'b0;
            #55;
            repeat (8) begin
                one_byte = rx_task_data[63:56];
                rx_task_data = rx_task_data << 8;
                in_rx_data = 1'b0; // leading bit 0
                #200;
                repeat (8) begin
                    in_rx_data = one_byte[0];
                    one_byte = one_byte >> 1;
                    #200;
                end
                in_rx_data = 1'b1; // end bit 1
                #200;
            end
            #300;
            in_op_ack = 1'b1;
            #40;
            in_op_ack = 1'b0;
            #100;
        end
    endtask

    initial begin
        $dumpfile("tb_rx_fsm.vcd");
        $dumpvars(0, component);
    end

endmodule
