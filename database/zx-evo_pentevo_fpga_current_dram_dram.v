`include "tune.v"

// PentEvo project (c) NedoPC 2008-2009
//
// DRAM controller. performs accesses to DRAM.
//
// rucas_n, rlcas_n, rras0_n, rras1_n, rwe_n, dram_ra[] could be made 'fast output register'
// rst_n is resynced before use and acts as req inhibit. so while in reset, dram regenerates and isn't corrupted

module dram
(
  input  wire        clk,
  input  wire        c0, c1, c2, c3,
  input  wire        rst_n,  // shut down accesses, retain refresh

  input  wire        req,    // request for read/write cycle
  input  wire [20:0] addr,   // access address of 16bit word:
                             //   addr[0] selects between rras0_n and rras1_n
                             //   addr[20:11] - column
                             //   addr[10:1]  - row address
  // output reg [15:0] rddata,  // data just read
  input  wire [15:0] wrdata, // data to be written
  input  wire [1:0]  bsel,   // positive byte select for write:
                             //   bsel[0] - wrdata[7:0]
                             //   bsel[1] - wrdata[15:8]
  input  wire        rnw,    // read/~write

// DRAM pins
  output reg [9:0]   ra,
  output reg [15:0]  dram_wd,
  output reg         rwe_n,
  output reg         rucas_n,
  output reg         rlcas_n,
  output reg         rras0_n,
  output reg         rras1_n
);

  reg [1:0] rst_sync = 0;
  wire int_req = req && !rst_sync[1];

  reg [1:0] state = 2'b0;

  // next cycle decision
  localparam RFSH = 2'b00;  // Don't change these
  localparam RD   = 2'b01;  // because there are
  localparam WR   = 2'b10;  // bit dependencies

  wire idle = ~|state;
  wire read = state[0];
  wire write = state[1];

  always @(posedge clk) if (c3)
    state <= int_req ? (rnw ? RD : WR) : RFSH;

  // incoming data latch
  always @(posedge clk) if (c0)      // changed: now wrdata is latched 1 clk later - at c0 of current cycle (NOT at c3 of previous as before)
    dram_wd <= wrdata;

  // incoming addr and bsel latch
  reg [20:0] int_addr;
  reg [1:0] int_bsel;
  always @(posedge clk) if (c3)
  begin
    int_bsel   <= bsel;
    int_addr   <= addr;
  end

  // WE control
  always @(posedge clk) if (c0)      // changed: now wrdata is latched 1 clk later - at c0 of current cycle (NOT at c3 of previous as before)
    rwe_n <= !write;

  // RAS/CAS sequencing
  reg rfsh_alt = 0;   // we must alternate chips in refresh cycles to lower total heating
  always @(posedge clk)
  begin
    if (c0)
      if (idle)
      begin
        rlcas_n <= 1'b0;
        rucas_n <= 1'b0;
      end
      else
      begin
        rras0_n <= int_addr[0];
        rras1_n <= ~int_addr[0];
      end

    if (c1)
      if (idle)
      begin
        rras0_n <=  rfsh_alt;
        rras1_n <= ~rfsh_alt;
        rfsh_alt <= ~rfsh_alt;
      end
      else
      begin
        rlcas_n <= write ? ~int_bsel[0] : 1'b0;
        rucas_n <= write ? ~int_bsel[1] : 1'b0;
      end

    if (c2)
      if (idle)
      begin
        rlcas_n <= 1'b1;
        rucas_n <= 1'b1;
      end
      else
      begin
        rras0_n <= 1'b1;
        rras1_n <= 1'b1;
      end

    if (c3)
    begin
      rras0_n <= 1'b1;
      rras1_n <= 1'b1;
      rucas_n <= 1'b1;
      rlcas_n <= 1'b1;
    end
  end

  // row/column address multiplexing
  always @(negedge clk)    // here is a problem: fit fast output regs to the pins
    ra <= c0 ? int_addr[10:1] : int_addr[20:11];

// read data from DRAM
  // always @(posedge clk)
    // if (c2 & read)
      // rddata <= dram_rd;

  // reset must be synchronous here in order to preserve
  // DRAM state while other modules reset, but we have only
  // asynchronous one globally. so we must re-synchronize it
  // and use it as 'DRAM operation enable'. when in reset,
  // controller ignores req signal and generates only refresh cycles
  always @(posedge clk)
    rst_sync[1:0] <= { rst_sync[0], ~rst_n };

endmodule
