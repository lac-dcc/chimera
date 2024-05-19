// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

//////////////////////////////////////////////////////////////////////////////////////////////////
//
// ddr wr/rd address mapping, to support ikernel virtualization
// Gabi Malka, Technion, TCE
// Mar-2018
//
// ddr wr/rd address mapping scheme:
// =================================
// Scope: Mapping the ikernel originated axi4mm address to its physical ddr address.
//
// 4K pages are assumed. Only the page section is mapped. The 4K page offset is unchanged
// Up to 2^10 pages are supported.
// Page address mapping is implemented via a lookup table, of 1024 x 19 bit wide entries.
// Used pages address mapping must be preloaded to the address mapping table, implemented within the top level verilog wrapper
// Both read and write ikernel transactions assume the same address mapping table.
// The address mapping table is addressable via AXI-Lite, allocated to
// addresses: 0x9000..0x9400 (addresses are aligned to 4-byte words)
//
//
// Setup:
// ======
// 1. Preload the pages address mapping to the lookup table:
//    Lookup table AXI-lite address space: 0x9000 thru 0x9400
//       For (all_ikernel_IDs) do
//          map_table[ikernel_ID[9:0] <= map_address[18:0];
//
// 2. Normal mode operation (disable test mode):
//    Clear AXI-lite register 0x9800
//
//
// Mapping scheme:
// ===============
// 1. Page offset is unchanged:
//    ddr_adrs_page_offset[11:0] <= ikernel_adrs[11:0]}
//
// 2. adrs_map table lookup: ikernel_adrs[40:31] is assumed as the ikernel_id:
//    ddr_adrs_base[18:0] <= map_table[ikernel_adrs[40:31]]
//
// 3. Final ddr address:
//    ddr_adrs[30:0] <= {ikernel_adrs[30:12] + adrs_map_base[18:0], ddr_adrs_page_offset[11:0]} 
//
//
// Notes:
// 1. Only 31 lower ddr address bits are considered, to match the Innova implemented ddr size (2GB).
// 2. The address mapping scheme implementation consists of a 4 stage pipeline, supporting read/write requests throughput == 1.
// 3. adrs_map table is loaded via axilite interface.
// 4. The mapping lookup table is duplicated, to support independent ddr read & write address mapping.
//    Yet, both tables are mapped to same axilite address space, thus both are concurrently written.
// 5. For testing purposes, a test mode is implemented, allowing testing the mapping scheme, independent of the ikernel implementation status.
//    Test mode is selectable via an AXI-lite control register
// 6. The axi4 data channel is not modified, which means: as a result of adding the 4-pipe stages mapping scheme to the address_write channel,
//    the ddr may see an axi4 data_write request before the address_write request.
//    Yet, this scenario is allowed by the axi4 specification:
//    ====> AMBA AXI and ACE Protocol Specification (Issue D, 28-October-2011), chapter A3.3 "Relationships between the channels":
//          "This means, for example, that the write data can appear at an interface before the write address for the transaction.
//           This can occur if the write address channel contains more register stages than the write data channel.
//           Similarly, the write data might appear in the same cycle as the address"
//


