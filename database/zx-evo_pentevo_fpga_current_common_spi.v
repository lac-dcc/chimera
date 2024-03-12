
`include "tune.v"

module spi
(
  // SPI wires
  input  wire       clk,      // system clock
  output wire       sck,      // SCK
  output reg        sdo,      // MOSI
  input  wire       sdi,      // MISO
  input  wire       mode,     // 0 - CPHA=0, CPOL=0 / 1 - CPHA=1, CPOL=0

  // DMA interface
  input  wire       dma_req,
  input  wire [7:0] dma_din,

  // Z80 interface
  input  wire       cpu_req,
  input  wire [7:0] cpu_din,

  // output
  output wire       start,    // start strobe, 1 clock length
  output reg  [7:0] dout
);

  reg [4:0] counter = 5'b10000;
  reg [7:0] shift = 0;
  reg busy_r;

  wire busy = !counter[4];
  wire req = cpu_req || dma_req;

  assign sck = counter[0];
  assign start = req && !busy;
  wire [7:0] din = dma_req ? dma_din : cpu_din;
  
  wire cpha = mode;
  
  always @(posedge clk)
  begin
    busy_r <= busy;

    if (start)
    begin
      counter <= 5'b0;
      sdo <= din[7];
      shift[7:1] <= din[6:0];
    end
    else
    begin
      if (!counter[4])
        counter <= counter + 5'd1;
        
      if (cpha ? busy_r : busy)
      begin
        // shift in
        if (cpha ? sck : !sck)
        begin
          shift[0] <= sdi;
  
          if (&counter[3:1])
            dout <= {shift[7:1], sdi};
        end
  
        // shift out
        if (cpha ? !sck : sck)
        begin
          sdo <= shift[7];
          shift[7:1] <= shift[6:0]; // last bit remains after end of exchange
        end
      end
    end
  end
endmodule
