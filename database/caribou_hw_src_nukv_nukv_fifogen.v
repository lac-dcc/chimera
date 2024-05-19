// This program was cloned from: https://github.com/fpgasystems/caribou
// License: GNU General Public License v3.0

//---------------------------------------------------------------------------
//--  Copyright 2015 - 2017 Systems Group, ETH Zurich
//-- 
//--  This hardware module is free software: you can redistribute it and/or
//--  modify it under the terms of the GNU General Public License as published
//--  by the Free Software Foundation, either version 3 of the License, or
//--  (at your option) any later version.
//-- 
//--  This program is distributed in the hope that it will be useful,
//--  but WITHOUT ANY WARRANTY; without even the implied warranty of
//--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//--  GNU General Public License for more details.
//-- 
//--  You should have received a copy of the GNU General Public License
//--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------


module nukv_fifogen #(
    parameter ADDR_BITS=5,      // number of bits of address bus
    parameter DATA_SIZE=16     // number of bits of data bus
) 
(
  // Clock
  input wire         clk,
  input wire         rst,

  input  wire [DATA_SIZE-1:0] s_axis_tdata,
  input  wire         s_axis_tvalid,
  output wire         s_axis_tready,
  output wire         s_axis_talmostfull,


  output wire [DATA_SIZE-1:0] m_axis_tdata,
  output wire        m_axis_tvalid,
  input  wire         m_axis_tready
);

