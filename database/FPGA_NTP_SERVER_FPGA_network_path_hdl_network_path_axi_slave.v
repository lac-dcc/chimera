//======================================================================
//
// npts_interfaces.v
// -----------------
// AXI slave used for control and supervision of the network paths.
//
//
// Author: Rolf Andersson (rolf@mechanicalmen.se)
//
// Copyright 2016-2021 Netnod Internet Exchange i Sverige AB
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module network_path_axi_slave #(
  // Width of S_AXI data bus
  parameter integer C_S_AXI_DATA_WIDTH = 32,
  // Width of S_AXI address bus
  parameter integer C_S_AXI_ADDR_WIDTH = 9 // max 128 32 bit slaves
)(
  // Network stuff
  input wire 				  pp_clk,
  output wire [31:0] 			  gen_config,
  output wire [31:0] 			  ntp_config,
  output wire [31:0] 			  ntp_root_delay,
  output wire [31:0] 			  ntp_root_disp,
  output wire [31:0] 			  ntp_ref_id,
  output wire [63:0] 			  ntp_ref_ts,
  output wire [31:0] 			  ntp_rx_ofs,
  output wire [31:0] 			  ntp_tx_ofs,
  input wire [31:0] 			  pp_status,
  input wire [7:0] 			  xphy_status,
  input wire 				  ntp_sync_ok,

  // API Extension port used for NTS, PP, ROSC, DP.
  output wire [1 : 0] 			  api_ext_command,
  output wire [31 : 0] 			  api_ext_address,
  output wire [31 : 0] 			  api_ext_write_data,
  input wire [1 : 0] 			  api_ext_status,
  input wire [31 : 0] 			  api_ext_read_data,

  // AXI lite
  input wire 				  S_AXI_ACLK,
  input wire 				  S_AXI_ARESETN,
  input wire [C_S_AXI_ADDR_WIDTH-1:0] 	  S_AXI_AWADDR,
  input wire 				  S_AXI_AWVALID,
  output wire 				  S_AXI_AWREADY,
  input wire [C_S_AXI_DATA_WIDTH-1:0] 	  S_AXI_WDATA,
  input wire [(C_S_AXI_DATA_WIDTH/8)-1:0] S_AXI_WSTRB,
  input wire 				  S_AXI_WVALID,
  output wire 				  S_AXI_WREADY,
  output wire [1 : 0] 			  S_AXI_BRESP,
  output wire 				  S_AXI_BVALID,
  input wire 				  S_AXI_BREADY,
  input wire [C_S_AXI_ADDR_WIDTH-1:0] 	  S_AXI_ARADDR,
  input wire 				  S_AXI_ARVALID,
  output wire 				  S_AXI_ARREADY,
  output wire [C_S_AXI_DATA_WIDTH-1:0] 	  S_AXI_RDATA,
  output wire [1:0] 			  S_AXI_RRESP,
  output wire 				  S_AXI_RVALID,
  input wire 				  S_AXI_RREADY
);

  // Inputs
  wire [31:0]  pp_status_axi;
  wire [7:0]   xphy_status_axi;
  wire         ntp_sync_ok_axi;

  // AXI4LITE signals
  reg [C_S_AXI_ADDR_WIDTH-1:0]  axi_awaddr;
  reg                           axi_awready;
  reg                           axi_wready;
  reg [1:0]                     axi_bresp;
  reg                           axi_bvalid;
  reg [C_S_AXI_ADDR_WIDTH-1:0]  axi_araddr;
  reg                           axi_arready;
  reg [C_S_AXI_DATA_WIDTH-1:0]  axi_rdata;
  reg [1 : 0]                   axi_rresp;
  reg                           axi_rvalid;

  // Example-specific design signals
  // local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
  // ADDR_LSB is used for addressing 32/64 bit registers/memories
  // ADDR_LSB = 2 for 32 bits (n downto 2)
  // ADDR_LSB = 3 for 64 bits (n downto 3)

  localparam integer            ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
  localparam integer            OPT_MEM_ADDR_BITS = C_S_AXI_ADDR_WIDTH - ADDR_LSB -1;
  localparam integer            NUM_SLAVES = (1<<C_S_AXI_ADDR_WIDTH)/4;

  localparam                    CNT_OFS = 37;              // Start address of status counters
  localparam                    NCNT    = 32;              // Number of status counters
  localparam                    XOFS    = CNT_OFS + NCNT;  // Xphy status

  //----------------------------------------------
  //-- Signals for user logic register space example
  //------------------------------------------------

  reg [C_S_AXI_DATA_WIDTH-1:0]  slv_reg[0:NUM_SLAVES-1];
  wire                          slv_reg_rden;
  wire                          slv_reg_wren;
  reg [C_S_AXI_DATA_WIDTH-1:0]  reg_data_out;
  integer                       byte_index;

  // Internal wires for NTS API Extension.
  wire [1 : 0] 		api_ext_command_axi;
  wire [31 : 0]   	api_ext_address_axi;
  wire [31 : 0] 	api_ext_write_data_axi;
  wire [1 : 0] 		api_ext_status_axi;
  wire [31 : 0] 	api_ext_read_data_axi;


  // I/O Connections assignments

  assign S_AXI_AWREADY  = axi_awready;
  assign S_AXI_WREADY   = axi_wready;
  assign S_AXI_BRESP    = axi_bresp;
  assign S_AXI_BVALID   = axi_bvalid;
  assign S_AXI_ARREADY  = axi_arready;
  assign S_AXI_RDATA    = axi_rdata;
  assign S_AXI_RRESP    = axi_rresp;
  assign S_AXI_RVALID   = axi_rvalid;

  // Implement axi_awready generation
  // axi_awready is asserted for one S_AXI_ACLK clock cycle when both
  // S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
  // de-asserted when reset is low.
  always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      axi_awready <= 1'b0;
    end else begin
      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID) begin
        // slave is ready to accept write address when
        // there is a valid write address and write data
        // on the write address and data bus. This design
        // expects no outstanding transactions.
        axi_awready <= 1'b1;
      end else begin
        axi_awready <= 1'b0;
      end
    end
  end // always @ ( posedge S_AXI_ACLK )

  // Implement axi_awaddr latching
  // This process is used to latch the address when both
  // S_AXI_AWVALID and S_AXI_WVALID are valid.
  always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      axi_awaddr <= 0;
    end else begin
      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID) begin
        // Write Address latching
        axi_awaddr <= S_AXI_AWADDR;
      end
    end
  end

  // Implement axi_wready generation
  // axi_wready is asserted for one S_AXI_ACLK clock cycle when both
  // S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is
  // de-asserted when reset is low.
  always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      axi_wready <= 1'b0;
    end else begin
      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID) begin
        // slave is ready to accept write data when
        // there is a valid write address and write data
        // on the write address and data bus. This design
        // expects no outstanding transactions.
        axi_wready <= 1'b1;
      end else begin
        axi_wready <= 1'b0;
      end
    end
  end // always @ ( posedge S_AXI_ACLK )

  // Implement memory mapped register select and write logic generation
  // The write data is accepted and written to memory mapped registers when
  // axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
  // select byte enables of slave registers while writing.
  // These registers are cleared when reset (active low) is applied.
  // Slave register write enable is asserted when valid address and data are available
  // and the slave is ready to accept the write address and write data.
  reg [31:0] new_status_cnt [0:NCNT-1]; // Alias for status counters
  assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;
  integer    sts_index;
  always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      for (sts_index=0; sts_index<NUM_SLAVES; sts_index=sts_index+1) begin
        slv_reg[sts_index] <= 'h0;
      end
    end else begin
       // NTS API Extension read registers
       slv_reg[71] <= {30'h0, api_ext_status_axi};
       slv_reg[74] <= api_ext_read_data_axi;

      if (slv_reg_wren) begin
        for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 ) begin
          if ( S_AXI_WSTRB[byte_index] == 1 ) begin
            // Respective byte enables are asserted as per write strobes
            // Slave register 0
            slv_reg[axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]][(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
          end
        end
      end else begin
        for (sts_index=0; sts_index < NCNT; sts_index=sts_index+1) begin
          slv_reg[CNT_OFS+sts_index] <= new_status_cnt[sts_index];
        end
        slv_reg[XOFS] <= xphy_status_axi;
      end // else: !if(slv_reg_wren)

      // Clear laser enable if sync is lost
      if (ntp_sync_ok_axi == 1'b0) begin
	slv_reg[0][29] <= 1'b0;
      end

    end // else: !if( S_AXI_ARESETN == 1'b0 )
  end // always @ ( posedge S_AXI_ACLK )

  // Implement write response logic generation
  // The write response and response valid signals are asserted by the slave
  // when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.
  // This marks the acceptance of address and indicates the status of
  // write transaction.
    always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      axi_bvalid  <= 0;
      axi_bresp   <= 2'b0;
    end else begin
      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID) begin
        // indicates a valid write response is available
        axi_bvalid <= 1'b1;
        axi_bresp  <= 2'b0; // 'OKAY' response
      end else begin
        if (S_AXI_BREADY && axi_bvalid) begin
          //check if bready is asserted while bvalid is high)
          //(there is a possibility that bready is always asserted high)
          axi_bvalid <= 1'b0;
        end
      end
    end
  end // always @ ( posedge S_AXI_ACLK )

  // Implement axi_arready generation
  // axi_arready is asserted for one S_AXI_ACLK clock cycle when
  // S_AXI_ARVALID is asserted. axi_awready is
  // de-asserted when reset (active low) is asserted.
  // The read address is also latched when S_AXI_ARVALID is
  // asserted. axi_araddr is reset to zero on reset assertion.
  always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      axi_arready <= 1'b0;
      axi_araddr  <= 32'b0;
    end else begin
      if (~axi_arready && S_AXI_ARVALID) begin
        // indicates that the slave has acceped the valid read address
        axi_arready <= 1'b1;
        // Read address latching
        axi_araddr  <= S_AXI_ARADDR;
      end else begin
        axi_arready <= 1'b0;
      end
    end
  end // always @ ( posedge S_AXI_ACLK )

  // Implement axi_arvalid generation
  // axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both
  // S_AXI_ARVALID and axi_arready are asserted. The slave registers
  // data are available on the axi_rdata bus at this instance. The
  // assertion of axi_rvalid marks the validity of read data on the
  // bus and axi_rresp indicates the status of read transaction.axi_rvalid
  // is deasserted on reset (active low). axi_rresp and axi_rdata are
  // cleared to zero on reset (active low).
  always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      axi_rvalid <= 0;
      axi_rresp  <= 0;
    end else begin
      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid) begin
        // Valid read data is available at the read data bus
        axi_rvalid <= 1'b1;
        axi_rresp  <= 2'b0; // 'OKAY' response
      end else if (axi_rvalid && S_AXI_RREADY) begin
        // Read data is accepted by the master
        axi_rvalid <= 1'b0;
      end
    end
  end // always @ ( posedge S_AXI_ACLK )

  // Implement memory mapped register select and read logic generation
  // Slave register read enable is asserted when valid address is available
  // and the slave is ready to accept the read address.
  assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
  always @(*) begin
    // Address decoding for reading registers
    reg_data_out <= slv_reg[axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]];
  end // always @ (*)

  // Output register or memory read data
  always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      axi_rdata  <= 0;
    end else begin
      // When there is a valid read address (S_AXI_ARVALID) with
      // acceptance of read address by the slave (axi_arready),
      // output the read dada
      if (slv_reg_rden) begin
        axi_rdata <= reg_data_out;     // register read data
      end
    end
  end // always @ ( posedge S_AXI_ACLK )


  //------------------------------------------------------------------------------------
  // AXI clock domain version of network control/status
  // Outputs
  wire [31:0]  gen_config_axi;
  wire [31:0]  ntp_config_axi;
  wire [31:0]  ntp_root_delay_axi;
  wire [31:0]  ntp_root_disp_axi;
  wire [31:0]  ntp_ref_id_axi;
  wire [63:0]  ntp_ref_ts_axi;
  wire [31:0]  ntp_rx_ofs_axi;
  wire [31:0]  ntp_tx_ofs_axi;

  assign gen_config_axi     =  slv_reg[ 0];
  assign ntp_config_axi     =  slv_reg[29];
  assign ntp_root_delay_axi =  slv_reg[30];
  assign ntp_root_disp_axi  =  slv_reg[31];
  assign ntp_ref_id_axi     =  slv_reg[32];
  assign ntp_ref_ts_axi     = {slv_reg[34], slv_reg[33]};
  assign ntp_rx_ofs_axi     =  slv_reg[35];
  assign ntp_tx_ofs_axi     =  slv_reg[36];


  //---------------------------------------
  // NTS API connectivity.
  //---------------------------------------
  assign api_ext_command_axi    = slv_reg[70][1 : 0];
  assign api_ext_address_axi    = slv_reg[72];
  assign api_ext_write_data_axi = slv_reg[73];

  synchronizer_vector #(.DATA_WIDTH(2))  sync_api_ext_command (.data_in(api_ext_command_axi), .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(api_ext_command));
  synchronizer_vector #(.DATA_WIDTH(32)) sync_api_ext_address (.data_in(api_ext_address_axi), .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(api_ext_address));
  synchronizer_vector #(.DATA_WIDTH(32)) sync_api_ext_write_data (.data_in(api_ext_write_data_axi), .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(api_ext_write_data));
  synchronizer_simple #(.DATA_WIDTH(2))  sync_api_ext_status (.data_in(api_ext_status), .new_clk(S_AXI_ACLK), .data_out(api_ext_status_axi));
  synchronizer_simple #(.DATA_WIDTH(32)) sync_api_ext_read_data (.data_in(api_ext_read_data), .new_clk(S_AXI_ACLK), .data_out(api_ext_read_data_axi));

  synchronizer_vector #(.DATA_WIDTH(32))  sync_gen_config    (.data_in(gen_config_axi),     .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(gen_config));
  synchronizer_vector #(.DATA_WIDTH(32))  sync_ntp_config    (.data_in(ntp_config_axi),     .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(ntp_config));
  synchronizer_vector #(.DATA_WIDTH(32))  sync_root_delay    (.data_in(ntp_root_delay_axi), .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(ntp_root_delay));
  synchronizer_vector #(.DATA_WIDTH(32))  sync_root_disp     (.data_in(ntp_root_disp_axi),  .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(ntp_root_disp));
  synchronizer_vector #(.DATA_WIDTH(32))  sync_ref_id        (.data_in(ntp_ref_id_axi),     .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(ntp_ref_id));
  synchronizer_vector #(.DATA_WIDTH(64))  sync_ref_ts        (.data_in(ntp_ref_ts_axi),     .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(ntp_ref_ts));
  synchronizer_vector #(.DATA_WIDTH(32))  sync_rx_ofs        (.data_in(ntp_rx_ofs_axi),     .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(ntp_rx_ofs));
  synchronizer_vector #(.DATA_WIDTH(32))  sync_tx_ofs        (.data_in(ntp_tx_ofs_axi),     .old_clk(S_AXI_ACLK), .new_clk(pp_clk), .data_out(ntp_tx_ofs));

  synchronizer_simple #(.DATA_WIDTH(32)) sync_pp_status   (.data_in(pp_status),   .new_clk(S_AXI_ACLK), .data_out(pp_status_axi));
  synchronizer_simple #(.DATA_WIDTH(8))  sync_xphy_status (.data_in(xphy_status), .new_clk(S_AXI_ACLK), .data_out(xphy_status_axi));
  synchronizer_simple #(.DATA_WIDTH(1))  sync_ntp_sync_ok (.data_in(ntp_sync_ok), .new_clk(S_AXI_ACLK), .data_out(ntp_sync_ok_axi));

  // remember old value of status pulses
  reg [31:0]  pp_status_axi_old;
  always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      pp_status_axi_old <= 'h0;
    end else begin
      pp_status_axi_old <= pp_status_axi;
    end
  end // always @ ( posedge S_AXI_ACLK )

  // Update status counters
  integer status_index;
  always @(*) begin
    for (status_index=0; status_index < NCNT; status_index=status_index+1 ) begin
      new_status_cnt[status_index] = slv_reg[status_index+CNT_OFS];
      if ((slv_reg[status_index+CNT_OFS] < 32'hffffffff) && pp_status_axi[status_index] == 1'b1 && pp_status_axi_old[status_index] == 1'b0) begin
        new_status_cnt[status_index] = slv_reg[status_index+CNT_OFS] + 1;
      end
    end
  end

endmodule // network_path_axi_slave

`default_nettype wire

//======================================================================
// EOF npts_interfaces.v
//======================================================================
