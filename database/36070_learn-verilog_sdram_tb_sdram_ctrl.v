// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns / 1ns

module tb_sdram_ctrl();

    reg clk_100m;
    reg clk_100m_shift;
    reg rst_n;

    initial begin
        rst_n = 1'b0;
        #25
        rst_n = 1'b1;
    end

    // 100 MHz clk and clk_shift:
    initial begin
        clk_100m = 1'b1;
        forever begin
            #5 clk_100m = ~clk_100m;
        end
    end

    initial begin
        clk_100m_shift = 1'b0;
        #7
        forever begin
            #5 clk_100m_shift = ~clk_100m_shift;
        end
    end

    wire [15:0] sdr_dq;
    wire [12:0] sdr_addr;
    wire [1:0] sdr_ba;
    wire [3:0] sdr_cmd;
    wire [1:0] sdr_dqm;

    reg [31:0] in_addr;

    reg in_wr_req;
    reg [3:0] in_wr_dqm;
    reg [31:0] in_wr_data;
    reg in_rd_req;

    initial begin
        in_wr_req = 1'b0;
        in_wr_data = 31'b0;
        in_addr = 31'b0;
        in_wr_dqm = 4'b0000;
        in_rd_req = 1'b0;
    end

    initial begin
        #429
        // write data 0xa1b2c3d4 to address 32'b10_1111101000000_100000110_0:
        // BA = 2, ROW = 8000, COL = 262
        in_wr_req = 1'b1;
        in_addr = 32'b10_1111101000000_100000110_0;
        in_wr_data = 32'ha1b2c3d4;
        in_wr_dqm = 4'b0000;
        #40
        in_wr_req = 1'b0;
    end

    initial begin
        #489
        // write data 0x??e5f6?? to address 32'b10_1111101000000_100000110_0:
        // BA = 2, ROW = 8000, COL = 262
        in_wr_req = 1'b1;
        in_addr = 32'b10_1111101000000_100000110_0;
        in_wr_data = 32'h00e5f600;
        in_wr_dqm = 4'b1001;
        #40
        in_wr_req = 1'b0;
    end

    initial begin
        #568
        // read data from address 32'b10_1111101000000_100000110_0:
        // BA = 2, ROW = 8000, COL = 262
        in_rd_req = 1'b1;
        in_addr = 32'b10_1111101000000_100000110_0;
        #40
        in_rd_req = 1'b0;
    end

    initial begin
        #956
        // read data from address 32'b10_1111101000000_100000110_0:
        // BA = 2, ROW = 8000, COL = 262
        in_rd_req = 1'b1;
        in_addr = 32'b10_1111101000000_100000110_0;
        #200
        in_rd_req = 1'b0;
    end

    sdram_ctrl #(
        .SDR_TPOWERUP (200), // speed power up from 200 us to 200 ns
        .SDR_INIT_AREF_COUNT (2), // aref x2 when init
        .SDR_REFRESH_CYCLE_TIME (6_400_000) // set refresh cycle to 6.4 ms to speed up test
    )
    component (
        .clk (clk_100m),
        .rst_n (rst_n),

        // connect in top:
        .in_addr (in_addr),
        .in_wr_req (in_wr_req),
        .in_wr_data (in_wr_data),
        .in_wr_dqm (in_wr_dqm),
        .in_rd_req (in_rd_req),

        // connect to SDR:
        .out_wr_dqm (sdr_dqm),
        .inout_data (sdr_dq),
        .cmd (sdr_cmd),
        .ba (sdr_ba),
        .addr (sdr_addr)
    );

    mt48lc16m16a2 sdram_inst (
        .Dq (sdr_dq),
        .Addr (sdr_addr),
        .Ba (sdr_ba),
        .Clk (clk_100m_shift),
        .Cke (1'b1),
        .Cs_n (sdr_cmd[3]),
        .Ras_n (sdr_cmd[2]),
        .Cas_n (sdr_cmd[1]),
        .We_n (sdr_cmd[0]),
        .Dqm (sdr_dqm)
    );

    initial begin
        $dumpfile("tb_sdram_ctrl.vcd");
        $dumpvars(0, component);
        $dumpvars(0, sdram_inst);
        #3000
        $finish;
    end

endmodule
