// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns / 1ns

module tb_scfifo();

    reg clk;
    reg rst_n;

    initial begin
        rst_n = 1'b0;
        #25
        rst_n = 1'b1;
    end

    // 50 MHz clk:
    initial begin
        clk = 1'b1;
        forever begin
            #10 clk = ~clk;
        end
    end

    reg rdreq;
    reg wrreq;
    reg [7:0] data;
    wire [7:0] q;
    wire empty;
    wire full;

    initial begin
        rdreq <= 1'b0;
        wrreq <= 1'b0;
        data <= 8'h00;
        #55
        // write 0xa1, 0xb2, 0xc3, 0xd4:
        wrreq <= 1'b1;
        data <= 8'ha1;
        #20
        wrreq <= 1'b1;
        data <= 8'hb2;
        #20
        wrreq <= 1'b1;
        data <= 8'hc3;
        #20
        wrreq <= 1'b1;
        data <= 8'hd4;
        #20
        // stop write and read 1:
        wrreq <= 1'b0;
        data <= 8'h00;
        rdreq <= 1'b1;
        #20
        // stop read:
        rdreq <= 1'b0;
        #20
        // write 5 bytes to full:
        wrreq <= 1'b1;
        data <= 8'h12;
        #20
        wrreq <= 1'b1;
        data <= 8'h34;
        #20
        wrreq <= 1'b1;
        data <= 8'h56;
        #20
        wrreq <= 1'b1;
        data <= 8'h78;
        #20
        wrreq <= 1'b1;
        data <= 8'h90;
        #20
        // stop write:
        wrreq <= 1'b0;
        data <= 8'h00;
        #20
        // read 9:
        rdreq <= 1'b1;
        #180
        // stop read:
        rdreq <= 1'b0;
        #20
        wrreq <= 1'b1;
        // write:
        data <= 8'hf1;
        #20
        data <= 8'hf2;
        #20
        data <= 8'hf3;
        #20
        data <= 8'hf4;
        #20
        data <= 8'hf5;
        #20
        data <= 8'hf6;
        #20
        data <= 8'hf7;
        #20
        data <= 8'hf8;
        #20
        data <= 8'hf9;
        #20
        wrreq <= 1'b0;
        rdreq <= 1'b1;
        #200
        // write:
        wrreq <= 1'b1;
        data <= 8'h11;
        #20
        // read and write:
        rdreq <= 1'b1;
        data <= 8'h22;
        #20
        rdreq <= 1'b1;
        data <= 8'h33;
        #20
        wrreq <= 1'b0;
        #20
        #20
        #20
        #20
        // read and write:
        wrreq <= 1'b1;
        rdreq <= 1'b1;
        data <= 8'h55;
        #20
        data <= 8'h66;
        #20
        wrreq <= 1'b0;
        #20
        #20
        rdreq <= 1'b0;
        #100;
    end

    scfifo component (
        .clk (clk),
        .rst_n (rst_n),
        .rdreq (rdreq),
        .wrreq (wrreq),
        .data (data),
        .q (q),
        .empty (empty),
        .full (full)
    );

    initial begin
        $dumpfile("tb_scfifo.vcd");
        $dumpvars(0, component);
        #1500
        $finish;
    end

endmodule
