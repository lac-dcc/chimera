//  mini.v
// driver for mini-Edsac simulation
//
// Loosely based on the Lattice code for the IrDA programs
//
module mini (
            input clk_in,
            input RX , 
            output TX,
`ifdef SRAM
	    output [18:0] SRAM_ADR,
	    inout [15:0]  SRAM_DAT,
	    output 	  SRAM_OE,
	    output 	  SRAM_WE,
	    output        SRAM_CS,
`endif
            output [11:0] leds,
            input BUT0
         );

   reg [2:0] clock_div;
   always @ (posedge clk_in)
      clock_div <= clock_div + 2'd1;
   wire clock;
   assign clock = ~clock_div[2];
   assign leds[11:10] = 2'b00;

// parameters (constants)
   reg [15:0] reset_ct;
   parameter CLKDIV = (12_500_000) / 230400;

   reg rst_n = 0;
   reg i_rst = 1;

   always @ (posedge clk_in)
   begin
      reset_ct <= reset_ct + 16'd1;
      if (reset_ct[7])
         i_rst <= 1'b0;
   end /* reset counting */

   wire [7:0]  rx_data       ; 
   wire        rx_strobe     ;

   wire [7:0]  tx_data       ;
   wire        tx_start      ;
   wire        tx_busy       ;

   wire [15:0] memrdata;
   wire [15:0] memwdata;
   wire [9:0]  memaddr;
   wire        memrd, memwr, memwait;

   initial begin
     reset_ct = 0;
      clock_div = 0;
   end

// UART instantiation
uartrx #(.CLKDIV(CLKDIV)) urx (                   
      .clk    ( clock    ),
      .rst    ( i_rst     ),
      .rx     ( RX        ), // signal from PC
      .q      ( rx_data   ), // byte of data from PC
      .strobe ( rx_strobe ),   // true briefly when data has arrived
      .leds   ( leds[9:8])    // debug output
   );

uarttx #(.CLKDIV(CLKDIV)) utx (                   
      .clk    ( clock    ),
      .rst    ( i_rst     ),
      .tx     ( TX        ), // signal to PC
      .d      ( tx_data   ), // data to the PC
      .strobe ( tx_start  ), // trigger send
      .busy   ( tx_busy   ), // tx data in transit
      .leds   ( leds[7:6] )
    );

// CPU instatiation
CPU cpu1 (
	  .clock(clock),
	  .reset(i_rst),
	  .rx_data_in(rx_data),
	  .rx_strobe(rx_strobe),
	  .tx_data(tx_data),
	  .tx_start(tx_start),
	  .tx_busy(tx_busy),
	  .Addr(memaddr),
	  .memwdata(memwdata),
	  .memrdata(memrdata),
	  .memrd(memrd),
	  .memwr(memwr),
	  .memwait(memwait),
	  .leds(leds[5:0]),
	  .but0(BUT0)
	  );

Mem mem1 (
	  .clock(clock),
	  .reset(i_rst),
	  .addr(memaddr),
	  .d(memwdata),
	  .q(memrdata),
	  .rd(memrd),
	  .wr(memwr),
`ifdef SRAM
	  .rama(SRAM_ADR),
	  .ramd(SRAM_DAT),
	  .ramcs(SRAM_CS),
	  .ramoe(SRAM_OE),
	  .ramwe(SRAM_WE),
`endif
	  .mwait(memwait)
	  );

endmodule





