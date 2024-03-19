`default_nettype none

`timescale 1 ns / 1 ps

module user_registers_axi_slave #(
  // Width of S_AXI data bus
  parameter integer C_S_AXI_DATA_WIDTH = 32,
  // Width of S_AXI address bus
  parameter integer C_S_AXI_ADDR_WIDTH = 7,
  parameter integer NUM_POWER_REG      = 13
)(

  input wire [NUM_POWER_REG*32-1:0]       power_status,
  input wire                              pcie_link_up,
 
  // AXI lite
  input wire                              S_AXI_ACLK,
  input wire                              S_AXI_ARESETN,
  input wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_AWADDR,
  input wire                              S_AXI_AWVALID,
  output wire                             S_AXI_AWREADY,
  input wire [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_WDATA,
  input wire [(C_S_AXI_DATA_WIDTH/8)-1:0] S_AXI_WSTRB,
  input wire                              S_AXI_WVALID,
  output wire                             S_AXI_WREADY,
  output wire [1 : 0]                     S_AXI_BRESP,
  output wire                             S_AXI_BVALID,
  input wire                              S_AXI_BREADY,
  input wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_ARADDR,
  input wire                              S_AXI_ARVALID,
  output wire                             S_AXI_ARREADY,
  output wire [C_S_AXI_DATA_WIDTH-1:0]    S_AXI_RDATA,
  output wire [1:0]                       S_AXI_RRESP,
  output wire                             S_AXI_RVALID,
  input wire                              S_AXI_RREADY
);
  
// Defaults for defines that are normally set by the pre_synth.tcl script
`ifndef BUILD_TIME
 `define BUILD_TIME 0
`endif

`ifndef BUILD_INFO
 `define BUILD_INFO 0
`endif

`ifndef GIT_HASH
 `define GIT_HASH 0
`endif

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
 
  //----------------------------------------------
  //-- Signals for user logic register space example
  //------------------------------------------------

  reg [C_S_AXI_DATA_WIDTH-1:0]  slv_reg[0:NUM_SLAVES-1];
  wire                          slv_reg_rden;
  wire                          slv_reg_wren;
  reg [C_S_AXI_DATA_WIDTH-1:0]  reg_data_out;
  integer                       byte_index;

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
  reg [31:0] new_status_cnt [0:15]; // Alias for status counters
  assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;
  integer    sts_index;
  always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
      for (sts_index=0; sts_index<NUM_SLAVES; sts_index=sts_index+1) begin
        slv_reg[sts_index] <= 'h0;
      end
    end else begin
      if (slv_reg_wren) begin
        for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 ) begin
          if ( S_AXI_WSTRB[byte_index] == 1 ) begin
            // Respective byte enables are asserted as per write strobes 
            // Slave register 0
            slv_reg[axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]][(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
          end
        end
      end // else: !if(slv_reg_wren)
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
    reg_data_out <= 'b0;
    // Address decoding for reading registers
    if (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] < NUM_POWER_REG) begin
      reg_data_out    <= power_status[axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]*32+:32];
    end else if (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == NUM_POWER_REG) begin
      reg_data_out    <= `BUILD_TIME;  // Build Time
    end else if (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == NUM_POWER_REG+1) begin
      reg_data_out[0] <= pcie_link_up;  // Is it possible to read this
    end else if (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == NUM_POWER_REG+2) begin
      reg_data_out    <= `BUILD_INFO;
    end else if (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == NUM_POWER_REG+3) begin
      reg_data_out    <= `GIT_HASH;
    end
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

endmodule // user_registers_axi_slave

`default_nettype wire
