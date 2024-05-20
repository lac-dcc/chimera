// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//========================================================================
// Verilog Components: SRAMs
//========================================================================

`ifndef CMN_SRAMS_V
`define CMN_SRAMS_V

`include "cmn/assert.v"

//------------------------------------------------------------------------
// 1rw Combinational Bit-level SRAM
//------------------------------------------------------------------------

module cmn_CombinationalBitSRAM_1rw #(
  parameter p_data_nbits  = 1,
  parameter p_num_entries = 2,

  // Local constants not meant to be set from outside the module
  parameter c_addr_nbits = $clog2(p_num_entries)
) (
  input logic clk,
  input logic reset,

  // Read port (combinational read)

  input  logic                    read_en,
  input  logic [c_addr_nbits-1:0] read_addr,
  output logic [p_data_nbits-1:0] read_data,

  // Write port (sampled on the rising clock edge)

  input logic                    write_en,
  input logic [c_addr_nbits-1:0] write_addr,
  input logic [p_data_nbits-1:0] write_data
);

  logic [p_data_nbits-1:0] mem[p_num_entries-1:0];

  // Combinational read. We ensure the read data is all X's if we are
  // doing a write because we are modeling an SRAM with a single
  // read/write port (i.e., not a dual ported SRAM). We also ensure the
  // read data is all X's if the read is not enable at all to avoid
  // (potentially) incorrectly assuming the SRAM latches the read data.

  /* verilator lint_off WIDTH */

  always_comb begin
    if (read_en) read_data = mem[read_addr];
    else read_data = 'hx;
  end

  /* verilator lint_on WIDTH */

  always_ff @(posedge clk) begin
    if (write_en) mem[write_addr] = write_data;
  end

  // Assertions

  /*
  always_ff @( posedge clk ) begin
    if ( !reset ) begin
      `CMN_ASSERT_NOT_X( read_en );
      `CMN_ASSERT_NOT_X( write_en );

      // There is only one port. You can only do a read OR a write.

      `CMN_ASSERT( !(read_en && write_en) );

      // If write_en is one, then write address better be less than the
      // number of entries and definitely cannot be X's. Write byte
      // enables also cannot be X.

      if ( write_en ) begin
        `CMN_ASSERT_NOT_X( write_addr );
        `CMN_ASSERT_NOT_X( write_byte_en );
        `CMN_ASSERT( write_addr < p_num_entries );
      end

    end
  end
  */

endmodule

//------------------------------------------------------------------------
// 1rw Combinational SRAM
//------------------------------------------------------------------------

module cmn_CombinationalSRAM_1rw #(
  parameter p_data_nbits  = 1,
  parameter p_num_entries = 2,

  // Local constants not meant to be set from outside the module
  parameter c_addr_nbits  = $clog2(p_num_entries),
  parameter c_data_nbytes = (p_data_nbits + 7) / 8  // $ceil(p_data_nbits/8)
) (
  input logic clk,
  input logic reset,

  // Read port (combinational read)

  input  logic                    read_en,
  input  logic [c_addr_nbits-1:0] read_addr,
  output logic [p_data_nbits-1:0] read_data,

  // Write port (sampled on the rising clock edge)

  input logic                     write_en,
  input logic [c_data_nbytes-1:0] write_byte_en,
  input logic [ c_addr_nbits-1:0] write_addr,
  input logic [ p_data_nbits-1:0] write_data
);

  logic [p_data_nbits-1:0] mem[p_num_entries-1:0];

  // Combinational read. We ensure the read data is all X's if we are
  // doing a write because we are modeling an SRAM with a single
  // read/write port (i.e., not a dual ported SRAM). We also ensure the
  // read data is all X's if the read is not enable at all to avoid
  // (potentially) incorrectly assuming the SRAM latches the read data.

  /* verilator lint_off WIDTH */

  always_comb begin
    if (read_en) read_data = mem[read_addr];
    else read_data = 'hx;
  end

  /* verilator lint_on WIDTH */

  // Inspired by http://www.xilinx.com/support/documentation/sw_manuals/xilinx11/xst.pdf, page 159

  genvar i;
  generate
    for (i = 0; i < c_data_nbytes; i = i + 1) begin : test
      always_ff @(posedge clk) begin
        if (write_en && write_byte_en[i])
          mem[write_addr][(i+1)*8-1 : i*8] <= write_data[(i+1)*8-1 : i*8];
      end
    end
  endgenerate

  // Assertions

  /*
  always_ff @( posedge clk ) begin
    if ( !reset ) begin
      `CMN_ASSERT_NOT_X( read_en );
      `CMN_ASSERT_NOT_X( write_en );

      // There is only one port. You can only do a read OR a write.

      `CMN_ASSERT( !(read_en && write_en) );

      // If write_en is one, then write address better be less than the
      // number of entries and definitely cannot be X's. Write byte
      // enables also cannot be X.

      if ( write_en ) begin
        `CMN_ASSERT_NOT_X( write_addr );
        `CMN_ASSERT_NOT_X( write_byte_en );
        `CMN_ASSERT( write_addr < p_num_entries );
      end

    end
  end
  */

endmodule

//------------------------------------------------------------------------
// 1rw Synchronous SRAM
//------------------------------------------------------------------------

module cmn_SynchronousSRAM_1rw #(
  parameter p_data_nbits  = 1,
  parameter p_num_entries = 2,

  // Local constants not meant to be set from outside the module
  parameter c_addr_nbits  = $clog2(p_num_entries),
  parameter c_data_nbytes = (p_data_nbits + 7) / 8  // $ceil(p_data_nbits/8)
) (
  input logic clk,
  input logic reset,

  // Read port (synchronous read)

  input  logic                    read_en,
  input  logic [c_addr_nbits-1:0] read_addr,
  output logic [p_data_nbits-1:0] read_data,

  // Write port (sampled on the rising clock edge)

  input logic                     write_en,
  input logic [c_data_nbytes-1:0] write_byte_en,
  input logic [ c_addr_nbits-1:0] write_addr,
  input logic [ p_data_nbits-1:0] write_data
);

  logic [p_data_nbits-1:0] mem[p_num_entries-1:0];

  // Combinational read. We ensure the read data is all X's if we are
  // doing a write because we are modeling an SRAM with a single
  // read/write port (i.e., not a dual ported SRAM). We also ensure the
  // read data is all X's if the read is not enable at all to avoid
  // (potentially) incorrectly assuming the SRAM latches the read data.

  always_ff @(posedge clk) begin
    if (read_en) read_data <= mem[read_addr];
    else read_data <= 'hx;
  end

  // Inspired by http://www.xilinx.com/support/documentation/sw_manuals/xilinx11/xst.pdf, page 159

  genvar i;
  generate
    for (i = 0; i < c_data_nbytes; i = i + 1) begin : test
      always_ff @(posedge clk) begin
        if (write_en && write_byte_en[i])
          mem[write_addr][(i+1)*8-1 : i*8] <= write_data[(i+1)*8-1 : i*8];
      end
    end
  endgenerate

  // Assertions

  /*
  always_ff @( posedge clk ) begin
    if ( !reset ) begin
      `CMN_ASSERT_NOT_X( read_en );
      `CMN_ASSERT_NOT_X( write_en );

      // There is only one port. You can only do a read OR a write.

      `CMN_ASSERT( !(read_en && write_en) );

      // If write_en is one, then write address better be less than the
      // number of entries and definitely cannot be X's. Write byte
      // enables also cannot be X.

      if ( write_en ) begin
        `CMN_ASSERT_NOT_X( write_addr );
        `CMN_ASSERT_NOT_X( write_byte_en );
        `CMN_ASSERT( write_addr < p_num_entries );
      end

    end
  end
  */

endmodule

`endif  /* CMN_SRAMS_V */

