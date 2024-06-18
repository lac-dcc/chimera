// This program was cloned from: https://github.com/efabless/EF_TMR32
// License: Apache License 2.0

`timescale 1ns/1ps

module top();
    wire  		pwm0;
    wire  		pwm1;
    wire  		pwm_fault = 0;
    reg  		CLK = 0;
    wire 		RESETn = 1;
    wire 		irq;

    `ifdef BUS_TYPE_APB
        wire [31:0] PADDR;
        wire PWRITE;
        wire PSEL;
        wire PENABLE;
        wire [31:0] PWDATA;
        wire [31:0] PRDATA;
        wire PREADY;
        EF_TMR32_APB uut( .pwm0(pwm0), .pwm1(pwm1), .pwm_fault(pwm_fault), .PCLK(CLK), .PRESETn(RESETn), .PADDR(PADDR), .PWRITE(PWRITE), .PSEL(PSEL), .PENABLE(PENABLE), .PWDATA(PWDATA), .PRDATA(PRDATA), .PREADY(PREADY), .IRQ(irq)
        );
    `endif // BUS_TYPE_APB
    `ifdef BUS_TYPE_AHB
        wire [31:0]	HADDR;
        wire 		HWRITE;
        wire 		HSEL = 0;
        wire 		HREADYOUT;
        wire [1:0]	HTRANS=0;
        wire [31:0]	HWDATA;
        wire [31:0]	HRDATA;
        wire 		HREADY;
        EF_TMR32_AHBL uut(.pwm0(pwm0), .pwm1(pwm1), .pwm_fault(pwm_fault), .HCLK(CLK), .HRESETn(RESETn), .HADDR(HADDR), .HWRITE(HWRITE), .HSEL(HSEL), .HTRANS(HTRANS), .HWDATA(HWDATA), .HRDATA(HRDATA), .HREADY(HREADY),.HREADYOUT(HREADYOUT), .IRQ(irq));
    `endif // BUS_TYPE_AHB
    `ifdef BUS_TYPE_WISHBONE
        wire [31:0] adr_i;
        wire [31:0] dat_i;
        wire [31:0] dat_o;
        wire [3:0]  sel_i;
        wire        cyc_i;
        wire        stb_i;
        reg         ack_o;
        EF_TMR32_WB uut(.pwm0(pwm0), .pwm1(pwm1), .pwm_fault(pwm_fault), .clk_i(CLK), .rst_i(~RESETn), .adr_i(adr_i), .dat_i(dat_i), .dat_o(dat_o), .sel_i(sel_i), .cyc_i(cyc_i), .stb_i(stb_i), .ack_o(ack_o),.we_i(we_i), .IRQ(irq));
    `endif // BUS_TYPE_WISHBONE
`ifndef SKIP_WAVE_DUMP
initial begin
    $dumpfile("waves.vcd");
    $dumpvars(0, top);
end
`endif

always #5 CLK <= !CLK;

// get the timeout flag as it's not output 
wire timeout_flag = uut.timeout_flag;

endmodule