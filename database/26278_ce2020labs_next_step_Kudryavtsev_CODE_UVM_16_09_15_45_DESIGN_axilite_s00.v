// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

	module AXILITE_S00 #
	(
		// Users to add parameters here
		parameter integer C_S_AXI_BASEADDR	    = 0,
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 32
	)
	(
		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
    	// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
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

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg [1 : 0] 	                axi_bresp;
	reg  	                        axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	                axi_rresp;
	reg  	                        axi_rvalid;
	reg                             axi_arready;
	reg                             axi_awready;
	reg                             axi_wready;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 1;
	//----------------------------------------------
	//-- Signals for user logic register space example
	wire [31:0] EXT;
	wire [31:0] M;
	//------------------------------------------------
	//-- Number of Slave Registers 4
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	    = axi_wready;
	assign S_AXI_BRESP	    = axi_bresp;
	assign S_AXI_BVALID	    = axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	    = axi_rdata;
	assign S_AXI_RRESP	    = axi_rresp;
	assign S_AXI_RVALID	    = axi_rvalid;

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( ~S_AXI_ARESETN ) axi_awaddr <= 0;
	  else if (S_AXI_AWVALID &  S_AXI_AWREADY) axi_awaddr <= S_AXI_AWADDR;
	end  

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	always @( posedge S_AXI_ACLK )
	begin
	  if ( ~S_AXI_ARESETN )
	    begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	    end 
	  else begin
	    if (S_AXI_WVALID & S_AXI_WREADY & ~S_AXI_AWVALID)
	      begin
	        case ( S_AXI_AWADDR )
	          C_S_AXI_BASEADDR: slv_reg0 <= S_AXI_WDATA;
	          C_S_AXI_BASEADDR + 4: slv_reg1 <= S_AXI_WDATA;
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                    end
	        endcase
	      end
	  else if (S_AXI_WVALID & S_AXI_WREADY & S_AXI_AWVALID)	
	       begin
	        case ( S_AXI_AWADDR )
	          C_S_AXI_BASEADDR: slv_reg0 <= S_AXI_WDATA;
	          C_S_AXI_BASEADDR + 4: slv_reg1 <= S_AXI_WDATA;
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                    end
	        endcase
	        end
	  end	  
	end    

    assign M = slv_reg0 + slv_reg1;
    assign EXT = (slv_reg0[31] & slv_reg1[31] & ~M[31]) | (~slv_reg0[31] & ~slv_reg1[31] & M[31]);
    
    always @(*)
    begin
    slv_reg2 = M;
    slv_reg3 = EXT ? 32'hFFFFFFFF : 32'h00000000;
    end 
	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( ~S_AXI_ARESETN )
	    begin
	      axi_bvalid  <= 1'b0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (S_AXI_WVALID & S_AXI_WREADY) 
	      begin
	       if (S_AXI_AWVALID & S_AXI_AWREADY) 
	          begin
	          axi_bvalid <= 1'b1;
	          if((S_AXI_AWADDR == C_S_AXI_BASEADDR)||(S_AXI_AWADDR == (C_S_AXI_BASEADDR+4))) axi_bresp  <= 2'b00; 
	          else axi_bresp  <= 2'b10;
	          end                   
	      else 
	        begin
            axi_bvalid <= 1'b1;
	        if((axi_awaddr == C_S_AXI_BASEADDR)||(axi_awaddr == (C_S_AXI_BASEADDR+4))) axi_bresp  <= 2'b00; 
	        else axi_bresp  <= 2'b10;
	        end                   
        end
	   else if(S_AXI_BREADY)  axi_bvalid <= 1'b0; 
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
	  if (~S_AXI_ARESETN) axi_araddr  <= 32'b0;
	  else if (S_AXI_ARVALID) axi_araddr  <= S_AXI_ARADDR;
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
	  if ( ~S_AXI_ARESETN )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	      axi_rdata  <= 32'b0;
	      axi_arready <= 1'b0;
	      axi_awready <= 1'b0;
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (S_AXI_ARVALID & S_AXI_ARREADY)
	            begin
	               axi_rvalid <= 1'b1;
	               if(~axi_rvalid | S_AXI_RREADY) begin
	                   case ( S_AXI_ARADDR )
	                   C_S_AXI_BASEADDR+8   : axi_rdata <= slv_reg2;
	                   C_S_AXI_BASEADDR+12   : axi_rdata <= slv_reg3;
	                   default : axi_rdata <= 0;
	                   endcase
  	                   if((S_AXI_ARADDR == (C_S_AXI_BASEADDR+8))||(S_AXI_ARADDR == (C_S_AXI_BASEADDR+12))) axi_rresp  <= 2'b00; // 'OKAY' response 
	                   else axi_rresp  <= 2'b10;
	                   end
	            end
	      if(axi_rvalid & ~S_AXI_RREADY) begin
	                       axi_arready <= 1'b0;
	                       axi_awready <= 1'b0;
	                       axi_wready <= 1'b0;
	                       end 
	      else
	      begin
	                       if(~S_AXI_ARVALID) axi_rvalid <= 1'b0;	
	                       axi_arready <= 1'b1;
	                       axi_awready <= 1'b1;
	                       axi_wready <= 1'b1;
	      end  
	  end	  	               
	end    
	endmodule
