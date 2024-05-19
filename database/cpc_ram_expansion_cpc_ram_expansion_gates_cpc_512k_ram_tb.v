// This program was cloned from: https://github.com/revaldinho/cpc_ram_expansion
// License: GNU General Public License v3.0

`timescale 1ns / 1ns



module cpc_512k_ram_tb();
  reg [15:0] 	addr_r;
  reg [7:0]     data_r;
  reg        	mreqb_r;
  reg        	ioreqb_r;
  reg        	web_r;
  reg        	rdb_r;
  reg        	ramrdb_r;
  reg        	clk_r;
  reg        	resetb_r;
  
  reg [7:0]     readback_r;
  
  // Declare wires to match the netlist (no busses in netlister.py)
  
  
  // -----------------------------------------------------
  // vv Paste netlister declarations and gates in here vv
  wire    Sound;  
  wire    A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0 ;
  wire    D7,D6,D5,D4,D3,D2,D1,D0 ;
  wire    MREQ_B;  
  wire    M1_B;
  wire    RFSH_B;
  wire    IOREQ_B;
  wire    RD_B;
  wire    WR_B;
  wire    HALT_B;
  wire    INT_B ;
  wire    NMI_B ;
  wire    BUSRQ_B;  
  wire    BUSACK_B;
  wire    READY;
  wire    BUSRESET_B;
  wire    RESET_B;
  wire    ROMEN_B;
  wire    ROMDIS ;
  wire    RAMRD_B;
  wire    RAMDIS;
  wire    CURSOR;
  wire    LPEN;
  wire    EXP_B;
  wire    CLK;
  wire    ramadrhi4,ramadrhi3,ramadrhi2,ramadrhi1,ramadrhi0;
  wire    ramblock_q2,ramblock_q1,ramblock_q0;
  wire    ramcs_b, extram_b;
  wire    clkenb_lat_q, wclk, n14;  
  wire    n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28; 
  wire    n29, nn1;

  supply1 VDD;
  supply0 VSS;  

  assign    MREQ_B  = mreqb_r;
  assign    IOREQ_B = ioreqb_r;
  assign    WR_B    = web_r;
  assign    RD_B    = rdb_r;
  assign    RAMRD_B = ramrdb_r;
  assign    CLK     = clk_r;
  assign    RESET_B = resetb_r;


  // -----------------------------------------------------


  // Quad OR2 74HCT32
  SN7432 U0 (
             .i0_0(ramblock_q0), .i0_1(ramblock_q1), .o0(n24),
             .i1_0(extram_b), .i1_1(MREQ_B), .o1(ramcs_b),
             .i2_0(A15), .i2_1(WR_B), .o2(nn1),
             .i3_0(VDD), .i3_1(VDD), .o3(),             // Unused
             .vdd(VDD), .vss(VSS));

  // Dual NOR2 74HCT02
  SN7402 U1 (
             .i0_0(nn1), .i0_1(IOREQ_B), .o0(n15),
             .i1_0(ramblock_q0), .i1_1(ramblock_q0), .o1(n17),
             .i2_0(A15), .i2_1(A15), .o2(n21),                
             .i3_0(CLK), .i3_1(clkenb_lat_q), .o3(wclk_b), 
             .vdd(VDD), .vss(VSS));

  // Triple NAND3 74HCT10
  SN7410 U2 (
             .i0_0(D6), .i0_1(D7), .i0_2(n15), .o0(n14),
             .i1_0(A14), .i1_1(ramblock_q1), .i1_2(n27), .o1(n16),
             .i2_0(ramblock_q2), .i2_1(ramblock_q2), .i2_2(ramblock_q2), .o2(n27),
             .vdd(VDD), .vss(VSS));               

  // Quad NAND2 74HCT00
  SN7400 U3 (
             .i0_0(n17), .i0_1(n16), .o0(ramadrhi0),
             .i1_0(n20), .i1_1(n19), .o1(ramadrhi1),             
             .i2_0(A14), .i2_1(n21), .o2(n22),
             .i3_0(A14), .i3_1(A15), .o3(n23),
             .vdd(VDD), .vss(VSS));             
              
  // Quad NAND2 74HCT00
  SN7400 U4 (
             .i0_0(n27), .i0_1(ramblock_q0), .o0(n20),
             .i1_0(ramblock_q0), .i1_1(n23), .o1(n25),
             .i2_0(ramblock_q2), .i2_1(n22), .o2(n29),
             .i3_0(ramblock_q1), .i3_1(n18), .o3(n19),
             .vdd(VDD), .vss(VSS));                            
  // Quad NAND2 74HCT00
  SN7400 U5 (
             .i0_0(n25), .i0_1(n24), .o0(n26),
             .i1_0(n27), .i1_1(n26), .o1(n28),
             .i2_0(n29), .i2_1(n28), .o2(extram_b),
             .i3_0(n27), .i3_1(n21), .o3(n18),
             .vdd(VDD), .vss(VSS));                                             
  
  // Quad latch 74HCT75
  //
  // 'd' is active low so take output from q rather than qb in RTL
  SN7475 U6 ( .en01(CLK), 
              .d0(n14), .q0(clkenb_lat_q), .qb0(),
              .d1(VDD), .q1(), .qb1(),
              // Use second pair of latch as inverter!
              .en23(VDD), 
              .d2(extram_b), .q2(), .qb2(RAMDIS),
              .d3(VDD), .q3(), .qb3(),
              .vdd(VDD), .vss(VSS));               
  
  // Hex posedge triggered D-FF with clear*
  SN74174 U7 (
              .clock(wclk_b),
              .resetb(RESET_B),
              .d0(D0),
              .d1(D1),
              .d2(D2),
              .d3(D3),
              .d4(D4),
              .d5(D5),                            
              .q0(ramblock_q0),
              .q1(ramblock_q1),
              .q2(ramblock_q2),
              .q3(ramadrhi2),
              .q4(ramadrhi3),
              .q5(ramadrhi4),       
              .vdd(VDD), .vss(VSS));
  
  // Alliance 512K x 8 SRAM - address pins wired to suit layout
  bs62lv4006  SRAM (
                    .a18(ramadrhi4),  .vcc(VDD),
                    .a16(ramadrhi2),  .a15(ramadrhi1),
                    .a14(ramadrhi0),  .a17(ramadrhi3),
                    .a12(A5),  .web(WR_B),
                    .a7(A6),  .a13(A4),
                    .a6(A7),  .a8(A2),
                    .a5(A8),  .a9(A3),
                    .a4(A9),  .a11(A1),
                    .a3(A10),  .oeb(RAMRD_B),
                    .a2(A11),  .a10(A0),
                    .a1(A13),  .csb(ramcs_b),
                    .a0(A12),  .d7(D7),
                    .d0(D0),  .d6(D6),
                    .d1(D1),  .d5(D5),
                    .d2(D2),  .d4(D4),
                    .vss(VSS),  .d3(D3)
                    );
  
  
  // -----------------------------------------------------    
  
  
  assign    	{A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0} = addr_r;
  assign    	{D7,D6,D5,D4,D3,D2,D1,D0} = ( !web_r ) ? data_r : 8'bz;
  
  integer       bank;	// 32 banks
  integer       block;  //  4 blocks per bank
  integer 	i;

  integer       tests;
  integer       fails;  

  
`define PAGING_REG		16'h7FFF
`define TEST_ADR_OFFSET    	16'h0000


  
  task peek ;
    input  [15:0]   address;
    begin      
      @ (posedge clk_r) begin
        #30 addr_r = address;
      end
      @ (negedge clk_r) begin
        #30 mreqb_r = 1'b0;
        rdb_r = 1'b0;
        ramrdb_r = 1'b0;                
      end
      @ (posedge clk_r);
      @ (posedge clk_r);
      @ (negedge clk_r) begin
        readback_r = {D7,D6,D5,D4,D3,D2,D1,D0};
        #90 mreqb_r = 1'b1;
        rdb_r = 1'b1;
        ramrdb_r = 1'b1;                
      end
      $display("%g Peek Task with address: %4h returned data: %2h", $time, address, readback_r);
    end       
  endtask

  task poke ;
    input [15:0] address;
    input [7:0]  val;
    begin
      $display("%g Poke Task with address: %4h data: %2h", $time, address, val);
      @ (posedge  clk_r) begin
        #30 addr_r = address;
      end
      @ (negedge  clk_r) begin
        #50 mreqb_r = 1'b0;
      end
      @ (posedge clk_r)
        #30 data_r = val;
      @ (negedge clk_r)
        #20 web_r = 1'b0;            
      @ (posedge clk_r);
      @ (posedge clk_r);            
      @ (negedge clk_r) begin
        #70 mreqb_r = 1'b1;
        web_r = 1'b1;
      end
    end
  endtask
  
  task out ;
    input [15:0] address;
    input [7:0]  val;
    begin
      $display("%g OUT Task with address: %4h data: %2h", $time, address, val);
      @ (posedge clk_r) begin
        #30 addr_r = address;
      end
      @ (negedge clk_r) begin
        #30 ioreqb_r = 1'b0;
      end
      @ (posedge clk_r)
        #30 data_r = val;
      @ (negedge clk_r)
        #20 web_r = 1'b0;            
      @ (posedge clk_r);
      @ (posedge clk_r);            
      @ (negedge clk_r) begin 
        #10 ioreqb_r = 1'b1;
        #5  web_r = 1'b1;
      end
      @ (negedge clk_r);
    end
  endtask

  task log_result ;
    input [7:0] expected;
    input [7:0] actual;
    begin
      tests = tests + 1;      
      if (expected!==actual) begin
        fails = fails + 1;
        $display("Error - mismatch, expected %2h actual %2h", expected, actual);
      end
      else
        $display("Match expected %2h actual %2h", expected, actual);        
    end    
  endtask
      
    
  
  initial begin


    $dumpvars();

    tests = 0;
    fails = 0;    
    clk_r = 1'b0;
    resetb_r = 1'b0;
    ioreqb_r = 1'b1;
    mreqb_r = 1'b1;
    web_r = 1'b1;
    rdb_r = 1'b1;
    ramrdb_r = 1'b1;
    
    #300	resetb_r = 1'b1;
    
    $display("Testing access to all blocks in map mode 4: 16K at a time swapped into &4000-&7FFF range");        
    // Write to each page in turn with an index marker in map mode 4
    i=0;
    for (bank=0; bank< 8 ; bank=bank+1) begin
      for (block=0 ; block<4 ; block=block+1) begin
        @ (negedge  clk_r)  out( `PAGING_REG, (8'hC0 | (bank<<3) | 8'h04 | block));
        @ (negedge  clk_r)  poke( 16'h4000 + `TEST_ADR_OFFSET, i) ;
        i = i+1;
      end            
    end
    
    // Dummy write to what would be internal RAM
    @ (negedge  clk_r)  out( `PAGING_REG, (8'hC0 )) ;
    @ (negedge  clk_r)  poke( 16'h4000 + `TEST_ADR_OFFSET, 8'hFF) ;        
    
    // Read back all markers in map mode 4
    i=0;        
    for (bank=0; bank< 8 ; bank=bank+1) begin
      for (block=0 ; block<4 ; block=block+1) begin
        @ (negedge  clk_r)  out( `PAGING_REG, ( 8'hC0 | (bank<<3) | 8'h04 | block));
        @ (negedge  clk_r)  peek(16'h4000 + `TEST_ADR_OFFSET);
        log_result( i, readback_r);                
        i = i+1;
      end            
    end
    
    // Read back all markers in map mode 2 - block number determined by address top two bits
    $display("Testing access to all blocks in map mode 2: complete 64K Bank swapped in");
    i=0;        
    for (bank=0; bank< 8 ; bank=bank+1) begin
      @ (negedge  clk_r)  out( `PAGING_REG, ( 8'hC2 | (bank<<3)));      
      for ( block=0 ; block < 65536 ; block = block + 16384 ) begin
        @ (negedge  clk_r)  peek(block + `TEST_ADR_OFFSET);
        log_result( i, readback_r);        
        i = i+1;
      end            
    end
        
    #15000 if ( fails == 0 ) 
      $display("\nPASS - all %d comparisons match", tests);
    else
      $display("\nFAIL - %d of %d comparisons mismatch", fails, tests);
      
    $finish;

    
    
  end
  
  always 
    #125 clk_r = !clk_r;
  
  
  
endmodule