module ddr_address_mapping #(
parameter
    AXILITE_ADDR_WIDTH = 13,
    AXILITE_DATA_WIDTH = 32
)(
    input wire 				  clk,
    input wire 				  reset,

  // Indicating which axi4mm (aw or ar) this instance is serving
  // rdwr == 0 - wr instance
  // rdwr == 1 - rd instance
    input wire 				  rdwr_mode,

    // AXI_lites interface
    input wire [AXILITE_ADDR_WIDTH-1:0]   axi_AWADDR,
    input wire 				  axi_AWVALID,
    output wire 			  axi_AWREADY,
    input wire [AXILITE_DATA_WIDTH-1:0]   axi_WDATA,
    input wire 				  axi_WVALID,
    output wire 			  axi_WREADY,
    input wire [AXILITE_DATA_WIDTH/8-1:0] axi_WSTRB, // Not used by this AXILites slave. Assumed always all-1
    output wire 			  axi_BVALID,
    input wire 				  axi_BREADY,
    output wire [1:0] 			  axi_BRESP,

// ikernel <=> addr_map
    output 				  ik2map_rdy,
    input 				  ik2map_vld,
    input [63:0] 			  ik2map_addr,
    input [1:0] 			  ik2map_burst,
    input [3:0] 			  ik2map_cache,
    input [2:0] 			  ik2map_id,
    input [7:0] 			  ik2map_len,
    input [1:0] 			  ik2map_lock,
    input [2:0] 			  ik2map_prot,
    input [3:0] 			  ik2map_qos,
    input [3:0] 			  ik2map_region,
    input [2:0] 			  ik2map_size,

// addr_map <==> ddr:
    input 				  map2ddr_rdy,
    output 				  map2ddr_vld,

// Only 32 lower addr bits are mapped.
// Upper bits are assigned to a constant in ku*.v top level wrapper
    output [31:0] 			  map2ddr_addr,
    output [1:0] 			  map2ddr_burst,
    output [3:0] 			  map2ddr_cache,
    output [2:0] 			  map2ddr_id,
    output [7:0] 			  map2ddr_len,
    output [1:0] 			  map2ddr_lock,
    output [2:0] 			  map2ddr_prot,
    output [3:0] 			  map2ddr_qos,
    output [3:0] 			  map2ddr_region,
    output [2:0] 			  map2ddr_size
  
  );

  
localparam
    WRIDLE                     = 2'd0,
    WRDATA                     = 2'd1,
    WRRESP                     = 2'd2,
    RDIDLE                     = 2'd0,
    RDDATA                     = 2'd1;

localparam
  DDR_ADDR_MAP_START      = 13'h1000, // write only
  DDR_ADDR_MAP_END        = 13'h1400, // write only
  DDR_ADDR_MAP_CTRL       = 13'h1800, // write only
  DDR_ADDR_MAP_WRBASE0    = 13'h1810, // write only
  DDR_ADDR_MAP_WRBASE1    = 13'h1814, // write only
  DDR_ADDR_MAP_RDBASE0    = 13'h1818, // write only
  DDR_ADDR_MAP_RDBASE1    = 13'h181c; // write only

  wire 	      axi_aw_hs;
  wire 	      axi_w_hs;
  reg [1:0]   axi_wstate;
  reg [1:0]   axi_wnext;
  reg 	      ddr_adrs_table_wr;
  reg [AXILITE_ADDR_WIDTH-1 : 0] axi_waddr;
  reg [31:0] 			 ddr_adrs_table_datain;

  wire [9:0] map_addr;
  wire [31:0] map_out;
  reg [31:0]  stage3_map;
  wire 	      stage1_enable;
  reg 	      stage1_vld;
  wire 	      stage1_rdy;
  wire	      stage2_enable;
  reg 	      stage2_vld;
  wire 	      stage2_rdy;
  wire	      stage3_enable;
  reg 	      stage3_vld;
  wire 	      stage3_rdy;
  wire	      stage4_enable;
  reg 	      stage4_vld;
  wire 	      stage4_rdy;

  reg [31:0]  stage1_addr;// N64
  reg [1:0]   stage1_burst;// N2
  reg [3:0]   stage1_cache;// N4
  reg [2:0]   stage1_id;// N3
  reg [7:0]   stage1_len;// N8
  reg [1:0]   stage1_lock;// N1
  reg [2:0]   stage1_prot;// N3
  reg [3:0]   stage1_qos;// N4
  reg [3:0]   stage1_region;// N4
  reg [2:0]   stage1_size;// N3

  reg [31:0]  stage2_addr;// N64
  reg [1:0]   stage2_burst;// N2
  reg [3:0]   stage2_cache;// N4
  reg [2:0]   stage2_id;// N3
  reg [7:0]   stage2_len;// N8
  reg [1:0]   stage2_lock;// N1
  reg [2:0]   stage2_prot;// N3
  reg [3:0]   stage2_qos;// N4
  reg [3:0]   stage2_region;// N4
  reg [2:0]   stage2_size;// N3

  reg [31:0]  stage3_addr;// N64
  reg [1:0]   stage3_burst;// N2
  reg [3:0]   stage3_cache;// N4
  reg [2:0]   stage3_id;// N3
  reg [7:0]   stage3_len;// N8
  reg [1:0]   stage3_lock;// N1
  reg [2:0]   stage3_prot;// N3
  reg [3:0]   stage3_qos;// N4
  reg [3:0]   stage3_region;// N4
  reg [2:0]   stage3_size;// N3

  reg [31:0]  stage4_addr;// N64
  reg [1:0]   stage4_burst;// N2
  reg [3:0]   stage4_cache;// N4
  reg [2:0]   stage4_id;// N3
  reg [7:0]   stage4_len;// N8
  reg [1:0]   stage4_lock;// N1
  reg [2:0]   stage4_prot;// N3
  reg [3:0]   stage4_qos;// N4
  reg [3:0]   stage4_region;// N4
  reg [2:0]   stage4_size;// N3
  

