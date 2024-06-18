// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* axilite_control  Implementation of an AXI-Lite control bus and register
 * space for the CSI receiver. */

`timescale 1 ns / 1 ps

module axilite_control #
(
    // Lots of things are hard-coded for 2 data lanes, so this isn't configurable
    parameter integer N_DATA_LANES = 2,

	// Width of S_AXI data bus
	parameter integer C_S_AXI_DATA_WIDTH	= 32,
	// Width of S_AXI address bus
	parameter integer C_S_AXI_ADDR_WIDTH	= 5
)
(
	// interrupt line
	output wire csi_intr,
	
	// reset signal synchronized to rxbyteclkhs clock
	input wire rxbyteclkhs_resetn,
	
	// PPI interface
	input wire cl_stopstate,
	output wire cl_enable,
	input wire rxbyteclkhs,
	
	input wire dl0_rxactivehs,
	input wire dl0_rxsynchs,
	output wire dl0_enable,
	output wire dl0_forcerxmode,
	input wire dl0_rxvalidhs,
	input wire [7:0] dl0_rxdatahs,
	
	input wire dl1_rxactivehs,
    input wire dl1_rxsynchs,
    output wire dl1_enable,
    output wire dl1_forcerxmode,
    input wire dl1_rxvalidhs,
    input wire [7:0] dl1_rxdatahs,
    
    // AXI Stream Interface Output
    // Uses the rxbyteclkhs clock
    // and rxbyteclkhs_resetn reset signals
    output wire m_axis_tvalid,
    output wire [63:0] m_axis_tdata,
    output wire [7:0] m_axis_tstrb,
    output wire m_axis_tlast,
    input wire m_axis_tready,

	// User ports ends
	// Do not modify the ports beyond this line

	// Global Clock Signal
	input wire  S_AXI_ACLK,
	// Global Reset Signal. This Signal is Active LOW
	input wire  S_AXI_ARESETN,
	// Write address (issued by master, acceped by Slave)
	input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
	// Write channel Protection type. This signal indicates the
		// privilege and security level of the transaction, and whether
		// the transaction is a data access or an instruction access.
	input wire [2 : 0] S_AXI_AWPROT,
	// Write address valid. This signal indicates that the master signaling
		// valid write address and control information.
	input wire  S_AXI_AWVALID,
	// Write address ready. This signal indicates that the slave is ready
		// to accept an address and associated control signals.
	output wire  S_AXI_AWREADY,
	// Write data (issued by master, acceped by Slave) 
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
	// Write strobes. This signal indicates which byte lanes hold
		// valid data. There is one write strobe bit for each eight
		// bits of the write data bus.    
	input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
	// Write valid. This signal indicates that valid write
		// data and strobes are available.
	input wire  S_AXI_WVALID,
	// Write ready. This signal indicates that the slave
		// can accept the write data.
	output wire  S_AXI_WREADY,
	// Write response. This signal indicates the status
		// of the write transaction.
	output wire [1 : 0] S_AXI_BRESP,
	// Write response valid. This signal indicates that the channel
		// is signaling a valid write response.
	output wire  S_AXI_BVALID,
	// Response ready. This signal indicates that the master
		// can accept a write response.
	input wire  S_AXI_BREADY,
	// Read address (issued by master, acceped by Slave)
	input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
	// Protection type. This signal indicates the privilege
		// and security level of the transaction, and whether the
		// transaction is a data access or an instruction access.
	input wire [2 : 0] S_AXI_ARPROT,
	// Read address valid. This signal indicates that the channel
		// is signaling valid read address and control information.
	input wire  S_AXI_ARVALID,
	// Read address ready. This signal indicates that the slave is
		// ready to accept an address and associated control signals.
	output wire  S_AXI_ARREADY,
	// Read data (issued by slave)
	output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
	// Read response. This signal indicates the status of the
		// read transfer.
	output wire [1 : 0] S_AXI_RRESP,
	// Read valid. This signal indicates that the channel is
		// signaling the required read data.
	output wire  S_AXI_RVALID,
	// Read ready. This signal indicates that the master can
		// accept the read data and response information.
	input wire  S_AXI_RREADY
);
    
    // used for interrupts and run/stop
    localparam NUM_INTRS    = 2; // number of interrupts
    localparam SOF_REG_BIT  = 2; // bit position for SOF interrupts in CONFIG, CTRL, and STATUS registers
    localparam SOF_INTR_BIT = 0; // bit position for SOF interrupts in irqs_posted
    localparam EOF_REG_BIT  = 3; // bit position for EOF interrupts in CONFIG, CTRL, and STATUS registers
    localparam OUTPUT_EN_BIT = 4; // bit position for Output Enable. When zero, core runs but output isn't produced
    localparam EOF_INTR_BIT = 1; // bit position for EOF interrupts in irqs_posted
    localparam GLOBALINT_BIT= 1; // bit position for global interrupts in CONFIG, CTRL, and STATUS registers
    localparam RS_REG_BIT   = 0; // bit position for Run/Stop in CONFIG, CTRL, and STATUS registers
    
    reg [(NUM_INTRS-1):0] irqs_posted, irqs_acked;
    reg frame_active_new, frame_active_last;
    reg RS_flag;
    reg RS_new, RS_last;
    reg enable_output; // Output enable flag latched in at SOF
    
    // other user signals
    wire reset;
    wire [(N_DATA_LANES*8)-1:0] aligned_word_out;
    wire aligned_word_valid;
    wire frame_active; // whether we're in the process of receiving a frame
    wire frame_valid;  // whether the output frame data is actually valid
    wire [(N_DATA_LANES*8)-1:0] frame_out;
    wire [63:0] unpacked_out;
    wire unpacked_out_valid;
    wire unpacked_last;
    wire last_packet;
    

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 2;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 8
	reg [C_S_AXI_DATA_WIDTH-1:0]	CSI_CONFIG_REG;       // configuration register (R/W)
	reg [C_S_AXI_DATA_WIDTH-1:0]	CSI_CTRL_SET_REG;     // "SET" register for CSI_CTRL (write-only, read all 0's)
	reg [C_S_AXI_DATA_WIDTH-1:0]	CSI_CTRL_CLEAR_REG;   // "CLEAR" register for CSI_CTRL (write-only, read all 0's)
	reg [C_S_AXI_DATA_WIDTH-1:0]	CSI_STATUS_REG;       // status register (read-only)
	reg [C_S_AXI_DATA_WIDTH-1:0]	CSI_FR_LINES_REG;      // expected number of image lines per frame
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg5; // unimplemented (always read 0xDEADBEEF
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg6; // unimplemented (always read 0xDEADBEEF
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg7; // unimplemented (always read 0xDEADBEEF
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;
	reg	 aw_en;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	      aw_en <= 1'b1;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	          aw_en <= 1'b0;
	        end
	        else if (S_AXI_BREADY && axi_bvalid)
	            begin
	              aw_en <= 1'b1;
	              axi_awready <= 1'b0;
	            end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      CSI_CONFIG_REG       <= 0;
	      CSI_CTRL_SET_REG     <= 0;
	      CSI_CTRL_CLEAR_REG   <= 0;
	      CSI_STATUS_REG       <= 0;
	      CSI_FR_LINES_REG     <= 0;
	      slv_reg5 <= 0;
	      slv_reg6 <= 0;
	      slv_reg7 <= 0;
	      
	      irqs_acked <= 0;
	      RS_new <= 0;
	      RS_last <= 0;
	    end 
	  else begin
	    irqs_acked <= 0;
	    RS_last <= RS_new;
	  
	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          3'h0: begin
	                CSI_CONFIG_REG <= S_AXI_WDATA;
	              end  
	          3'h1: begin	                	                
	                // handle interrupts acknowledgements
	               irqs_acked <= {2{S_AXI_WDATA[GLOBALINT_BIT]}} | {S_AXI_WDATA[EOF_REG_BIT], S_AXI_WDATA[SOF_REG_BIT]};
	                
	                // handle R/S
	                if(S_AXI_WDATA[0] & ~RS_flag) begin
	                   RS_new <= 1'b1;
	                   RS_last <= 1'b0;
	                end
	              end  
	          3'h2: begin
	                if(S_AXI_WDATA[0] == 1'b1) begin
	                   RS_new <= 1'b0;
	                end
	              end  
	          3'h3: begin
	                   // status register is read-only
	                   // writes are ignored
	                   CSI_STATUS_REG <= CSI_STATUS_REG;
	               end 
	          3'h4: begin
	                   CSI_FR_LINES_REG <= S_AXI_WDATA;
	               end 
	          3'h5:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 5
	                slv_reg5[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          3'h6:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 6
	                slv_reg6[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          3'h7:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 7
	                slv_reg7[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : begin
	                      CSI_CONFIG_REG <= CSI_CONFIG_REG;
	                      CSI_CTRL_SET_REG <= CSI_CTRL_SET_REG;
	                      CSI_CTRL_CLEAR_REG <= CSI_CTRL_CLEAR_REG;
	                      CSI_STATUS_REG <= CSI_STATUS_REG;
	                      CSI_FR_LINES_REG <= CSI_FR_LINES_REG;
	                      slv_reg5 <= slv_reg5;
	                      slv_reg6 <= slv_reg6;
	                      slv_reg7 <= slv_reg7;
	                    end
	        endcase
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        3'h0   : reg_data_out <= CSI_CONFIG_REG;
	        3'h1   : reg_data_out <= 0;  // CSI_CTRL_SET_REG always returns 0's when read
	        3'h2   : reg_data_out <= 0;  // CSI_CTRL_CLEAR_REG always returns 0's when read
	        3'h3   : begin // Reading status register CSI_STATUS_REG	        
	             // interrupts
	             reg_data_out[31:4] <= 0;
	             reg_data_out[3] <= irqs_posted[EOF_INTR_BIT];
	             reg_data_out[2] <= irqs_posted[SOF_INTR_BIT];
	             reg_data_out[1] <= (| irqs_posted);
	             reg_data_out[0] <= RS_flag;
	           end
	        3'h4   : reg_data_out <= CSI_FR_LINES_REG;
	        3'h5   : reg_data_out <= 32'hDEADBEEF; //slv_reg5 is un-implemented and returns 0xDEADBEEF when read
	        3'h6   : reg_data_out <= 32'hDEADBEEF; //slv_reg6 is un-implemented and returns 0xDEADBEEF when read
	        3'h7   : reg_data_out <= 32'hDEADBEEF; //slv_reg7 is un-implemented and returns 0xDEADBEEF when read
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

	// Add user logic here
	
	// Make active-high reset
	assign reset = ~rxbyteclkhs_resetn | ~RS_flag;
		
	// interrupt-related
	assign csi_intr = CSI_CONFIG_REG[GLOBALINT_BIT] & (| (irqs_posted & CSI_CONFIG_REG[EOF_REG_BIT:SOF_REG_BIT]));

    // interrupt generation logic
    always @(posedge S_AXI_ACLK)
    begin
        if ( S_AXI_ARESETN == 1'b0 )
        begin
            irqs_posted <= 0;
            frame_active_new <= 0;
            frame_active_last <= 0;
        end
        else begin
            frame_active_new <= frame_active;
            frame_active_last <= frame_active_new;
            
            if(~frame_active_last & frame_active_new) irqs_posted[SOF_INTR_BIT] <= 1'b1;
            else if(frame_active_last & ~frame_active_new) irqs_posted[EOF_INTR_BIT] <= 1'b1;
            else begin
                irqs_posted[SOF_INTR_BIT] <= irqs_posted[SOF_INTR_BIT] & ~irqs_acked[SOF_INTR_BIT];
                irqs_posted[EOF_INTR_BIT] <= irqs_posted[EOF_INTR_BIT] & ~irqs_acked[EOF_INTR_BIT];
            end
        end
    end
   
    
    // generating the RS signal
    always @(posedge S_AXI_ACLK)
    begin
        if ( S_AXI_ARESETN == 1'b0 ) RS_flag <= 0;
        else begin
            if(RS_last & ~RS_new) RS_flag <= 1'b0;
            else if(~RS_last & RS_new) RS_flag <= 1'b1;
            else if(~CSI_CONFIG_REG[RS_REG_BIT] & ~frame_active_new & frame_active_last) RS_flag <= 1'b0;
            else RS_flag <= RS_flag;
        end
    end
    
    // CSI modules
    wordalign align(
        .clk(rxbyteclkhs),
        .resetn(rxbyteclkhs_resetn),
        .dl0_rxvalidhs(dl0_rxvalidhs),
        .dl0_rxdatahs(dl0_rxdatahs),
        .dl1_rxvalidhs(dl1_rxvalidhs),
        .dl1_rxdatahs(dl1_rxdatahs),
        .word_out(aligned_word_out),
        .word_valid(aligned_word_valid)
    );
    
    pckthandler depacket(
        .rxbyteclkhs(rxbyteclkhs),
        .reset(reset),
        .in_stream_valid(aligned_word_valid),
        .in_stream(aligned_word_out),
        .frame_active(frame_active),
        .frame_valid(frame_valid),
        .out_stream(frame_out),
        .lines_per_frame(CSI_FR_LINES_REG),
        .last_packet(last_packet)
    );
    
    raw10_decoder unpack(
        .rxbyteclkhs(rxbyteclkhs),
        .reset(reset),
        .frame_active(frame_active),
        .frame_valid(frame_valid),
        .data_in(frame_out),
        .out_valid(unpacked_out_valid),
        .data_out(unpacked_out),
        .last_packet_in(last_packet),
        .last_packet_out(unpacked_last)
    );
    

    // Latch in the output enable signal on SOF
    // The frame_active signal goes high just before the first data goes out
    always @(posedge S_AXI_ACLK)
    begin
        if ( S_AXI_ARESETN == 1'b0 )
            enable_output <= 0;
        else if(~frame_active_last & frame_active_new)
            enable_output <= CSI_CONFIG_REG[OUTPUT_EN_BIT];
        else
            enable_output <= enable_output;
    end

    // Stream Interface
    assign m_axis_tdata =  enable_output ? unpacked_out : 0;
    assign m_axis_tvalid = enable_output ? unpacked_out_valid : 0;
    assign m_axis_tstrb =  enable_output ? 8'b11111111 : 0;
    assign m_axis_tlast =  enable_output ? unpacked_last : 0;
    
    // always enable the D-PHY
    assign cl_enable = 1'b1;
    assign dl0_enable = 1'b1;
    assign dl1_enable = 1'b1;
    
    // don't force the lanes into reset
    assign dl0_forcerxmode = 1'b1;
    assign dl1_forcerxmode = 1'b1;
    
	// User logic ends

	endmodule
