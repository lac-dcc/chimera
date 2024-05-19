// This program was cloned from: https://github.com/AUCOHL/Lighter
// License: Apache License 2.0

`define CHECK_W(X, T)  if(rdata == X) $display("Test %0d: passed", T); else $display("Test %0d: FAILED", T);
`define CHECK_H(X, T) if(rdata == X) $display("Test %0d: passed", T); else $display("Test %0d: FAILED", T);
`define CHECK_B(X, T)  if(rdata == X) $display("Test %0d: passed", T); else $display("Test %0d: FAILED", T);


`include "includes/primitives.v"
`include "includes/sky130_hd.v"


`include "designs/AHB_SRAM/sram32.v"

module AHB_SRAM_TB;
    localparam SRAM_AW = 10;

    reg  HCLK;
    reg  HRESETn;

    wire                    HREADY; 
    reg                     HWRITE;
    reg  [2:0]              HSIZE;
    reg  [1:0]              HTRANS;
    reg  [31:0]             HADDR, HWDATA;
    wire [31:0]             HRDATA; 

    wire [31:0]             SRAMRDATA;  // SRAM Read Data
    wire [3:0]              SRAMWEN;    // SRAM write enable (active high)
    wire [31:0]             SRAMWDATA;  // SRAM write data
    wire                    SRAMCS;     // SRAM Chip Select (active high)
    wire [SRAM_AW-1:0]      SRAMADDR;    // SRAM address
        
    always #5 HCLK = !HCLK;

    initial begin
        $dumpfile("ahb_srm_tb.vcd");
        $dumpvars;
    //$monitor("rdata=0x%0h",rdata);

        # 45_000_000 $finish;
    end

    // RESET
    initial begin
        HCLK = 0;
        HRESETn = 1;
		#10;
		@(posedge HCLK);
		HRESETn = 0;
		#100;
		@(posedge HCLK);
		HRESETn = 1;
    end
    

    AHB_SRAM #( .AW(SRAM_AW+2) ) MUV ( 
        .HCLK(HCLK),
        .HRESETn(HRESETn),
    
        // AHB-Lite Slave Interface
        .HSEL(1'b1),
        .HREADYOUT(HREADY),
        .HREADY(HREADY),
        .HWDATA(HWDATA),
        .HRDATA(HRDATA),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HTRANS(HTRANS),
        .HADDR(HADDR),

        .SRAMRDATA(SRAMRDATA),
        .SRAMWEN(SRAMWEN),  
        .SRAMWDATA(SRAMWDATA),
        .SRAMCS(SRAMCS),   
        .SRAMADDR(SRAMADDR) 
);   


sram32 #( .AW(SRAM_AW), .VERBOSE(0) ) SRAM (
    .clk(HCLK),
    .cs(SRAMCS),
    .we(SRAMWEN),
    .A(SRAMADDR),
    .Di(SRAMWDATA),
    .Do(SRAMRDATA)
);

`include "includes/AHB_tasks.vh"

// test case
reg [31:0] rdata;
initial begin
    @(posedge HRESETn);
    #200;
    AHB_WRITE_WORD(32'h0000_0000, 32'h44_33_22_11);
    #25;
    AHB_READ_WORD(32'h0000_0000, rdata);
    #25;
    `CHECK_W(32'h44_33_22_11, 1);
    #25;
    AHB_READ_HALF(32'h0000_0000, rdata);
    #25;
    `CHECK_H(16'h22_11, 2);
    #25;
    AHB_READ_BYTE(32'h0000_0000, rdata);
    #25;
    `CHECK_B(8'h11, 3);
    #25;
    AHB_WRITE_WORD(32'h000F_FFF0, 32'hABCD_1234);
    #25;
    AHB_READ_WORD(32'h000F_FFF0, rdata);
    #25;
    `CHECK_W(32'hABCD_1234, 4);
    #100;
    // Read after write
    AHB_WRITE_READ_WORD(32'h0000_0A00, 32'h0000_0000, 32'hDEADBEEF, rdata);
    #100;
    AHB_READ_WORD(32'h0000_0A00, rdata);
    #25;
    `CHECK_W(32'hDEADBEEF, 5);
    $finish;
end

endmodule