// ==================================================================================================
// Test mode logic:
// ================
//
// Used to test the mapping scheme, while memcached still not implemented the ikernel virtual_id into aw_addr/ar_addr[40:31]
// In test mode, aw_addr/ar_addr[40:31] are replaced with predetermined values
//
// ddr_adrs_map_ctrl[31:0] -   Test mode control register:
//    ddr_adrs_map_ctrl[31:17] - reserved
//    ddr_adrs_map_ctrl[16]    - Bypass axi4mm_ar_addr[40:31] with alternate(ddr_adrs_map_rdbase0, ddr_adrs_map_rdbase1).
//                               While on, alternate between ddr_adrs_map_rdbase0 and ddr_adrs_map_rdbase1, to drive axi4mm_ar_addr[40:31]
//    ddr_adrs_map_ctrl[15:1]  - reserved
//    ddr_adrs_map_ctrl[0]     - Bypass axi4mm_aw_addr[40:31] with alternate(ddr_adrs_map_wrbase0, ddr_adrs_map_wrbase1)
//                               While on, alternate between ddr_adrs_map_wrbase0 and ddr_adrs_map_wrbase1, to drive axi4mm_aw_addr[40:31]
//
// Enforced ikernel virtual_id for ddr read/write transactions
//    ddr_adrs_map_wrbase0
//    ddr_adrs_map_wrbase1
//    ddr_adrs_map_rdbase0
//    ddr_adrs_map_rdbase1

  reg [31:0] 			 ddr_adrs_map_ctrl;
  reg [31:0] 			 ddr_adrs_map_wrbase0;
  reg [31:0] 			 ddr_adrs_map_wrbase1;
  reg [31:0] 			 ddr_adrs_map_rdbase0;
  reg [31:0] 			 ddr_adrs_map_rdbase1;
  reg 				 ddr_adrs_map_wr_toggle;
  reg 				 ddr_adrs_map_rd_toggle;
  wire [31:0] 			 map_wraddr_test_mode;
  wire [31:0] 			 map_wraddr;
  wire [31:0] 			 map_rdaddr_test_mode;
  wire [31:0] 			 map_rdaddr;
  
  always @(posedge clk) begin
    if (reset) begin
      ddr_adrs_map_wr_toggle <= 1'b0;
      ddr_adrs_map_rd_toggle <= 1'b0;
    end
    else begin
      if (ik2map_rdy & ik2map_vld) begin
	ddr_adrs_map_rd_toggle <= rdwr_mode ? ddr_adrs_map_rd_toggle + 1 : ddr_adrs_map_rd_toggle;
	ddr_adrs_map_wr_toggle <= rdwr_mode ? ddr_adrs_map_wr_toggle : ddr_adrs_map_wr_toggle + 1;
      end
    end
  end
  
  // ikernel virtual_id bypass in test mode:
  // following a rd/wr transaction, *toggle is inverted, to select a different ikernel virtual_id between two successive transactions
  assign map_wraddr_test_mode = ddr_adrs_map_wr_toggle ? ddr_adrs_map_wrbase1 : ddr_adrs_map_wrbase0;
  assign map_rdaddr_test_mode = ddr_adrs_map_rd_toggle ? ddr_adrs_map_rdbase1 : ddr_adrs_map_rdbase0;