wire[(DATA_SIZE+72):0] in_data;
assign in_data[DATA_SIZE-1:0] = {72'b0, s_axis_tdata[DATA_SIZE-1:0]};

reg [1:0] waiter = 0;
wire rd_ok;
assign rd_ok = waiter == 2 ? 1 : 0;

always @(posedge clk) begin 
  if(rst) begin
     waiter <= 0;
  end else begin
    if (waiter<2) begin
      waiter <= waiter+1;
    end
  end
end

genvar x;
generate 
  if (ADDR_BITS<=9) begin

    wire[(DATA_SIZE+71)/72-1:0] in_full;
    wire[(DATA_SIZE+71)/72-1:0] in_almost_full;

    wire[(DATA_SIZE+71)/72-1:0] out_empty;
    wire[(DATA_SIZE+71)/72-1:0] out_almost_empty;
    wire[(DATA_SIZE+71):0] out_data;
    assign m_axis_tdata[DATA_SIZE-1:0] = out_data[DATA_SIZE-1:0];

    assign s_axis_tready = ~rst & (in_almost_full!=0 ? 0 :1);
    assign s_axis_talmostfull = in_almost_full==0 ? 0 :1;

    assign m_axis_tvalid = out_empty==0 ? 1 : 0;


    for (x=0; x<(DATA_SIZE+71)/72; x=x+1) begin

         FIFO36E1 #(
            .ALMOST_EMPTY_OFFSET(13'h0080),    // Sets the almost empty threshold
            .ALMOST_FULL_OFFSET(2**ADDR_BITS-8),     // Sets almost full threshold
            .DATA_WIDTH(72),                    // Sets data width to 4-72
            .DO_REG(1),                        // Enable output register (1-0) Must be 1 if EN_SYN = FALSE
            .EN_ECC_READ("FALSE"),             // Enable ECC decoder, FALSE, TRUE
            .EN_ECC_WRITE("FALSE"),            // Enable ECC encoder, FALSE, TRUE
            .EN_SYN("FALSE"),                  // Specifies FIFO as Asynchronous (FALSE) or Synchronous (TRUE)
            .FIFO_MODE("FIFO36_72"),              // Sets mode to "FIFO36" or "FIFO36_72" 
            .FIRST_WORD_FALL_THROUGH("TRUE"), // Sets the FIFO FWFT to FALSE, TRUE
            .INIT(72'h000000000000000000),     // Initial values on output port
            .SIM_DEVICE("7SERIES"),            // Must be set to "7SERIES" for simulation behavior
            .SRVAL(72'h000000000000000000)     // Set/Reset value for output port
         )
         FIFO36E1_inst (
            // ECC Signals: 1-bit (each) output: Error Correction Circuitry ports
            .DBITERR(),             // 1-bit output: Double bit error status
            .ECCPARITY(),         // 8-bit output: Generated error correction parity
            .SBITERR(),             // 1-bit output: Single bit error status
            // Read Data: 64-bit (each) output: Read output data
            .DO(out_data[x*72 +: 64]),                       // 64-bit output: Data output
            .DOP(out_data[x*72+64 +: 8]),                     // 8-bit output: Parity data output
            // Status: 1-bit (each) output: Flags and other FIFO status outputs
            .ALMOSTEMPTY(out_almost_empty[x]),     // 1-bit output: Almost empty flag
            .ALMOSTFULL(in_almost_full[x]),       // 1-bit output: Almost full flag
            .EMPTY(out_empty[x]),                 // 1-bit output: Empty flag
            .FULL(in_full[x]),                   // 1-bit output: Full flag
            .RDCOUNT(),             // 13-bit output: Read count
            .RDERR(),                 // 1-bit output: Read error
            .WRCOUNT(),             // 13-bit output: Write count
            .WRERR(),                 // 1-bit output: Write error
            // ECC Signals: 1-bit (each) input: Error Correction Circuitry ports
            .INJECTDBITERR(), // 1-bit input: Inject a double bit error input
            .INJECTSBITERR(),
            // Read Control Signals: 1-bit (each) input: Read clock, enable and reset input signals
            .RDCLK(clk),                 // 1-bit input: Read clock
            .RDEN(m_axis_tready & rd_ok),                   // 1-bit input: Read enable
            .REGCE(1'b1),                 // 1-bit input: Clock enable
            .RST(rst),                     // 1-bit input: Reset
            .RSTREG(rst),               // 1-bit input: Output register set/reset
            // Write Control Signals: 1-bit (each) input: Write clock and enable input signals
            .WRCLK(clk),                 // 1-bit input: Rising edge write clock.
            .WREN(s_axis_tvalid & rd_ok & ~in_almost_full[x]),                   // 1-bit input: Write enable
            // Write Data: 64-bit (each) input: Write input data
            .DI(in_data[x*72 +: 64]),                       // 64-bit input: Data input
            .DIP(in_data[x*72+64 +: 8])                      // 8-bit input: Parity input
         );
    end


 end else if (ADDR_BITS<=10) begin


    wire[(DATA_SIZE+35)/36-1:0] in_full;
    wire[(DATA_SIZE+35)/36-1:0] in_almost_full;

    wire[(DATA_SIZE+35)/36-1:0] out_empty;
    wire[(DATA_SIZE+35)/36-1:0] out_almost_empty;
    wire[(DATA_SIZE+35):0] out_data;
    assign m_axis_tdata[DATA_SIZE-1:0] = out_data[DATA_SIZE-1:0];

    assign s_axis_tready = ~rst & (in_almost_full!=0 ? 0 : 1);
    assign s_axis_talmostfull = in_almost_full==0 ? 0 :1;

    assign m_axis_tvalid = out_empty==0 ? 1 : 0;

    for (x=0; x<(DATA_SIZE+35)/36; x=x+1) begin

         FIFO36E1 #(
            .ALMOST_EMPTY_OFFSET(13'h0080),    // Sets the almost empty threshold
            .ALMOST_FULL_OFFSET(2**ADDR_BITS-8),     // Sets almost full threshold
            .DATA_WIDTH(36),                    // Sets data width to 4-36
            .DO_REG(1),                        // Enable output register (1-0) Must be 1 if EN_SYN = FALSE
            .EN_ECC_READ("FALSE"),             // Enable ECC decoder, FALSE, TRUE
            .EN_ECC_WRITE("FALSE"),            // Enable ECC encoder, FALSE, TRUE
            .EN_SYN("FALSE"),                  // Specifies FIFO as Asynchronous (FALSE) or Synchronous (TRUE)
            .FIFO_MODE("FIFO36"),              // Sets mode to "FIFO36" or "FIFO36_36" 
            .FIRST_WORD_FALL_THROUGH("TRUE"), // Sets the FIFO FWFT to FALSE, TRUE
            .INIT(36'h000000000000000000),     // Initial values on output port
            .SIM_DEVICE("7SERIES"),            // Must be set to "7SERIES" for simulation behavior
            .SRVAL(36'h000000000000000000)     // Set/Reset value for output port
         )
         FIFO36E1_inst (
            // ECC Signals: 1-bit (each) output: Error Correction Circuitry ports
            .DBITERR(),             // 1-bit output: Double bit error status
            .ECCPARITY(),         // 8-bit output: Generated error correction parity
            .SBITERR(),             // 1-bit output: Single bit error status
            // Read Data: 64-bit (each) output: Read output data
            .DO(out_data[x*36 +: 32]),                       // 64-bit output: Data output
            .DOP(out_data[x*36+32 +: 4]),                     // 8-bit output: Parity data output
            // Status: 1-bit (each) output: Flags and other FIFO status outputs
            .ALMOSTEMPTY(out_almost_empty[x]),     // 1-bit output: Almost empty flag
            .ALMOSTFULL(in_almost_full[x]),       // 1-bit output: Almost full flag
            .EMPTY(out_empty[x]),                 // 1-bit output: Empty flag
            .FULL(in_full[x]),                   // 1-bit output: Full flag
            .RDCOUNT(),             // 13-bit output: Read count
            .RDERR(),                 // 1-bit output: Read error
            .WRCOUNT(),             // 13-bit output: Write count
            .WRERR(),                 // 1-bit output: Write error
            // ECC Signals: 1-bit (each) input: Error Correction Circuitry ports
            .INJECTDBITERR(), // 1-bit input: Inject a double bit error input
            .INJECTSBITERR(),
            // Read Control Signals: 1-bit (each) input: Read clock, enable and reset input signals
            .RDCLK(clk),                 // 1-bit input: Read clock
            .RDEN(m_axis_tready & rd_ok),                   // 1-bit input: Read enable
            .REGCE(1'b1),                 // 1-bit input: Clock enable
            .RST(rst),                     // 1-bit input: Reset
            .RSTREG(rst),               // 1-bit input: Output register set/reset
            // Write Control Signals: 1-bit (each) input: Write clock and enable input signals
            .WRCLK(clk),                 // 1-bit input: Rising edge write clock.
            .WREN(s_axis_tvalid & rd_ok & ~in_almost_full[x]),                   // 1-bit input: Write enable
            // Write Data: 64-bit (each) input: Write input data
            .DI(in_data[x*36 +: 32]),                       // 64-bit input: Data input
            .DIP(in_data[x*36+32 +: 4])                      // 8-bit input: Parity input
         );
    end


 end else if (ADDR_BITS<=11) begin


    wire[(DATA_SIZE+17)/18-1:0] in_full;
    wire[(DATA_SIZE+17)/18-1:0] in_almost_full;

    wire[(DATA_SIZE+17)/18-1:0] out_empty;
    wire[(DATA_SIZE+17)/18-1:0] out_almost_empty;
    wire[(DATA_SIZE+17):0] out_data;
    assign m_axis_tdata[DATA_SIZE-1:0] = out_data[DATA_SIZE-1:0];

    assign s_axis_tready = ~rst & (in_almost_full!=0 ? 0 : 1);
    assign s_axis_talmostfull = in_almost_full==0 ? 0 :1;

    assign m_axis_tvalid = out_empty==0 ? 1 : 0;

    for (x=0; x<(DATA_SIZE+17)/18; x=x+1) begin

         FIFO36E1 #(
            .ALMOST_EMPTY_OFFSET(13'h0080),    // Sets the almost empty threshold
            .ALMOST_FULL_OFFSET(2**ADDR_BITS-8),     // Sets almost full threshold
            .DATA_WIDTH(18),                    // Sets data width to 4-18
            .DO_REG(1),                        // Enable output register (1-0) Must be 1 if EN_SYN = FALSE
            .EN_ECC_READ("FALSE"),             // Enable ECC decoder, FALSE, TRUE
            .EN_ECC_WRITE("FALSE"),            // Enable ECC encoder, FALSE, TRUE
            .EN_SYN("FALSE"),                  // Specifies FIFO as Asynchronous (FALSE) or Synchronous (TRUE)
            .FIFO_MODE("FIFO18"),              // Sets mode to "FIFO18" or "FIFO18_18" 
            .FIRST_WORD_FALL_THROUGH("TRUE"), // Sets the FIFO FWFT to FALSE, TRUE
            .INIT(18'h000000000000000000),     // Initial values on output port
            .SIM_DEVICE("7SERIES"),            // Must be set to "7SERIES" for simulation behavior
            .SRVAL(18'h000000000000000000)     // Set/Reset value for output port
         )
         FIFO36E1_inst (
            // ECC Signals: 1-bit (each) output: Error Correction Circuitry ports
            .DBITERR(),             // 1-bit output: Double bit error status
            .ECCPARITY(),         // 8-bit output: Generated error correction parity
            .SBITERR(),             // 1-bit output: Single bit error status
            // Read Data: 64-bit (each) output: Read output data
            .DO(out_data[x*18 +: 16]),                       // 64-bit output: Data output
            .DOP(out_data[x*18+16 +: 2]),                     // 8-bit output: Parity data output
            // Status: 1-bit (each) output: Flags and other FIFO status outputs
            .ALMOSTEMPTY(out_almost_empty[x]),     // 1-bit output: Almost empty flag
            .ALMOSTFULL(in_almost_full[x]),       // 1-bit output: Almost full flag
            .EMPTY(out_empty[x]),                 // 1-bit output: Empty flag
            .FULL(in_full[x]),                   // 1-bit output: Full flag
            .RDCOUNT(),             // 13-bit output: Read count
            .RDERR(),                 // 1-bit output: Read error
            .WRCOUNT(),             // 13-bit output: Write count
            .WRERR(),                 // 1-bit output: Write error
            // ECC Signals: 1-bit (each) input: Error Correction Circuitry ports
            .INJECTDBITERR(), // 1-bit input: Inject a double bit error input
            .INJECTSBITERR(),
            // Read Control Signals: 1-bit (each) input: Read clock, enable and reset input signals
            .RDCLK(clk),                 // 1-bit input: Read clock
            .RDEN(m_axis_tready & rd_ok),                   // 1-bit input: Read enable
            .REGCE(1'b1),                 // 1-bit input: Clock enable
            .RST(rst),                     // 1-bit input: Reset
            .RSTREG(rst),               // 1-bit input: Output register set/reset
            // Write Control Signals: 1-bit (each) input: Write clock and enable input signals
            .WRCLK(clk),                 // 1-bit input: Rising edge write clock.
            .WREN(s_axis_tvalid & rd_ok & ~in_almost_full[x]),                   // 1-bit input: Write enable
            // Write Data: 64-bit (each) input: Write input data
            .DI(in_data[x*18 +: 16]),                       // 64-bit input: Data input
            .DIP(in_data[x*18+16 +: 2])                      // 8-bit input: Parity input
         );
    end



 end
endgenerate

endmodule


