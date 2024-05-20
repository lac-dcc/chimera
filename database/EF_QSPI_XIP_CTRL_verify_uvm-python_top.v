// This program was cloned from: https://github.com/efabless/EF_QSPI_XIP_CTRL
// License: Apache License 2.0

`timescale 1ns/1ps

module top();
    reg 		CLK = 0;
    wire 		RESETn = 1;
    wire 		RX;
    wire 		TX;
    wire 		irq;
    // only AHB is supported
    wire [31:0]	HADDR;
    wire 		HWRITE;
    wire 		HSEL = 0;
    wire 		HREADYOUT;
    wire [1:0]	HTRANS=0;
    wire [31:0]	HWDATA = 0;
    wire [31:0]	HRDATA;
    wire 		HREADY;
    // spi interface 
    wire        sck;
    wire        ce_n;
    wire [3:0]  din;
    wire [3:0]  dout;
    wire [3:0]  douten;
    // design
    EF_QSPI_XIP_CTRL_ahbl dut(
        .HCLK(CLK), 
        .HRESETn(RESETn), 
        .HADDR(HADDR), 
        .HWRITE(HWRITE), 
        .HSEL(HSEL), 
        .HTRANS(HTRANS), 
        // .HWDATA(HWDATA), 
        .HRDATA(HRDATA), 
        .HREADY(HREADY),
        .HREADYOUT(HREADYOUT),
        .sck(sck),
        .ce_n(ce_n),
        .din(din),
        .dout(dout),
        .douten(douten)
    );
    assign HREADY = HREADYOUT;
    // vip interface 
    wire [3:0] SIO = (douten==4'b1111) ? dout : 4'bzzzz;
    assign din = SIO;
    sst26wf080b vip(
        .SCK(sck),
        .CEb(ce_n),
        .SIO(SIO)
    );
    // alias mem = vip.I0.memory;
    // alias vip_reset = vip.I0.reset;

    `ifndef SKIP_WAVE_DUMP
        initial begin
            $dumpfile ({"waves.vcd"});
            $dumpvars(0, top);
        end
    `endif
    always #10 CLK = !CLK; // clk generator
endmodule