// ======================
// End of test mode logic
// ==================================================================================================
  

  // Final map tabe address, based on module ddr_address_mapping instance mode:
  assign map_wraddr = ddr_adrs_map_ctrl[0] ? map_wraddr_test_mode : ik2map_addr[40:31];
  assign map_rdaddr = ddr_adrs_map_ctrl[16] ? map_rdaddr_test_mode : ik2map_addr[40:31];
  assign map_addr = ~rdwr_mode ? map_wraddr[9:0] : map_rdaddr[9:0];


  //------------------------Local AXI write fsm------------------
  assign axi_AWREADY = (axi_wstate == WRIDLE);
  assign axi_WREADY  = (axi_wstate == WRDATA);
  assign axi_BRESP   = 2'b00;  // OKAY
  assign axi_BVALID  = (axi_wstate == WRRESP);
  assign axi_aw_hs   = axi_AWVALID & axi_AWREADY;
  assign axi_w_hs    = axi_WVALID & axi_WREADY;
  
  // wstate
  always @(posedge clk) begin
    if (reset)
      axi_wstate <= WRIDLE;
    else
      axi_wstate <= axi_wnext;
  end
  
  // wnext
  always @(*) begin
    case (axi_wstate)
      WRIDLE:
        if (axi_AWVALID)
          axi_wnext = WRDATA;
        else
          axi_wnext = WRIDLE;
      WRDATA:
        if (axi_WVALID)
          axi_wnext = WRRESP;
        else
          axi_wnext = WRDATA;
      WRRESP:
        if (axi_BREADY)
          axi_wnext = WRIDLE;
        else
          axi_wnext = WRRESP;
      default:
        axi_wnext = WRIDLE;
    endcase
  end
  
  // waddr
  always @(posedge clk) begin
    if (axi_aw_hs)
      axi_waddr <= axi_AWADDR[AXILITE_ADDR_WIDTH-1 : 0];
  end
  
  // writing to map table
  always @(posedge clk) begin
    if (reset) begin
      ddr_adrs_table_wr <= 1'b0;
      ddr_adrs_map_ctrl <= 32'h00000000;
      ddr_adrs_map_wrbase0 <= 32'h00000000;
      ddr_adrs_map_wrbase1 <= 32'h00000000;
      ddr_adrs_map_rdbase0 <= 32'h00000000;
      ddr_adrs_map_rdbase1 <= 32'h00000000;
    end
    else
      begin
	if (axi_w_hs && axi_waddr >= DDR_ADDR_MAP_START && axi_waddr < DDR_ADDR_MAP_END) begin
	  ddr_adrs_table_wr <= 1'b1;
	  ddr_adrs_table_datain <= axi_WDATA;
	end
	else
	  ddr_adrs_table_wr <= 1'b0;
	
	if (axi_w_hs && axi_waddr == DDR_ADDR_MAP_CTRL)
	  ddr_adrs_map_ctrl <= axi_WDATA;
	if (axi_w_hs && axi_waddr == DDR_ADDR_MAP_WRBASE0)
	  ddr_adrs_map_wrbase0 <= axi_WDATA;
	if (axi_w_hs && axi_waddr == DDR_ADDR_MAP_WRBASE1)
	  ddr_adrs_map_wrbase1 <= axi_WDATA;
	if (axi_w_hs && axi_waddr == DDR_ADDR_MAP_RDBASE0)
	  ddr_adrs_map_rdbase0 <= axi_WDATA;
	if (axi_w_hs && axi_waddr == DDR_ADDR_MAP_RDBASE1)
	  ddr_adrs_map_rdbase1 <= axi_WDATA;
      end
  end
  

  // axi4mm signals pipeline
  assign ik2map_rdy = stage1_rdy;
  
  assign stage1_enable = ik2map_vld & ik2map_rdy;
  assign stage1_rdy = ~stage1_vld | stage2_rdy;

  assign stage2_enable = stage1_vld & stage2_rdy;
  assign stage2_rdy = ~stage2_vld | stage3_rdy;

  assign stage3_enable = stage2_vld & stage3_rdy;
  assign stage3_rdy = ~stage3_vld | stage4_rdy;

  assign stage4_enable = stage3_vld & stage4_rdy;
  assign stage4_rdy = ~stage4_vld | map2ddr_rdy;

  assign map2ddr_vld = stage4_vld;
  assign map2ddr_addr = stage4_addr;
  assign map2ddr_burst = stage4_burst;
  assign map2ddr_cache = stage4_cache;
  assign map2ddr_id = stage4_id;
  assign map2ddr_len = stage4_len;
  assign map2ddr_lock = stage4_lock;
  assign map2ddr_prot = stage4_prot;
  assign map2ddr_qos = stage4_qos;
  assign map2ddr_region = stage4_region;
  assign map2ddr_size = stage4_size;
  
  
always @(posedge clk) begin
  if (reset) begin
    stage1_vld <= 1'b0;
    stage2_vld <= 1'b0;
    stage3_vld <= 1'b0;
    stage4_vld <= 1'b0;
  end
  else begin
    if (stage1_enable) begin
      stage1_addr <= {1'b0, ik2map_addr[30:0]};
      stage1_burst <= ik2map_burst;
      stage1_cache <= ik2map_cache;
      stage1_id <= ik2map_id;
      stage1_len <= ik2map_len;
      stage1_lock <= ik2map_lock;
      stage1_prot <= ik2map_prot;
      stage1_qos <= ik2map_qos;
      stage1_region <= ik2map_region;
      stage1_size <= ik2map_size;
      stage1_vld <= 1'b1;
    end
    else if (stage1_vld & stage2_rdy) begin
      stage1_vld <= 1'b0;
    end

    if (stage2_enable) begin
      stage2_addr <= {1'b0, stage1_addr[30:0]};
      stage2_burst <= stage1_burst;
      stage2_cache <= stage1_cache;
      stage2_id <= stage1_id;
      stage2_len <= stage1_len;
      stage2_lock <= stage1_lock;
      stage2_prot <= stage1_prot;
      stage2_qos <= stage1_qos;
      stage2_region <= stage1_region;
      stage2_size <= stage1_size;
      stage2_vld <= 1'b1;
    end
    else if (stage2_vld & stage3_rdy) begin
      stage2_vld <= 1'b0;
    end

    if (stage3_enable) begin
      stage3_map <= map_out;
      stage3_addr <= {1'b0, stage2_addr[30:0]};
      stage3_burst <= stage2_burst;
      stage3_cache <= stage2_cache;
      stage3_id <= stage2_id;
      stage3_len <= stage2_len;
      stage3_lock <= stage2_lock;
      stage3_prot <= stage2_prot;
      stage3_qos <= stage2_qos;
      stage3_region <= stage2_region;
      stage3_size <= stage2_size;
      stage3_vld <= 1'b1;
    end
    else if (stage3_vld & stage4_rdy) begin
      stage3_vld <= 1'b0;
    end

    if (stage4_enable) begin
// Mapping current address to its assigned location in ddr space:
      stage4_addr <= {1'b0, stage3_addr[30:12] + stage3_map[18:0] , stage3_addr[11:0]};

      stage4_burst <= stage3_burst;
      stage4_cache <= stage3_cache;
      stage4_id <= stage3_id;
      stage4_len <= stage3_len;
      stage4_lock <= stage3_lock;
      stage4_prot <= stage3_prot;
      stage4_qos <= stage3_qos;
      stage4_region <= stage3_region;
      stage4_size <= stage3_size;
      stage4_vld <= 1'b1;
    end

    else if (stage4_vld & map2ddr_rdy) begin
      stage4_vld <= 1'b0;
    end

  end
end

  
ddr_adrs_mapping ddr_addr_table (
  .clka(clk),    // input wire clka

// Map table is loaded via axi-lite:
  .addra({2'b0, axi_waddr[9:2]}),  // input wire [9 : 0]
  .wea(ddr_adrs_table_wr),      // input wire [0 : 0] wea
  .dina(ddr_adrs_table_datain),    // input wire [31 : 0] dina

// Table lookup: thread number resides in ik2map_aw/ar_addr[40:31]:			
// The table is constantly looked-up. Yet, its output is valid only upon ik2map_vld & ik2map_rdy
  .clkb(clk),    // input wire clkb
  .addrb(map_addr),  // input wire [9 : 0] addrb

//  map_out[19:0]  - Thread base address
//  map_out[31:20] - Reserved
  .doutb(map_out)  // output wire [31 : 0] doutb
);
  
endmodule
