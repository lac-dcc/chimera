module interconnect(
		    ack,
		    reset,

		    // write address channel _M1
		    AWREADY_M1,

		    AWID_M1,
		    AWADDR_M1,
		    AWLEN_M1,
		    AWSIZE_M1,
		    AWBURST_M1,
		    AWVALID_M1,

		    // write data channel _M1
		    WREADY_M1,
		    
		    WID_M1,
		    WDATA_M1,
		    WLAST_M1,
		    WVALID_M1,

		    // write response channel _M1
		    BID_M1,
		    BRESP_M1,
		    BVALID_M1,

		    BREADY_M1,

		    // write address channel _M2
		    AWREADY_M2,

		    AWID_M2,
		    AWADDR_M2,
		    AWLEN_M2,
		    AWSIZE_M2,
		    AWBURST_M2,
		    AWVALID_M2,

		    // write data channel _M2
		    WREADY_M2,
		    
		    WID_M2,
		    WDATA_M2,
		    WLAST_M2,
		    WVALID_M2,

		    // write response channel _M2
		    BID_M2,
		    BRESP_M2,
		    BVALID_M2,

		    BREADY_M2,

		    // write address channel _M3
		    AWREADY_M3,

		    AWID_M3,
		    AWADDR_M3,
		    AWLEN_M3,
		    AWSIZE_M3,
		    AWBURST_M3,
		    AWVALID_M3,

		    // write data channel _M3
		    WREADY_M3,
		    
		    WID_M3,
		    WDATA_M3,
		    WLAST_M3,
		    WVALID_M3,

		    // write response channel _M3
		    BID_M3,
		    BRESP_M3,
		    BVALID_M3,

		    BREADY_M3,

		    // write address channel _M4
		    AWREADY_M4,

		    AWID_M4,
		    AWADDR_M4,
		    AWLEN_M4,
		    AWSIZE_M4,
		    AWBURST_M4,
		    AWVALID_M4,

		    // write data channel _M4
		    WREADY_M4,
		    
		    WID_M4,
		    WDATA_M4,
		    WLAST_M4,
		    WVALID_M4,

		    // write response channel _M4
		    BID_M4,
		    BRESP_M4,
		    BVALID_M4,

		    BREADY_M4,

		    // write address channel _M5
		    AWREADY_M5,

		    AWID_M5,
		    AWADDR_M5,
		    AWLEN_M5,
		    AWSIZE_M5,
		    AWBURST_M5,
		    AWVALID_M5,

		    // write data channel _M5
		    WREADY_M5,
		    
		    WID_M5,
		    WDATA_M5,
		    WLAST_M5,
		    WVALID_M5,

		    // write response channel _M5
		    BID_M5,
		    BRESP_M5,
		    BVALID_M5,

		    BREADY_M5,

		    // write address channel _M6
		    AWREADY_M6,

		    AWID_M6,
		    AWADDR_M6,
		    AWLEN_M6,
		    AWSIZE_M6,
		    AWBURST_M6,
		    AWVALID_M6,

		    // write data channel _M6
		    WREADY_M6,
		    
		    WID_M6,
		    WDATA_M6,
		    WLAST_M6,
		    WVALID_M6,

		    // write response channel _M6
		    BID_M6,
		    BRESP_M6,
		    BVALID_M6,

		    BREADY_M6,

		    // write address channel _M7
		    AWREADY_M7,

		    AWID_M7,
		    AWADDR_M7,
		    AWLEN_M7,
		    AWSIZE_M7,
		    AWBURST_M7,
		    AWVALID_M7,

		    // write data channel _M7
		    WREADY_M7,
		    
		    WID_M7,
		    WDATA_M7,
		    WLAST_M7,
		    WVALID_M7,

		    // write response channel _M7
		    BID_M7,
		    BRESP_M7,
		    BVALID_M7,

		    BREADY_M7,

		    // write address channel _M8
		    AWREADY_M8,

		    AWID_M8,
		    AWADDR_M8,
		    AWLEN_M8,
		    AWSIZE_M8,
		    AWBURST_M8,
		    AWVALID_M8,

		    // write data channel _M8
		    WREADY_M8,
		    
		    WID_M8,
		    WDATA_M8,
		    WLAST_M8,
		    WVALID_M8,

		    // write response channel _M8
		    BID_M8,
		    BRESP_M8,
		    BVALID_M8,

		    BREADY_M8,

		    // write address channel _M9
		    AWREADY_M9,

		    AWID_M9,
		    AWADDR_M9,
		    AWLEN_M9,
		    AWSIZE_M9,
		    AWBURST_M9,
		    AWVALID_M9,

		    // write data channel _M9
		    WREADY_M9,
		    
		    WID_M9,
		    WDATA_M9,
		    WLAST_M9,
		    WVALID_M9,

		    // write response channel _M9
		    BID_M9,
		    BRESP_M9,
		    BVALID_M9,

		    BREADY_M9,

		    // write address channel _M10
		    AWREADY_M10,

		    AWID_M10,
		    AWADDR_M10,
		    AWLEN_M10,
		    AWSIZE_M10,
		    AWBURST_M10,
		    AWVALID_M10,

		    // write data channel _M10
		    WREADY_M10,
		    
		    WID_M10,
		    WDATA_M10,
		    WLAST_M10,
		    WVALID_M10,

		    // write response channel _M10
		    BID_M10,
		    BRESP_M10,
		    BVALID_M10,

		    BREADY_M10,

		    // write address channel _M11
		    AWREADY_M11,

		    AWID_M11,
		    AWADDR_M11,
		    AWLEN_M11,
		    AWSIZE_M11,
		    AWBURST_M11,
		    AWVALID_M11,

		    // write data channel _M11
		    WREADY_M11,
		    
		    WID_M11,
		    WDATA_M11,
		    WLAST_M11,
		    WVALID_M11,

		    // write response channel _M11
		    BID_M11,
		    BRESP_M11,
		    BVALID_M11,

		    BREADY_M11,

		    // write address channel _M12
		    AWREADY_M12,

		    AWID_M12,
		    AWADDR_M12,
		    AWLEN_M12,
		    AWSIZE_M12,
		    AWBURST_M12,
		    AWVALID_M12,

		    // write data channel _M12
		    WREADY_M12,
		    
		    WID_M12,
		    WDATA_M12,
		    WLAST_M12,
		    WVALID_M12,

		    // write response channel _M12
		    BID_M12,
		    BRESP_M12,
		    BVALID_M12,

		    BREADY_M12,

		    // write address channel _M13
		    AWREADY_M13,

		    AWID_M13,
		    AWADDR_M13,
		    AWLEN_M13,
		    AWSIZE_M13,
		    AWBURST_M13,
		    AWVALID_M13,

		    // write data channel _M13
		    WREADY_M13,
		    
		    WID_M13,
		    WDATA_M13,
		    WLAST_M13,
		    WVALID_M13,

		    // write response channel _M13
		    BID_M13,
		    BRESP_M13,
		    BVALID_M13,

		    BREADY_M13,

		    // write address channel _M14
		    AWREADY_M14,

		    AWID_M14,
		    AWADDR_M14,
		    AWLEN_M14,
		    AWSIZE_M14,
		    AWBURST_M14,
		    AWVALID_M14,

		    // write data channel _M14
		    WREADY_M14,
		    
		    WID_M14,
		    WDATA_M14,
		    WLAST_M14,
		    WVALID_M14,

		    // write response channel _M14
		    BID_M14,
		    BRESP_M14,
		    BVALID_M14,

		    BREADY_M14,

		    // write address channel _M15
		    AWREADY_M15,

		    AWID_M15,
		    AWADDR_M15,
		    AWLEN_M15,
		    AWSIZE_M15,
		    AWBURST_M15,
		    AWVALID_M15,

		    // write data channel _M15
		    WREADY_M15,
		    
		    WID_M15,
		    WDATA_M15,
		    WLAST_M15,
		    WVALID_M15,

		    // write response channel _M15
		    BID_M15,
		    BRESP_M15,
		    BVALID_M15,

		    BREADY_M15,

		    // write address channel _S1
		    AWID_S1,
		    AWADDR_S1,
		    AWLEN_S1,
		    AWSIZE_S1,
		    AWBURST_S1,
		    AWVALID_S1,

		    AWREADY_S1,
		    
		    // write data channel _S1
		    WID_S1,
		    WDATA_S1,
		    WLAST_S1,
		    WVALID_S1,

		    WREADY_S1,

		    // write response channel _S1
		    BREADY_S1,

		    BID_S1,
		    BRESP_S1,
		    BVALID_S1,

		    // write address channel _S2
		    AWID_S2,
		    AWADDR_S2,
		    AWLEN_S2,
		    AWSIZE_S2,
		    AWBURST_S2,
		    AWVALID_S2,

		    AWREADY_S2,
		    
		    // write data channel _S2
		    WID_S2,
		    WDATA_S2,
		    WLAST_S2,
		    WVALID_S2,

		    WREADY_S2,

		    // write response channel _S2
		    BREADY_S2,

		    BID_S2,
		    BRESP_S2,
		    BVALID_S2,

		    // write address channel _S3
		    AWID_S3,
		    AWADDR_S3,
		    AWLEN_S3,
		    AWSIZE_S3,
		    AWBURST_S3,
		    AWVALID_S3,

		    AWREADY_S3,
		    
		    // write data channel _S3
		    WID_S3,
		    WDATA_S3,
		    WLAST_S3,
		    WVALID_S3,

		    WREADY_S3,

		    // write response channel _S3
		    BREADY_S3,

		    BID_S3,
		    BRESP_S3,
		    BVALID_S3,

		    // write address channel _S4
		    AWID_S4,
		    AWADDR_S4,
		    AWLEN_S4,
		    AWSIZE_S4,
		    AWBURST_S4,
		    AWVALID_S4,

		    AWREADY_S4,
		    
		    // write data channel _S4
		    WID_S4,
		    WDATA_S4,
		    WLAST_S4,
		    WVALID_S4,

		    WREADY_S4,

		    // write response channel _S4
		    BREADY_S4,

		    BID_S4,
		    BRESP_S4,
		    BVALID_S4,

		    // read address channel _M1
		    ARREADY_M1,
		    ARID_M1,
		    ARADDR_M1,
		    ARBURST_M1,
		    ARSIZE_M1,
		    ARLEN_M1,
		    ARVALID_M1,
		    
		    // read data channel _M1
		    RID_M1,
		    RLAST_M1,
		    RVALID_M1,
		    RREADY_M1,
		    RRESP_M1,
		    RDATA_M1,
		    
		    // read address channel _M2
		    ARREADY_M2,
		    ARID_M2,
		    ARADDR_M2,
		    ARBURST_M2,
		    ARSIZE_M2,
		    ARLEN_M2,
		    ARVALID_M2,
		    
		    // read data channel _M2
		    RID_M2,
		    RLAST_M2,
		    RVALID_M2,
		    RREADY_M2,
		    RRESP_M2,
		    RDATA_M2,
		    
		    // read address channel _M3
		    ARREADY_M3,
		    ARID_M3,
		    ARADDR_M3,
		    ARBURST_M3,
		    ARSIZE_M3,
		    ARLEN_M3,
		    ARVALID_M3,
		    
		    // read data channel _M3
		    RID_M3,
		    RLAST_M3,
		    RVALID_M3,
		    RREADY_M3,
		    RRESP_M3,
		    RDATA_M3,
		    
		    // read address channel _M4
		    ARREADY_M4,
		    ARID_M4,
		    ARADDR_M4,
		    ARBURST_M4,
		    ARSIZE_M4,
		    ARLEN_M4,
		    ARVALID_M4,
		    
		    // read data channel _M4
		    RID_M4,
		    RLAST_M4,
		    RVALID_M4,
		    RREADY_M4,
		    RRESP_M4,
		    RDATA_M4,

		    // read address channel _M5
		    ARREADY_M5,
		    ARID_M5,
		    ARADDR_M5,
		    ARBURST_M5,
		    ARSIZE_M5,
		    ARLEN_M5,
		    ARVALID_M5,
		    
		    // read data channel _M5
		    RID_M5,
		    RLAST_M5,
		    RVALID_M5,
		    RREADY_M5,
		    RRESP_M5,
		    RDATA_M5,

		    // read address channel _M6
		    ARREADY_M6,
		    ARID_M6,
		    ARADDR_M6,
		    ARBURST_M6,
		    ARSIZE_M6,
		    ARLEN_M6,
		    ARVALID_M6,
		    
		    // read data channel _M6
		    RID_M6,
		    RLAST_M6,
		    RVALID_M6,
		    RREADY_M6,
		    RRESP_M6,
		    RDATA_M6,

		    // read address channel _M7
		    ARREADY_M7,
		    ARID_M7,
		    ARADDR_M7,
		    ARBURST_M7,
		    ARSIZE_M7,
		    ARLEN_M7,
		    ARVALID_M7,
		    
		    // read data channel _M7
		    RID_M7,
		    RLAST_M7,
		    RVALID_M7,
		    RREADY_M7,
		    RRESP_M7,
		    RDATA_M7,

		    // read address channel _M8
		    ARREADY_M8,
		    ARID_M8,
		    ARADDR_M8,
		    ARBURST_M8,
		    ARSIZE_M8,
		    ARLEN_M8,
		    ARVALID_M8,
		    
		    // read data channel _M8
		    RID_M8,
		    RLAST_M8,
		    RVALID_M8,
		    RREADY_M8,
		    RRESP_M8,
		    RDATA_M8,

		    // read address channel _M9
		    ARREADY_M9,
		    ARID_M9,
		    ARADDR_M9,
		    ARBURST_M9,
		    ARSIZE_M9,
		    ARLEN_M9,
		    ARVALID_M9,
		    
		    // read data channel _M9
		    RID_M9,
		    RLAST_M9,
		    RVALID_M9,
		    RREADY_M9,
		    RRESP_M9,
		    RDATA_M9,

		    // read address channel _M10
		    ARREADY_M10,
		    ARID_M10,
		    ARADDR_M10,
		    ARBURST_M10,
		    ARSIZE_M10,
		    ARLEN_M10,
		    ARVALID_M10,
		    
		    // read data channel _M10
		    RID_M10,
		    RLAST_M10,
		    RVALID_M10,
		    RREADY_M10,
		    RRESP_M10,
		    RDATA_M10,

		    // read address channel _M11
		    ARREADY_M11,
		    ARID_M11,
		    ARADDR_M11,
		    ARBURST_M11,
		    ARSIZE_M11,
		    ARLEN_M11,
		    ARVALID_M11,
		    
		    // read data channel _M11
		    RID_M11,
		    RLAST_M11,
		    RVALID_M11,
		    RREADY_M11,
		    RRESP_M11,
		    RDATA_M11,

		    // read address channel _M12
		    ARREADY_M12,
		    ARID_M12,
		    ARADDR_M12,
		    ARBURST_M12,
		    ARSIZE_M12,
		    ARLEN_M12,
		    ARVALID_M12,
		    
		    // read data channel _M12
		    RID_M12,
		    RLAST_M12,
		    RVALID_M12,
		    RREADY_M12,
		    RRESP_M12,
		    RDATA_M12,

		    // read address channel _M13
		    ARREADY_M13,
		    ARID_M13,
		    ARADDR_M13,
		    ARBURST_M13,
		    ARSIZE_M13,
		    ARLEN_M13,
		    ARVALID_M13,
		    
		    // read data channel _M13
		    RID_M13,
		    RLAST_M13,
		    RVALID_M13,
		    RREADY_M13,
		    RRESP_M13,
		    RDATA_M13,

		    // read address channel _M14
		    ARREADY_M14,
		    ARID_M14,
		    ARADDR_M14,
		    ARBURST_M14,
		    ARSIZE_M14,
		    ARLEN_M14,
		    ARVALID_M14,
		    
		    // read data channel _M14
		    RID_M14,
		    RLAST_M14,
		    RVALID_M14,
		    RREADY_M14,
		    RRESP_M14,
		    RDATA_M14,

		    // read address channel _M15
		    ARREADY_M15,
		    ARID_M15,
		    ARADDR_M15,
		    ARBURST_M15,
		    ARSIZE_M15,
		    ARLEN_M15,
		    ARVALID_M15,
		    
		    // read data channel _M15
		    RID_M15,
		    RLAST_M15,
		    RVALID_M15,
		    RREADY_M15,
		    RRESP_M15,
		    RDATA_M15,

		    // read address channel _S1
		    ARREADY_S1,
		    ARID_S1,
		    ARADDR_S1,
		    ARBURST_S1,
		    ARSIZE_S1,
		    ARLEN_S1,
		    ARVALID_S1,
		    
		    // read data channel _S1
		    RID_S1,
		    RLAST_S1,
		    RVALID_S1,
		    RRESP_S1,
		    RDATA_S1,
		    RREADY_S1,

		    // read address channel _S2
		    ARREADY_S2,
		    ARID_S2,
		    ARADDR_S2,
		    ARBURST_S2,
		    ARSIZE_S2,
		    ARLEN_S2,
		    ARVALID_S2,
		    
		    // read data channel _S2
		    RID_S2,
		    RLAST_S2,
		    RVALID_S2,
		    RRESP_S2,
		    RDATA_S2,
		    RREADY_S2,

		    // read address channel _S3
		    ARREADY_S3,
		    ARID_S3,
		    ARADDR_S3,
		    ARBURST_S3,
		    ARSIZE_S3,
		    ARLEN_S3,
		    ARVALID_S3,
		    
		    // read data channel _S3
		    RID_S3,
		    RLAST_S3,
		    RVALID_S3,
		    RRESP_S3,
		    RDATA_S3,
		    RREADY_S3,

		    // read address channel _S4
		    ARREADY_S4,
		    ARID_S4,
		    ARADDR_S4,
		    ARBURST_S4,
		    ARSIZE_S4,
		    ARLEN_S4,
		    ARVALID_S4,
		    
		    // read data channel _S4
		    RID_S4,
		    RLAST_S4,
		    RVALID_S4,
		    RRESP_S4,
		    RDATA_S4,
		    RREADY_S4
		    );
   
   // Core control signals
   input ack;
   input reset;	// global reset signal, Active low

   // write address channel _M1
   output 	 AWREADY_M1;
   
   input [3:0] 	 AWID_M1;
   input [31:0]  AWADDR_M1;
   input [3:0] 	 AWLEN_M1;
   input [2:0] 	 AWSIZE_M1;
   input [1:0] 	 AWBURST_M1;
   input 	 AWVALID_M1;

   // write data channel _M1
   output 	 WREADY_M1;
   
   input [3:0] 	 WID_M1;
   input [31:0]  WDATA_M1;
   input 	 WLAST_M1;
   input 	 WVALID_M1;
   
   // write response channel _M1
   output [3:0]  BID_M1;
   output [1:0]  BRESP_M1;
   output 	 BVALID_M1;
   
   input 	 BREADY_M1;

   // write address channel _M2
   output 	 AWREADY_M2;
   
   input [3:0] 	 AWID_M2;
   input [31:0]  AWADDR_M2;
   input [3:0] 	 AWLEN_M2;
   input [2:0] 	 AWSIZE_M2;
   input [1:0] 	 AWBURST_M2;
   input 	 AWVALID_M2;

   // write data channel _M2
   output 	 WREADY_M2;
   
   input [3:0] 	 WID_M2;
   input [31:0]  WDATA_M2;
   input 	 WLAST_M2;
   input 	 WVALID_M2;
   
   // write response channel _M2
   output [3:0]  BID_M2;
   output [1:0]  BRESP_M2;
   output 	 BVALID_M2;
   
   input 	 BREADY_M2;

   // write address channel _M3
   output        AWREADY_M3;
   
   input [3:0] 	 AWID_M3;
   input [31:0]  AWADDR_M3;
   input [3:0] 	 AWLEN_M3;
   input [2:0] 	 AWSIZE_M3;
   input [1:0] 	 AWBURST_M3;
   input 	 AWVALID_M3;

   // write data channel _M3
   output 	 WREADY_M3;
   
   input [3:0] 	 WID_M3;
   input [31:0]  WDATA_M3;
   input 	 WLAST_M3;
   input 	 WVALID_M3;
   
   // write response channel _M3
   output [3:0]  BID_M3;
   output [1:0]  BRESP_M3;
   output 	 BVALID_M3;
   
   input 	 BREADY_M3;

   // write address channel _M4
   output        AWREADY_M4;
   
   input [3:0] 	 AWID_M4;
   input [31:0]  AWADDR_M4;
   input [3:0] 	 AWLEN_M4;
   input [2:0] 	 AWSIZE_M4;
   input [1:0] 	 AWBURST_M4;
   input 	 AWVALID_M4;

   // write data channel _M4
   output 	 WREADY_M4;
   
   input [3:0] 	 WID_M4;
   input [31:0]  WDATA_M4;
   input 	 WLAST_M4;
   input 	 WVALID_M4;
   
   // write response channel _M4
   output [3:0]  BID_M4;
   output [1:0]  BRESP_M4;
   output 	 BVALID_M4;
   
   input 	 BREADY_M4;

   // write address channel _M5
   output        AWREADY_M5;
   
   input [3:0] 	 AWID_M5;
   input [31:0]  AWADDR_M5;
   input [3:0] 	 AWLEN_M5;
   input [2:0] 	 AWSIZE_M5;
   input [1:0] 	 AWBURST_M5;
   input 	 AWVALID_M5;

   // write data channel _M5
   output 	 WREADY_M5;
   
   input [3:0] 	 WID_M5;
   input [31:0]  WDATA_M5;
   input 	 WLAST_M5;
   input 	 WVALID_M5;
   
   // write response channel _M5
   output [3:0]  BID_M5;
   output [1:0]  BRESP_M5;
   output 	 BVALID_M5;
   
   input 	 BREADY_M5;

   // write address channel _M6
   output        AWREADY_M6;
   
   input [3:0] 	 AWID_M6;
   input [31:0]  AWADDR_M6;
   input [3:0] 	 AWLEN_M6;
   input [2:0] 	 AWSIZE_M6;
   input [1:0] 	 AWBURST_M6;
   input 	 AWVALID_M6;

   // write data channel _M6
   output 	 WREADY_M6;
   
   input [3:0] 	 WID_M6;
   input [31:0]  WDATA_M6;
   input 	 WLAST_M6;
   input 	 WVALID_M6;
   
   // write response channel _M6
   output [3:0]  BID_M6;
   output [1:0]  BRESP_M6;
   output 	 BVALID_M6;
   
   input 	 BREADY_M6;

   // write address channel _M7
   output        AWREADY_M7;
   
   input [3:0] 	 AWID_M7;
   input [31:0]  AWADDR_M7;
   input [3:0] 	 AWLEN_M7;
   input [2:0] 	 AWSIZE_M7;
   input [1:0] 	 AWBURST_M7;
   input 	 AWVALID_M7;

   // write data channel _M7
   output 	 WREADY_M7;
   
   input [3:0] 	 WID_M7;
   input [31:0]  WDATA_M7;
   input 	 WLAST_M7;
   input 	 WVALID_M7;
   
   // write response channel _M7
   output [3:0]  BID_M7;
   output [1:0]  BRESP_M7;
   output 	 BVALID_M7;
   
   input 	 BREADY_M7;

   // write address channel _M8
   output        AWREADY_M8;
   
   input [3:0] 	 AWID_M8;
   input [31:0]  AWADDR_M8;
   input [3:0] 	 AWLEN_M8;
   input [2:0] 	 AWSIZE_M8;
   input [1:0] 	 AWBURST_M8;
   input 	 AWVALID_M8;

   // write data channel _M8
   output 	 WREADY_M8;
   
   input [3:0] 	 WID_M8;
   input [31:0]  WDATA_M8;
   input 	 WLAST_M8;
   input 	 WVALID_M8;
   
   // write response channel _M8
   output [3:0]  BID_M8;
   output [1:0]  BRESP_M8;
   output 	 BVALID_M8;
   
   input 	 BREADY_M8;

   // write address channel _M9
   output        AWREADY_M9;
   
   input [3:0] 	 AWID_M9;
   input [31:0]  AWADDR_M9;
   input [3:0] 	 AWLEN_M9;
   input [2:0] 	 AWSIZE_M9;
   input [1:0] 	 AWBURST_M9;
   input 	 AWVALID_M9;

   // write data channel _M9
   output 	 WREADY_M9;
   
   input [3:0] 	 WID_M9;
   input [31:0]  WDATA_M9;
   input 	 WLAST_M9;
   input 	 WVALID_M9;
   
   // write response channel _M9
   output [3:0]  BID_M9;
   output [1:0]  BRESP_M9;
   output 	 BVALID_M9;
   
   input 	 BREADY_M9;

   // write address channel _M10
   output        AWREADY_M10;
   
   input [3:0] 	 AWID_M10;
   input [31:0]  AWADDR_M10;
   input [3:0] 	 AWLEN_M10;
   input [2:0] 	 AWSIZE_M10;
   input [1:0] 	 AWBURST_M10;
   input 	 AWVALID_M10;

   // write data channel _M10
   output 	 WREADY_M10;
   
   input [3:0] 	 WID_M10;
   input [31:0]  WDATA_M10;
   input 	 WLAST_M10;
   input 	 WVALID_M10;
   
   // write response channel _M10
   output [3:0]  BID_M10;
   output [1:0]  BRESP_M10;
   output 	 BVALID_M10;
   
   input 	 BREADY_M10;

   // write address channel _M11
   output        AWREADY_M11;
   
   input [3:0] 	 AWID_M11;
   input [31:0]  AWADDR_M11;
   input [3:0] 	 AWLEN_M11;
   input [2:0] 	 AWSIZE_M11;
   input [1:0] 	 AWBURST_M11;
   input 	 AWVALID_M11;

   // write data channel _M11
   output 	 WREADY_M11;
   
   input [3:0] 	 WID_M11;
   input [31:0]  WDATA_M11;
   input 	 WLAST_M11;
   input 	 WVALID_M11;
   
   // write response channel _M11
   output [3:0]  BID_M11;
   output [1:0]  BRESP_M11;
   output 	 BVALID_M11;
   
   input 	 BREADY_M11;

   // write address channel _M12
   output        AWREADY_M12;
   
   input [3:0] 	 AWID_M12;
   input [31:0]  AWADDR_M12;
   input [3:0] 	 AWLEN_M12;
   input [2:0] 	 AWSIZE_M12;
   input [1:0] 	 AWBURST_M12;
   input 	 AWVALID_M12;

   // write data channel _M12
   output 	 WREADY_M12;
   
   input [3:0] 	 WID_M12;
   input [31:0]  WDATA_M12;
   input 	 WLAST_M12;
   input 	 WVALID_M12;
   
   // write response channel _M12
   output [3:0]  BID_M12;
   output [1:0]  BRESP_M12;
   output 	 BVALID_M12;
   
   input 	 BREADY_M12;

   // write address channel _M13
   output        AWREADY_M13;
   
   input [3:0] 	 AWID_M13;
   input [31:0]  AWADDR_M13;
   input [3:0] 	 AWLEN_M13;
   input [2:0] 	 AWSIZE_M13;
   input [1:0] 	 AWBURST_M13;
   input 	 AWVALID_M13;

   // write data channel _M13
   output 	 WREADY_M13;
   
   input [3:0] 	 WID_M13;
   input [31:0]  WDATA_M13;
   input 	 WLAST_M13;
   input 	 WVALID_M13;
   
   // write response channel _M13
   output [3:0]  BID_M13;
   output [1:0]  BRESP_M13;
   output 	 BVALID_M13;
   
   input 	 BREADY_M13;

   // write address channel _M14
   output        AWREADY_M14;
   
   input [3:0] 	 AWID_M14;
   input [31:0]  AWADDR_M14;
   input [3:0] 	 AWLEN_M14;
   input [2:0] 	 AWSIZE_M14;
   input [1:0] 	 AWBURST_M14;
   input 	 AWVALID_M14;

   // write data channel _M14
   output 	 WREADY_M14;
   
   input [3:0] 	 WID_M14;
   input [31:0]  WDATA_M14;
   input 	 WLAST_M14;
   input 	 WVALID_M14;
   
   // write response channel _M14
   output [3:0]  BID_M14;
   output [1:0]  BRESP_M14;
   output 	 BVALID_M14;
   
   input 	 BREADY_M14;

   // write address channel _M15
   output        AWREADY_M15;
   
   input [3:0] 	 AWID_M15;
   input [31:0]  AWADDR_M15;
   input [3:0] 	 AWLEN_M15;
   input [2:0] 	 AWSIZE_M15;
   input [1:0] 	 AWBURST_M15;
   input 	 AWVALID_M15;

   // write data channel _M15
   output 	 WREADY_M15;
   
   input [3:0] 	 WID_M15;
   input [31:0]  WDATA_M15;
   input 	 WLAST_M15;
   input 	 WVALID_M15;
   
   // write response channel _M15
   output [3:0]  BID_M15;
   output [1:0]  BRESP_M15;
   output 	 BVALID_M15;
   
   input 	 BREADY_M15;

   // write address channel _S1
   output [3:0]  AWID_S1;
   output [31:0] AWADDR_S1;
   output [3:0]  AWLEN_S1;
   output [2:0]  AWSIZE_S1;
   output [1:0]  AWBURST_S1;
   output    	 AWVALID_S1;

   input 	 AWREADY_S1;
		    
   // write data channel _S1
   output [3:0]  WID_S1;
   output [31:0] WDATA_S1;
   output 	 WLAST_S1;
   output 	 WVALID_S1;
   
   input 	 WREADY_S1;

   // write response channel _S1
   output 	 BREADY_S1;
   
   input [3:0] 	 BID_S1;
   input [1:0] 	 BRESP_S1;
   input 	 BVALID_S1;

   // write address channel _S2
   output [3:0]  AWID_S2;
   output [31:0] AWADDR_S2;
   output [3:0]  AWLEN_S2;
   output [2:0]  AWSIZE_S2;
   output [1:0]  AWBURST_S2;
   output    	 AWVALID_S2;

   input 	 AWREADY_S2;
		    
   // write data channel _S2
   output [3:0]  WID_S2;
   output [31:0] WDATA_S2;
   output 	 WLAST_S2;
   output 	 WVALID_S2;
   
   input 	 WREADY_S2;

   // write response channel _S2
   output 	 BREADY_S2;
   
   input [3:0] 	 BID_S2;
   input [1:0] 	 BRESP_S2;
   input 	 BVALID_S2;

   // write address channel _S3
   output [3:0]  AWID_S3;
   output [31:0] AWADDR_S3;
   output [3:0]  AWLEN_S3;
   output [2:0]  AWSIZE_S3;
   output [1:0]  AWBURST_S3;
   output    	 AWVALID_S3;

   input 	 AWREADY_S3;
		    
   // write data channel _S3
   output [3:0]  WID_S3;
   output [31:0] WDATA_S3;
   output 	 WLAST_S3;
   output 	 WVALID_S3;
   
   input 	 WREADY_S3;

   // write response channel _S3
   output 	 BREADY_S3;
   
   input [3:0] 	 BID_S3;
   input [1:0] 	 BRESP_S3;
   input 	 BVALID_S3;

   // write address channel _S4
   output [3:0]  AWID_S4;
   output [31:0] AWADDR_S4;
   output [3:0]  AWLEN_S4;
   output [2:0]  AWSIZE_S4;
   output [1:0]  AWBURST_S4;
   output    	 AWVALID_S4;

   input 	 AWREADY_S4;
		    
   // write data channel _S4
   output [3:0]  WID_S4;
   output [31:0] WDATA_S4;
   output 	 WLAST_S4;
   output 	 WVALID_S4;
   
   input 	 WREADY_S4;

   // write response channel _S4
   output 	 BREADY_S4;
   
   input [3:0] 	 BID_S4;
   input [1:0] 	 BRESP_S4;
   input 	 BVALID_S4;

   // read address channel _M1
   // outputs
   output 	ARREADY_M1;
   // inputs
   input [3:0] 	ARID_M1;
   input [31:0] ARADDR_M1;
   input [2:0] 	ARSIZE_M1;
   input [1:0] 	ARBURST_M1;
   input [3:0] 	ARLEN_M1;
   input 	ARVALID_M1;
   
   // read data channel _M1
   // outputs
   output [3:0] RID_M1;
   output 	RLAST_M1;
   output 	RVALID_M1;
   output [1:0] RRESP_M1;
   output [31:0] RDATA_M1;
   // inputs
   input 	RREADY_M1;

   // read address channel _M2
   // outputs
   output 	ARREADY_M2;
   // inputs
   input [3:0] 	ARID_M2;
   input [31:0] ARADDR_M2;
   input [2:0] 	ARSIZE_M2;
   input [1:0] 	ARBURST_M2;
   input [3:0] 	ARLEN_M2;
   input 	ARVALID_M2;
   
   // read data channel _M2
   // outputs
   output [3:0] RID_M2;
   output 	RLAST_M2;
   output 	RVALID_M2;
   output [1:0] RRESP_M2;
   output [31:0] RDATA_M2;
   // inputs
   input 	RREADY_M2;

   // read address channel _M3
   // outputs
   output 	ARREADY_M3;
   // inputs
   input [3:0] 	ARID_M3;
   input [31:0] ARADDR_M3;
   input [2:0] 	ARSIZE_M3;
   input [1:0] 	ARBURST_M3;
   input [3:0] 	ARLEN_M3;
   input 	ARVALID_M3;
   
   // read data channel _M3
   // outputs
   output [3:0] RID_M3;
   output 	RLAST_M3;
   output 	RVALID_M3;
   output [1:0] RRESP_M3;
   output [31:0] RDATA_M3;
   // inputs
   input 	RREADY_M3;
   
   // read address channel _M4
   // outputs
   output 	ARREADY_M4;
   // inputs
   input [3:0] 	ARID_M4;
   input [31:0] ARADDR_M4;
   input [2:0] 	ARSIZE_M4;
   input [1:0] 	ARBURST_M4;
   input [3:0] 	ARLEN_M4;
   input 	ARVALID_M4;
   
   // read data channel _M4
   // outputs
   output [3:0] RID_M4;
   output 	RLAST_M4;
   output 	RVALID_M4;
   output [1:0] RRESP_M4;
   output [31:0] RDATA_M4;
   // inputs
   input 	RREADY_M4;

   // read address channel _M5
   // outputs
   output 	ARREADY_M5;
   // inputs
   input [3:0] 	ARID_M5;
   input [31:0] ARADDR_M5;
   input [2:0] 	ARSIZE_M5;
   input [1:0] 	ARBURST_M5;
   input [3:0] 	ARLEN_M5;
   input 	ARVALID_M5;
   
   // read data channel _M5
   // outputs
   output [3:0] RID_M5;
   output 	RLAST_M5;
   output 	RVALID_M5;
   output [1:0] RRESP_M5;
   output [31:0] RDATA_M5;
   // inputs
   input 	RREADY_M5;

   // read address channel _M6
   // outputs
   output 	ARREADY_M6;
   // inputs
   input [3:0] 	ARID_M6;
   input [31:0] ARADDR_M6;
   input [2:0] 	ARSIZE_M6;
   input [1:0] 	ARBURST_M6;
   input [3:0] 	ARLEN_M6;
   input 	ARVALID_M6;
   
   // read data channel _M6
   // outputs
   output [3:0] RID_M6;
   output 	RLAST_M6;
   output 	RVALID_M6;
   output [1:0] RRESP_M6;
   output [31:0] RDATA_M6;
   // inputs
   input 	RREADY_M6;

   // read address channel _M7
   // outputs
   output 	ARREADY_M7;
   // inputs
   input [3:0] 	ARID_M7;
   input [31:0] ARADDR_M7;
   input [2:0] 	ARSIZE_M7;
   input [1:0] 	ARBURST_M7;
   input [3:0] 	ARLEN_M7;
   input 	ARVALID_M7;
   
   // read data channel _M7
   // outputs
   output [3:0] RID_M7;
   output 	RLAST_M7;
   output 	RVALID_M7;
   output [1:0] RRESP_M7;
   output [31:0] RDATA_M7;
   // inputs
   input 	RREADY_M7;

   // read address channel _M8
   // outputs
   output 	ARREADY_M8;
   // inputs
   input [3:0] 	ARID_M8;
   input [31:0] ARADDR_M8;
   input [2:0] 	ARSIZE_M8;
   input [1:0] 	ARBURST_M8;
   input [3:0] 	ARLEN_M8;
   input 	ARVALID_M8;
   
   // read data channel _M8
   // outputs
   output [3:0] RID_M8;
   output 	RLAST_M8;
   output 	RVALID_M8;
   output [1:0] RRESP_M8;
   output [31:0] RDATA_M8;
   // inputs
   input 	RREADY_M8;

   // read address channel _M9
   // outputs
   output 	ARREADY_M9;
   // inputs
   input [3:0] 	ARID_M9;
   input [31:0] ARADDR_M9;
   input [2:0] 	ARSIZE_M9;
   input [1:0] 	ARBURST_M9;
   input [3:0] 	ARLEN_M9;
   input 	ARVALID_M9;
   
   // read data channel _M9
   // outputs
   output [3:0] RID_M9;
   output 	RLAST_M9;
   output 	RVALID_M9;
   output [1:0] RRESP_M9;
   output [31:0] RDATA_M9;
   // inputs
   input 	RREADY_M9;

   // read address channel _M10
   // outputs
   output 	ARREADY_M10;
   // inputs
   input [3:0] 	ARID_M10;
   input [31:0] ARADDR_M10;
   input [2:0] 	ARSIZE_M10;
   input [1:0] 	ARBURST_M10;
   input [3:0] 	ARLEN_M10;
   input 	ARVALID_M10;
   
   // read data channel _M10
   // outputs
   output [3:0] RID_M10;
   output 	RLAST_M10;
   output 	RVALID_M10;
   output [1:0] RRESP_M10;
   output [31:0] RDATA_M10;
   // inputs
   input 	RREADY_M10;

   // read address channel _M11
   // outputs
   output 	ARREADY_M11;
   // inputs
   input [3:0] 	ARID_M11;
   input [31:0] ARADDR_M11;
   input [2:0] 	ARSIZE_M11;
   input [1:0] 	ARBURST_M11;
   input [3:0] 	ARLEN_M11;
   input 	ARVALID_M11;
   
   // read data channel _M11
   // outputs
   output [3:0] RID_M11;
   output 	RLAST_M11;
   output 	RVALID_M11;
   output [1:0] RRESP_M11;
   output [31:0] RDATA_M11;
   // inputs
   input 	RREADY_M11;

   // read address channel _M12
   // outputs
   output 	ARREADY_M12;
   // inputs
   input [3:0] 	ARID_M12;
   input [31:0] ARADDR_M12;
   input [2:0] 	ARSIZE_M12;
   input [1:0] 	ARBURST_M12;
   input [3:0] 	ARLEN_M12;
   input 	ARVALID_M12;
   
   // read data channel _M12
   // outputs
   output [3:0] RID_M12;
   output 	RLAST_M12;
   output 	RVALID_M12;
   output [1:0] RRESP_M12;
   output [31:0] RDATA_M12;
   // inputs
   input 	RREADY_M12;

   // read address channel _M13
   // outputs
   output 	ARREADY_M13;
   // inputs
   input [3:0] 	ARID_M13;
   input [31:0] ARADDR_M13;
   input [2:0] 	ARSIZE_M13;
   input [1:0] 	ARBURST_M13;
   input [3:0] 	ARLEN_M13;
   input 	ARVALID_M13;
   
   // read data channel _M13
   // outputs
   output [3:0] RID_M13;
   output 	RLAST_M13;
   output 	RVALID_M13;
   output [1:0] RRESP_M13;
   output [31:0] RDATA_M13;
   // inputs
   input 	RREADY_M13;

   // read address channel _M14
   // outputs
   output 	ARREADY_M14;
   // inputs
   input [3:0] 	ARID_M14;
   input [31:0] ARADDR_M14;
   input [2:0] 	ARSIZE_M14;
   input [1:0] 	ARBURST_M14;
   input [3:0] 	ARLEN_M14;
   input 	ARVALID_M14;
   
   // read data channel _M14
   // outputs
   output [3:0] RID_M14;
   output 	RLAST_M14;
   output 	RVALID_M14;
   output [1:0] RRESP_M14;
   output [31:0] RDATA_M14;
   // inputs
   input 	RREADY_M14;

   // read address channel _M15
   // outputs
   output 	ARREADY_M15;
   // inputs
   input [3:0] 	ARID_M15;
   input [31:0] ARADDR_M15;
   input [2:0] 	ARSIZE_M15;
   input [1:0] 	ARBURST_M15;
   input [3:0] 	ARLEN_M15;
   input 	ARVALID_M15;
   
   // read data channel _M15
   // outputs
   output [3:0] RID_M15;
   output 	RLAST_M15;
   output 	RVALID_M15;
   output [1:0] RRESP_M15;
   output [31:0] RDATA_M15;
   // inputs
   input 	RREADY_M15;

   // read address channel _S1
   // inputs
   input 	 ARREADY_S1;
   // outputs
   output [3:0]  ARID_S1;
   output [31:0] ARADDR_S1;
   output [2:0]  ARSIZE_S1;
   output [1:0]  ARBURST_S1;
   output [3:0]  ARLEN_S1;
   output 	 ARVALID_S1;
   
   // read data channel _S1
   // inputs
   input [3:0] 	 RID_S1;
   input 	 RLAST_S1;
   input 	 RVALID_S1;
   input [1:0] 	 RRESP_S1;
   input [31:0]  RDATA_S1;
   // outputs
   output 	 RREADY_S1;

   // read address channel _S2
   // inputs
   input 	 ARREADY_S2;
   // outputs
   output [3:0]  ARID_S2;
   output [31:0] ARADDR_S2;
   output [2:0]  ARSIZE_S2;
   output [1:0]  ARBURST_S2;
   output [3:0]  ARLEN_S2;
   output 	 ARVALID_S2;
   
   // read data channel _S2
   // inputs
   input [3:0] 	 RID_S2;
   input 	 RLAST_S2;
   input 	 RVALID_S2;
   input [1:0] 	 RRESP_S2;
   input [31:0]  RDATA_S2;
   // outputs
   output 	 RREADY_S2;

   // read address channel _S3
   // inputs
   input 	 ARREADY_S3;
   // outputs
   output [3:0]  ARID_S3;
   output [31:0] ARADDR_S3;
   output [2:0]  ARSIZE_S3;
   output [1:0]  ARBURST_S3;
   output [3:0]  ARLEN_S3;
   output 	 ARVALID_S3;
   
   // read data channel _S3
   // inputs
   input [3:0] 	 RID_S3;
   input 	 RLAST_S3;
   input 	 RVALID_S3;
   input [1:0] 	 RRESP_S3;
   input [31:0]  RDATA_S3;
   // outputs
   output 	 RREADY_S3;
   
   // read address channel _S4
   // inputs
   input 	 ARREADY_S4;
   // outputs
   output [3:0]  ARID_S4;
   output [31:0] ARADDR_S4;
   output [2:0]  ARSIZE_S4;
   output [1:0]  ARBURST_S4;
   output [3:0]  ARLEN_S4;
   output 	 ARVALID_S4;
   
   // read data channel _S4
   // inputs
   input [3:0] 	 RID_S4;
   input 	 RLAST_S4;
   input 	 RVALID_S4;
   input [31:0]  RDATA_S4;
   input [1:0] 	 RRESP_S4;
   // outputs
   output 	 RREADY_S4;

   //-------------------------------------------------------------------------
   // Signal definitions
   //-------------------------------------------------------------------------

   // write address channel _M1
   reg 		 AWREADY_M1;
   
   // write data channel _M1
   reg 		 WREADY_M1;
   
   // write response channel _M1
   reg [3:0] 	 BID_M1;
   reg [1:0] 	 BRESP_M1;
   reg 		 BVALID_M1;

   // write address channel _M2
   reg 		 AWREADY_M2;

   // write data channel _M2
   reg 		 WREADY_M2;
   
   // write response channel _M2
   reg [3:0] 	 BID_M2;
   reg [1:0] 	 BRESP_M2;
   reg 		 BVALID_M2;

   // write address channel _M3
   reg 		 AWREADY_M3;

   // write data channel _M3
   reg 		 WREADY_M3;
   
   // write response channel _M3
   reg [3:0] 	 BID_M3;
   reg [1:0] 	 BRESP_M3;
   reg 		 BVALID_M3;
   
   // write address channel _M4
   reg 		 AWREADY_M4;

   // write data channel _M4
   reg 		 WREADY_M4;
   
   // write response channel _M4
   reg [3:0] 	 BID_M4;
   reg [1:0] 	 BRESP_M4;
   reg 		 BVALID_M4;

   // write address channel _M5
   reg 		 AWREADY_M5;

   // write data channel _M5
   reg 		 WREADY_M5;
   
   // write response channel _M5
   reg [3:0] 	 BID_M5;
   reg [1:0] 	 BRESP_M5;
   reg 		 BVALID_M5;

   // write address channel _M6
   reg 		 AWREADY_M6;

   // write data channel _M6
   reg 		 WREADY_M6;
   
   // write response channel _M6
   reg [3:0] 	 BID_M6;
   reg [1:0] 	 BRESP_M6;
   reg 		 BVALID_M6;

   // write address channel _M7
   reg 		 AWREADY_M7;

   // write data channel _M7
   reg 		 WREADY_M7;
   
   // write response channel _M7
   reg [3:0] 	 BID_M7;
   reg [1:0] 	 BRESP_M7;
   reg 		 BVALID_M7;

   // write address channel _M8
   reg 		 AWREADY_M8;

   // write data channel _M8
   reg 		 WREADY_M8;
   
   // write response channel _M8
   reg [3:0] 	 BID_M8;
   reg [1:0] 	 BRESP_M8;
   reg 		 BVALID_M8;

   // write address channel _M9
   reg 		 AWREADY_M9;

   // write data channel _M9
   reg 		 WREADY_M9;
   
   // write response channel _M9
   reg [3:0] 	 BID_M9;
   reg [1:0] 	 BRESP_M9;
   reg 		 BVALID_M9;

   // write address channel _M10
   reg 		 AWREADY_M10;

   // write data channel _M10
   reg 		 WREADY_M10;
   
   // write response channel _M10
   reg [3:0] 	 BID_M10;
   reg [1:0] 	 BRESP_M10;
   reg 		 BVALID_M10;

   // write address channel _M11
   reg 		 AWREADY_M11;

   // write data channel _M11
   reg 		 WREADY_M11;
   
   // write response channel _M11
   reg [3:0] 	 BID_M11;
   reg [1:0] 	 BRESP_M11;
   reg 		 BVALID_M11;

   // write address channel _M12
   reg 		 AWREADY_M12;

   // write data channel _M12
   reg 		 WREADY_M12;
   
   // write response channel _M12
   reg [3:0] 	 BID_M12;
   reg [1:0] 	 BRESP_M12;
   reg 		 BVALID_M12;

   // write address channel _M13
   reg 		 AWREADY_M13;

   // write data channel _M13
   reg 		 WREADY_M13;
   
   // write response channel _M13
   reg [3:0] 	 BID_M13;
   reg [1:0] 	 BRESP_M13;
   reg 		 BVALID_M13;

   // write address channel _M14
   reg 		 AWREADY_M14;

   // write data channel _M14
   reg 		 WREADY_M14;
   
   // write response channel _M14
   reg [3:0] 	 BID_M14;
   reg [1:0] 	 BRESP_M14;
   reg 		 BVALID_M14;

   // write address channel _M15
   reg 		 AWREADY_M15;

   // write data channel _M15
   reg 		 WREADY_M15;
   
   // write response channel _M15
   reg [3:0] 	 BID_M15;
   reg [1:0] 	 BRESP_M15;
   reg 		 BVALID_M15;

   // write address channel _S1
   reg [3:0] 	 AWID_S1;
   reg [31:0] 	 AWADDR_S1;
   reg [3:0] 	 AWLEN_S1;
   reg [2:0] 	 AWSIZE_S1;
   reg [1:0] 	 AWBURST_S1;
   reg    	 AWVALID_S1;
   
   // write data channel _S1
   reg [3:0] 	 WID_S1;
   reg [31:0] 	 WDATA_S1;
   reg 		 WLAST_S1;
   reg 		 WVALID_S1;

   // write response channel _S1
   reg 		 BREADY_S1;

   // write address channel _S2
   reg [3:0] 	 AWID_S2;
   reg [31:0] 	 AWADDR_S2;
   reg [3:0] 	 AWLEN_S2;
   reg [2:0] 	 AWSIZE_S2;
   reg [1:0] 	 AWBURST_S2;
   reg    	 AWVALID_S2;
   
   // write data channel _S2
   reg [3:0] 	 WID_S2;
   reg [31:0] 	 WDATA_S2;
   reg 		 WLAST_S2;
   reg 		 WVALID_S2;

   // write response channel _S2
   reg 		 BREADY_S2;

   // write address channel _S3
   reg [3:0] 	 AWID_S3;
   reg [31:0] 	 AWADDR_S3;
   reg [3:0] 	 AWLEN_S3;
   reg [2:0] 	 AWSIZE_S3;
   reg [1:0] 	 AWBURST_S3;
   reg    	 AWVALID_S3;
   
   // write data channel _S3
   reg [3:0] 	 WID_S3;
   reg [31:0] 	 WDATA_S3;
   reg 		 WLAST_S3;
   reg 		 WVALID_S3;

   // write response channel _S3
   reg 		 BREADY_S3;

   // write address channel _S4
   reg [3:0] 	 AWID_S4;
   reg [31:0] 	 AWADDR_S4;
   reg [3:0] 	 AWLEN_S4;
   reg [2:0] 	 AWSIZE_S4;
   reg [1:0] 	 AWBURST_S4;
   reg    	 AWVALID_S4;
   
   // write data channel _S4
   reg [3:0] 	 WID_S4;
   reg [31:0] 	 WDATA_S4;
   reg 		 WLAST_S4;
   reg 		 WVALID_S4;

   // write response channel _S4
   reg 		 BREADY_S4;

   // read address channel _M1
   reg 		 ARREADY_M1;
   
   // read data channel _M1
   reg [3:0] 	 RID_M1;
   reg 		 RLAST_M1;
   reg 		 RVALID_M1;
   reg [1:0] 	 RRESP_M1;
   reg [31:0] 	 RDATA_M1;

   // read address channel _M2
   reg 		 ARREADY_M2;
   
   // read data channel _M2
   // regs
   reg [3:0] 	 RID_M2;
   reg 		 RLAST_M2;
   reg 		 RVALID_M2;
   reg [1:0] 	 RRESP_M2;
   reg [31:0] 	 RDATA_M2;

   // read address channel _M3
   reg 		 ARREADY_M3;
   
   // read data channel _M3
   reg [3:0] 	 RID_M3;
   reg 		 RLAST_M3;
   reg 		 RVALID_M3;
   reg [1:0] 	 RRESP_M3;
   reg [31:0] 	 RDATA_M3;
   
   // read address channel _M4
   reg 		 ARREADY_M4;
   
   // read data channel _M4
   reg [3:0] 	 RID_M4;
   reg 		 RLAST_M4;
   reg 		 RVALID_M4;
   reg [1:0] 	 RRESP_M4;
   reg [31:0] 	 RDATA_M4;

   // read address channel _M5
   reg 		 ARREADY_M5;
   
   // read data channel _M5
   reg [3:0] 	 RID_M5;
   reg 		 RLAST_M5;
   reg 		 RVALID_M5;
   reg [1:0] 	 RRESP_M5;
   reg [31:0] 	 RDATA_M5;

   // read address channel _M6
   reg 		 ARREADY_M6;
   
   // read data channel _M6
   reg [3:0] 	 RID_M6;
   reg 		 RLAST_M6;
   reg 		 RVALID_M6;
   reg [1:0] 	 RRESP_M6;
   reg [31:0] 	 RDATA_M6;

   // read address channel _M7
   reg 		 ARREADY_M7;
   
   // read data channel _M7
   reg [3:0] 	 RID_M7;
   reg 		 RLAST_M7;
   reg 		 RVALID_M7;
   reg [1:0] 	 RRESP_M7;
   reg [31:0] 	 RDATA_M7;

   // read address channel _M8
   reg 		 ARREADY_M8;
   
   // read data channel _M8
   reg [3:0] 	 RID_M8;
   reg 		 RLAST_M8;
   reg 		 RVALID_M8;
   reg [1:0] 	 RRESP_M8;
   reg [31:0] 	 RDATA_M8;

   // read address channel _M9
   reg 		 ARREADY_M9;
   
   // read data channel _M9
   reg [3:0] 	 RID_M9;
   reg 		 RLAST_M9;
   reg 		 RVALID_M9;
   reg [1:0] 	 RRESP_M9;
   reg [31:0] 	 RDATA_M9;

   // read address channel _M10
   reg 		 ARREADY_M10;
   
   // read data channel _M10
   reg [3:0] 	 RID_M10;
   reg 		 RLAST_M10;
   reg 		 RVALID_M10;
   reg [1:0] 	 RRESP_M10;
   reg [31:0] 	 RDATA_M10;

   // read address channel _M11
   reg 		 ARREADY_M11;
   
   // read data channel _M11
   reg [3:0] 	 RID_M11;
   reg 		 RLAST_M11;
   reg 		 RVALID_M11;
   reg [1:0] 	 RRESP_M11;
   reg [31:0] 	 RDATA_M11;

   // read address channel _M12
   reg 		 ARREADY_M12;
   
   // read data channel _M12
   reg [3:0] 	 RID_M12;
   reg 		 RLAST_M12;
   reg 		 RVALID_M12;
   reg [1:0] 	 RRESP_M12;
   reg [31:0] 	 RDATA_M12;

   // read address channel _M13
   reg 		 ARREADY_M13;
   
   // read data channel _M13
   reg [3:0] 	 RID_M13;
   reg 		 RLAST_M13;
   reg 		 RVALID_M13;
   reg [1:0] 	 RRESP_M13;
   reg [31:0] 	 RDATA_M13;

   // read address channel _M14
   reg 		 ARREADY_M14;
   
   // read data channel _M14
   reg [3:0] 	 RID_M14;
   reg 		 RLAST_M14;
   reg 		 RVALID_M14;
   reg [1:0] 	 RRESP_M14;
   reg [31:0] 	 RDATA_M14;

   // read address channel _M15
   reg 		 ARREADY_M15;
   
   // read data channel _M15
   reg [3:0] 	 RID_M15;
   reg 		 RLAST_M15;
   reg 		 RVALID_M15;
   reg [1:0] 	 RRESP_M15;
   reg [31:0] 	 RDATA_M15;

   // read address channel _S1
   reg [3:0] 	 ARID_S1;
   reg [31:0] 	 ARADDR_S1;
   reg [2:0] 	 ARSIZE_S1;
   reg [1:0] 	 ARBURST_S1;
   reg [3:0] 	 ARLEN_S1;
   reg 		 ARVALID_S1;
   
   // read data channel _S1
   reg 		 RREADY_S1;

   // read address channel _S2
   reg [3:0] 	 ARID_S2;
   reg [31:0] 	 ARADDR_S2;
   reg [2:0] 	 ARSIZE_S2;
   reg [1:0] 	 ARBURST_S2;
   reg [3:0] 	 ARLEN_S2;
   reg 		 ARVALID_S2;
   
   // read data channel _S2
   reg 		 RREADY_S2;

   // read address channel _S3
   reg [3:0] 	 ARID_S3;
   reg [31:0] 	 ARADDR_S3;
   reg [2:0] 	 ARSIZE_S3;
   reg [1:0] 	 ARBURST_S3;
   reg [3:0] 	 ARLEN_S3;
   reg 		 ARVALID_S3;
   
   // read data channel _S3
   reg 		 RREADY_S3;

   // read address channel _S4
   reg [3:0] 	 ARID_S4;
   reg [31:0] 	 ARADDR_S4;
   reg [2:0] 	 ARSIZE_S4;
   reg [1:0] 	 ARBURST_S4;
   reg [3:0] 	 ARLEN_S4;
   reg 		 ARVALID_S4;
   
   // read data channel _S4
   reg 		 RREADY_S4;

   // write data channel, for slaves
   reg [3:0] 	 awid_lat_s1;
   reg [3:0] 	 awid_lat_s2;
   reg [3:0] 	 awid_lat_s3;
   reg [3:0] 	 awid_lat_s4;
   
   reg [3:0] 	 wid_lat_s1;
   reg [3:0] 	 wid_lat_s2;
   reg [3:0] 	 wid_lat_s3;
   reg [3:0] 	 wid_lat_s4;

   // read data channel, for slaves
   reg [3:0] 	 rid_lat_s1;
   reg [3:0] 	 rid_lat_s2;
   reg [3:0] 	 rid_lat_s3;
   reg [3:0] 	 rid_lat_s4;
   
   //-------------------------------------------------------------------------
   // address map & Master ID
   //-------------------------------------------------------------------------

   parameter [3:0] MASTER1 = 4'd1;
   parameter [3:0] MASTER2 = 4'd2;
   parameter [3:0] MASTER3 = 4'd3;
   parameter [3:0] MASTER4 = 4'd4;
   parameter [3:0] MASTER5 = 4'd5;
   parameter [3:0] MASTER6 = 4'd6;
   parameter [3:0] MASTER7 = 4'd7;
   parameter [3:0] MASTER8 = 4'd8;
   parameter [3:0] MASTER9 = 4'd9;
   parameter [3:0] MASTER10 = 4'd10;
   parameter [3:0] MASTER11 = 4'd11;
   parameter [3:0] MASTER12 = 4'd12;
   parameter [3:0] MASTER13 = 4'd13;
   parameter [3:0] MASTER14 = 4'd14;
   parameter [3:0] MASTER15 = 4'd15;
   
   parameter [3:0] SLAVE1 = 4'd2; // SDRAM
   parameter [3:0] SLAVE2 = 4'd1; // NOR
   parameter [3:0] SLAVE3 = 4'd3;
   parameter [3:0] SLAVE4 = 4'd4;
   
   //-------------------------------------------------------------------------
   // Write address channel muxing
   //-------------------------------------------------------------------------

   // master mux
   always @ (/*AS*/AWADDR_M1 or AWADDR_M10 or AWADDR_M11 or AWADDR_M12
	     or AWADDR_M13 or AWADDR_M14 or AWADDR_M15 or AWADDR_M2
	     or AWADDR_M3 or AWADDR_M4 or AWADDR_M5 or AWADDR_M6
	     or AWADDR_M7 or AWADDR_M8 or AWADDR_M9 or AWREADY_S1
	     or AWREADY_S2 or AWREADY_S3 or AWREADY_S4 or AWVALID_M1
	     or AWVALID_M10 or AWVALID_M11 or AWVALID_M12
	     or AWVALID_M13 or AWVALID_M14 or AWVALID_M15
	     or AWVALID_M2 or AWVALID_M3 or AWVALID_M4 or AWVALID_M5
	     or AWVALID_M6 or AWVALID_M7 or AWVALID_M8 or AWVALID_M9) begin

      if (AWVALID_M1) begin
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;
	 
	 if(AWVALID_M1 && AWADDR_M1[31:28] == SLAVE1)
	   AWREADY_M1 = AWREADY_S1;
	 else if(AWVALID_M1 && AWADDR_M1[31:28] == SLAVE2)
	   AWREADY_M1 = AWREADY_S2;
	 else if(AWVALID_M1 && AWADDR_M1[31:28] == SLAVE3)
	   AWREADY_M1 = AWREADY_S3;
	 else if(AWADDR_M1[31:28] == SLAVE4)
	   AWREADY_M1 = AWREADY_S4;
	 else
	   AWREADY_M1 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M2) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M2 && AWADDR_M2[31:28] == SLAVE1)
	   AWREADY_M2 = AWREADY_S1;
	 else if(AWVALID_M2 && AWADDR_M2[31:28] == SLAVE2)
	   AWREADY_M2 = AWREADY_S2;
	 else if(AWVALID_M2 && AWADDR_M2[31:28] == SLAVE3)
	   AWREADY_M2 = AWREADY_S3;
	 else if(AWADDR_M2[31:28] == SLAVE4)
	   AWREADY_M2 = AWREADY_S4;
	 else
	   AWREADY_M2 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M3) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M3 && AWADDR_M3[31:28] == SLAVE1)
	   AWREADY_M3 = AWREADY_S1;
	 else if(AWVALID_M3 && AWADDR_M3[31:28] == SLAVE2)
	   AWREADY_M3 = AWREADY_S2;
	 else if(AWVALID_M3 && AWADDR_M3[31:28] == SLAVE3)
	   AWREADY_M3 = AWREADY_S3;
	 else if(AWADDR_M3[31:28] == SLAVE4)
	   AWREADY_M3 = AWREADY_S4;
	 else
	   AWREADY_M3 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M4) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M4 && AWADDR_M4[31:28] == SLAVE1)
	   AWREADY_M4 = AWREADY_S1;
	 else if(AWVALID_M4 && AWADDR_M4[31:28] == SLAVE2)
	   AWREADY_M4 = AWREADY_S2;
	 else if(AWVALID_M4 && AWADDR_M4[31:28] == SLAVE3)
	   AWREADY_M4 = AWREADY_S3;
	 else if(AWADDR_M4[31:28] == SLAVE4)
	   AWREADY_M4 = AWREADY_S4;
	 else
	   AWREADY_M4 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M5) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M5 && AWADDR_M5[31:28] == SLAVE1)
	   AWREADY_M5 = AWREADY_S1;
	 else if(AWVALID_M5 && AWADDR_M5[31:28] == SLAVE2)
	   AWREADY_M5 = AWREADY_S2;
	 else if(AWVALID_M5 && AWADDR_M5[31:28] == SLAVE3)
	   AWREADY_M5 = AWREADY_S3;
	 else if(AWADDR_M5[31:28] == SLAVE4)
	   AWREADY_M5 = AWREADY_S4;
	 else
	   AWREADY_M5 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M6) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M6 && AWADDR_M6[31:28] == SLAVE1)
	   AWREADY_M6 = AWREADY_S1;
	 else if(AWVALID_M6 && AWADDR_M6[31:28] == SLAVE2)
	   AWREADY_M6 = AWREADY_S2;
	 else if(AWVALID_M6 && AWADDR_M6[31:28] == SLAVE3)
	   AWREADY_M6 = AWREADY_S3;
	 else if(AWADDR_M6[31:28] == SLAVE4)
	   AWREADY_M6 = AWREADY_S4;
	 else
	   AWREADY_M6 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M7) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M7 && AWADDR_M7[31:28] == SLAVE1)
	   AWREADY_M7 = AWREADY_S1;
	 else if(AWVALID_M7 && AWADDR_M7[31:28] == SLAVE2)
	   AWREADY_M7 = AWREADY_S2;
	 else if(AWVALID_M7 && AWADDR_M7[31:28] == SLAVE3)
	   AWREADY_M7 = AWREADY_S3;
	 else if(AWADDR_M7[31:28] == SLAVE4)
	   AWREADY_M7 = AWREADY_S4;
	 else
	   AWREADY_M7 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M8) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M8 && AWADDR_M8[31:28] == SLAVE1)
	   AWREADY_M8 = AWREADY_S1;
	 else if(AWVALID_M8 && AWADDR_M8[31:28] == SLAVE2)
	   AWREADY_M8 = AWREADY_S2;
	 else if(AWVALID_M8 && AWADDR_M8[31:28] == SLAVE3)
	   AWREADY_M8 = AWREADY_S3;
	 else if(AWADDR_M8[31:28] == SLAVE4)
	   AWREADY_M8 = AWREADY_S4;
	 else
	   AWREADY_M8 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M9) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M9 && AWADDR_M9[31:28] == SLAVE1)
	   AWREADY_M9 = AWREADY_S1;
	 else if(AWVALID_M9 && AWADDR_M9[31:28] == SLAVE2)
	   AWREADY_M9 = AWREADY_S2;
	 else if(AWVALID_M9 && AWADDR_M9[31:28] == SLAVE3)
	   AWREADY_M9 = AWREADY_S3;
	 else if(AWADDR_M9[31:28] == SLAVE4)
	   AWREADY_M9 = AWREADY_S4;
	 else
	   AWREADY_M9 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M10) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;
	 
	 if(AWVALID_M10 && AWADDR_M10[31:28] == SLAVE1)
	   AWREADY_M10 = AWREADY_S1;
	 else if(AWVALID_M10 && AWADDR_M10[31:28] == SLAVE2)
	   AWREADY_M10 = AWREADY_S2;
	 else if(AWVALID_M10 && AWADDR_M10[31:28] == SLAVE3)
	   AWREADY_M10 = AWREADY_S3;
	 else if(AWADDR_M10[31:28] == SLAVE4)
	   AWREADY_M10 = AWREADY_S4;
	 else
	   AWREADY_M10 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M11) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M11 && AWADDR_M11[31:28] == SLAVE1)
	   AWREADY_M11 = AWREADY_S1;
	 else if(AWVALID_M11 && AWADDR_M11[31:28] == SLAVE2)
	   AWREADY_M11 = AWREADY_S2;
	 else if(AWVALID_M11 && AWADDR_M11[31:28] == SLAVE3)
	   AWREADY_M11 = AWREADY_S3;
	 else if(AWADDR_M11[31:28] == SLAVE4)
	   AWREADY_M11 = AWREADY_S4;
	 else
	   AWREADY_M11 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M12) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M12 && AWADDR_M12[31:28] == SLAVE1)
	   AWREADY_M12 = AWREADY_S1;
	 else if(AWVALID_M12 && AWADDR_M12[31:28] == SLAVE2)
	   AWREADY_M12 = AWREADY_S2;
	 else if(AWVALID_M12 && AWADDR_M12[31:28] == SLAVE3)
	   AWREADY_M12 = AWREADY_S3;
	 else if(AWADDR_M12[31:28] == SLAVE4)
	   AWREADY_M12 = AWREADY_S4;
	 else
	   AWREADY_M12 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M13) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M14 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M13 && AWADDR_M13[31:28] == SLAVE1)
	   AWREADY_M13 = AWREADY_S1;
	 else if(AWVALID_M13 && AWADDR_M13[31:28] == SLAVE2)
	   AWREADY_M13 = AWREADY_S2;
	 else if(AWVALID_M13 && AWADDR_M13[31:28] == SLAVE3)
	   AWREADY_M13 = AWREADY_S3;
	 else if(AWADDR_M13[31:28] == SLAVE4)
	   AWREADY_M13 = AWREADY_S4;
	 else
	   AWREADY_M13 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M14) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M15 = 1'b0;

	 if(AWVALID_M14 && AWADDR_M14[31:28] == SLAVE1)
	   AWREADY_M14 = AWREADY_S1;
	 else if(AWVALID_M14 && AWADDR_M14[31:28] == SLAVE2)
	   AWREADY_M14 = AWREADY_S2;
	 else if(AWVALID_M14 && AWADDR_M14[31:28] == SLAVE3)
	   AWREADY_M14 = AWREADY_S3;
	 else if(AWADDR_M14[31:28] == SLAVE4)
	   AWREADY_M14 = AWREADY_S4;
	 else
	   AWREADY_M14 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else if (AWVALID_M15) begin
	 AWREADY_M1 = 1'b0;
	 AWREADY_M2 = 1'b0;
	 AWREADY_M3 = 1'b0;
	 AWREADY_M4 = 1'b0;
	 AWREADY_M5 = 1'b0;
	 AWREADY_M6 = 1'b0;
	 AWREADY_M7 = 1'b0;
	 AWREADY_M8 = 1'b0;
	 AWREADY_M9 = 1'b0;
	 AWREADY_M10 = 1'b0;
	 AWREADY_M11 = 1'b0;
	 AWREADY_M12 = 1'b0;
	 AWREADY_M13 = 1'b0;
	 AWREADY_M14 = 1'b0;

	 if(AWVALID_M15 && AWADDR_M15[31:28] == SLAVE1)
	   AWREADY_M15 = AWREADY_S1;
	 else if(AWVALID_M15 && AWADDR_M15[31:28] == SLAVE2)
	   AWREADY_M15 = AWREADY_S2;
	 else if(AWVALID_M15 && AWADDR_M15[31:28] == SLAVE3)
	   AWREADY_M15 = AWREADY_S3;
	 else if(AWADDR_M15[31:28] == SLAVE4)
	   AWREADY_M15 = AWREADY_S4;
	 else
	   AWREADY_M15 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      else begin
	   AWREADY_M1 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M2 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M3 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M4 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M5 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M6 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M7 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M8 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M9 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M10 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M11 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M12 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M13 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M14 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
	   AWREADY_M15 = (AWREADY_S1 | AWREADY_S2 | AWREADY_S3 | AWREADY_S4);
      end
      
   end
   
   // slave mux
   always @ (posedge ack or negedge reset) begin
      if (!reset) begin
	 awid_lat_s4 <= 4'd0;
	 awid_lat_s1 <= 4'd0;
	 awid_lat_s2 <= 4'd0;
	 awid_lat_s3 <= 4'd0;
      end
      else begin
	 if (AWREADY_S1) begin
	    if (AWVALID_M1 && AWADDR_M1[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER1;
	    else if (AWVALID_M2 && AWADDR_M2[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER2;
	    else if (AWVALID_M3 && AWADDR_M3[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER3;
	    else if (AWVALID_M4 && AWADDR_M4[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER4;
	    else if (AWVALID_M5 && AWADDR_M5[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER5;
	    else if (AWVALID_M6 && AWADDR_M6[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER6;
	    else if (AWVALID_M7 && AWADDR_M7[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER7;
	    else if (AWVALID_M8 && AWADDR_M8[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER8;
	    else if (AWVALID_M9 && AWADDR_M9[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER9;
	    else if (AWVALID_M10 && AWADDR_M10[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER10;
	    else if (AWVALID_M11 && AWADDR_M11[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER11;
	    else if (AWVALID_M12 && AWADDR_M12[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER12;
	    else if (AWVALID_M13 && AWADDR_M13[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER13;
	    else if (AWVALID_M14 && AWADDR_M14[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER14;
	    else if (AWVALID_M15 && AWADDR_M15[31:28] == SLAVE1)
	      awid_lat_s1 <= MASTER15;
	 end

	 if (AWREADY_S2) begin
	    if (AWVALID_M1 && AWADDR_M1[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER1;
	    else if (AWVALID_M2 && AWADDR_M2[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER2;
	    else if (AWVALID_M3 && AWADDR_M3[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER3;
	    else if (AWVALID_M4 && AWADDR_M4[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER4;
	    else if (AWVALID_M5 && AWADDR_M5[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER5;
	    else if (AWVALID_M6 && AWADDR_M6[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER6;
	    else if (AWVALID_M7 && AWADDR_M7[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER7;
	    else if (AWVALID_M8 && AWADDR_M8[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER8;
	    else if (AWVALID_M9 && AWADDR_M9[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER9;
	    else if (AWVALID_M10 && AWADDR_M10[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER10;
	    else if (AWVALID_M11 && AWADDR_M11[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER11;
	    else if (AWVALID_M12 && AWADDR_M12[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER12;
	    else if (AWVALID_M13 && AWADDR_M13[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER13;
	    else if (AWVALID_M14 && AWADDR_M14[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER14;
	    else if (AWVALID_M15 && AWADDR_M15[31:28] == SLAVE2)
	      awid_lat_s2 <= MASTER15;
	 end

	 if (AWREADY_S3) begin
	    if (AWVALID_M1 && AWADDR_M1[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER1;
	    else if (AWVALID_M2 && AWADDR_M2[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER2;
	    else if (AWVALID_M3 && AWADDR_M3[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER3;
	    else if (AWVALID_M4 && AWADDR_M4[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER4;
	    else if (AWVALID_M5 && AWADDR_M5[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER5;
	    else if (AWVALID_M6 && AWADDR_M6[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER6;
	    else if (AWVALID_M7 && AWADDR_M7[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER7;
	    else if (AWVALID_M8 && AWADDR_M8[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER8;
	    else if (AWVALID_M9 && AWADDR_M9[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER9;
	    else if (AWVALID_M10 && AWADDR_M10[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER10;
	    else if (AWVALID_M11 && AWADDR_M11[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER11;
	    else if (AWVALID_M12 && AWADDR_M12[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER12;
	    else if (AWVALID_M13 && AWADDR_M13[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER13;
	    else if (AWVALID_M14 && AWADDR_M14[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER14;
	    else if (AWVALID_M15 && AWADDR_M15[31:28] == SLAVE3)
	      awid_lat_s3 <= MASTER15;
	 end

	 if (AWREADY_S4) begin
	    if (AWVALID_M1 && AWADDR_M1[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER1;
	    else if (AWVALID_M2 && AWADDR_M2[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER2;
	    else if (AWVALID_M3 && AWADDR_M3[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER3;
	    else if (AWVALID_M4 && AWADDR_M4[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER4;
	    else if (AWVALID_M5 && AWADDR_M5[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER5;
	    else if (AWVALID_M6 && AWADDR_M6[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER6;
	    else if (AWVALID_M7 && AWADDR_M7[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER7;
	    else if (AWVALID_M8 && AWADDR_M8[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER8;
	    else if (AWVALID_M9 && AWADDR_M9[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER9;
	    else if (AWVALID_M10 && AWADDR_M10[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER10;
	    else if (AWVALID_M11 && AWADDR_M11[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER11;
	    else if (AWVALID_M12 && AWADDR_M12[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER12;
	    else if (AWVALID_M13 && AWADDR_M13[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER13;
	    else if (AWVALID_M14 && AWADDR_M14[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER14;
	    else if (AWVALID_M15 && AWADDR_M15[31:28] == SLAVE4)
	      awid_lat_s4 <= MASTER15;
	 end

      end
   end

   always @ (/*AS*/AWADDR_M1 or AWADDR_M10 or AWADDR_M11 or AWADDR_M12
	     or AWADDR_M13 or AWADDR_M14 or AWADDR_M15 or AWADDR_M2
	     or AWADDR_M3 or AWADDR_M4 or AWADDR_M5 or AWADDR_M6
	     or AWADDR_M7 or AWADDR_M8 or AWADDR_M9 or AWBURST_M1
	     or AWBURST_M10 or AWBURST_M11 or AWBURST_M12
	     or AWBURST_M13 or AWBURST_M14 or AWBURST_M15
	     or AWBURST_M2 or AWBURST_M3 or AWBURST_M4 or AWBURST_M5
	     or AWBURST_M6 or AWBURST_M7 or AWBURST_M8 or AWBURST_M9
	     or AWID_M1 or AWID_M10 or AWID_M11 or AWID_M12
	     or AWID_M13 or AWID_M14 or AWID_M15 or AWID_M2 or AWID_M3
	     or AWID_M4 or AWID_M5 or AWID_M6 or AWID_M7 or AWID_M8
	     or AWID_M9 or AWLEN_M1 or AWLEN_M10 or AWLEN_M11
	     or AWLEN_M12 or AWLEN_M13 or AWLEN_M14 or AWLEN_M15
	     or AWLEN_M2 or AWLEN_M3 or AWLEN_M4 or AWLEN_M5
	     or AWLEN_M6 or AWLEN_M7 or AWLEN_M8 or AWLEN_M9
	     or AWSIZE_M1 or AWSIZE_M10 or AWSIZE_M11 or AWSIZE_M12
	     or AWSIZE_M13 or AWSIZE_M14 or AWSIZE_M15 or AWSIZE_M2
	     or AWSIZE_M3 or AWSIZE_M4 or AWSIZE_M5 or AWSIZE_M6
	     or AWSIZE_M7 or AWSIZE_M8 or AWSIZE_M9 or AWVALID_M1
	     or AWVALID_M10 or AWVALID_M11 or AWVALID_M12
	     or AWVALID_M13 or AWVALID_M14 or AWVALID_M15
	     or AWVALID_M2 or AWVALID_M3 or AWVALID_M4 or AWVALID_M5
	     or AWVALID_M6 or AWVALID_M7 or AWVALID_M8 or AWVALID_M9) begin

      // slave 1
      if (AWVALID_M1 && AWADDR_M1[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M1;
	    AWADDR_S1  = AWADDR_M1;
	    AWLEN_S1   = AWLEN_M1;
	    AWVALID_S1 = AWVALID_M1;
	    AWBURST_S1 = AWBURST_M1;
	    AWSIZE_S1  = AWSIZE_M1;
	 end
	 else if (AWVALID_M2 && AWADDR_M2[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M2;
	    AWADDR_S1  = AWADDR_M2;
	    AWLEN_S1   = AWLEN_M2;
	    AWVALID_S1 = AWVALID_M2;
	    AWBURST_S1 = AWBURST_M2;
	    AWSIZE_S1  = AWSIZE_M2;
	 end
	 else if (AWVALID_M3 && AWADDR_M3[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M3;
	    AWADDR_S1  = AWADDR_M3;
	    AWLEN_S1   = AWLEN_M3;
	    AWVALID_S1 = AWVALID_M3;
	    AWBURST_S1 = AWBURST_M3;
	    AWSIZE_S1  = AWSIZE_M3;
	 end
	 else if (AWVALID_M4 && AWADDR_M4[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M4;
	    AWADDR_S1  = AWADDR_M4;
	    AWLEN_S1   = AWLEN_M4;
	    AWVALID_S1 = AWVALID_M4;
	    AWBURST_S1 = AWBURST_M4;
	    AWSIZE_S1  = AWSIZE_M4;
	 end
	 else if (AWVALID_M5 && AWADDR_M5[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M5;
	    AWADDR_S1  = AWADDR_M5;
	    AWLEN_S1   = AWLEN_M5;
	    AWVALID_S1 = AWVALID_M5;
	    AWBURST_S1 = AWBURST_M5;
	    AWSIZE_S1  = AWSIZE_M5;
	 end
	 else if (AWVALID_M6 && AWADDR_M6[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M6;
	    AWADDR_S1  = AWADDR_M6;
	    AWLEN_S1   = AWLEN_M6;
	    AWVALID_S1 = AWVALID_M6;
	    AWBURST_S1 = AWBURST_M6;
	    AWSIZE_S1  = AWSIZE_M6;
	 end
	 else if (AWVALID_M7 && AWADDR_M7[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M7;
	    AWADDR_S1  = AWADDR_M7;
	    AWLEN_S1   = AWLEN_M7;
	    AWVALID_S1 = AWVALID_M7;
	    AWBURST_S1 = AWBURST_M7;
	    AWSIZE_S1  = AWSIZE_M7;
	 end
	 else if (AWVALID_M8 && AWADDR_M8[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M8;
	    AWADDR_S1  = AWADDR_M8;
	    AWLEN_S1   = AWLEN_M8;
	    AWVALID_S1 = AWVALID_M8;
	    AWBURST_S1 = AWBURST_M8;
	    AWSIZE_S1  = AWSIZE_M8;
	 end
	 else if (AWVALID_M9 && AWADDR_M9[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M9;
	    AWADDR_S1  = AWADDR_M9;
	    AWLEN_S1   = AWLEN_M9;
	    AWVALID_S1 = AWVALID_M9;
	    AWBURST_S1 = AWBURST_M9;
	    AWSIZE_S1  = AWSIZE_M9;
	 end
	 else if (AWVALID_M10 && AWADDR_M10[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M10;
	    AWADDR_S1  = AWADDR_M10;
	    AWLEN_S1   = AWLEN_M10;
	    AWVALID_S1 = AWVALID_M10;
	    AWBURST_S1 = AWBURST_M10;
	    AWSIZE_S1  = AWSIZE_M10;
	 end
	 else if (AWVALID_M11 && AWADDR_M11[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M11;
	    AWADDR_S1  = AWADDR_M11;
	    AWLEN_S1   = AWLEN_M11;
	    AWVALID_S1 = AWVALID_M11;
	    AWBURST_S1 = AWBURST_M11;
	    AWSIZE_S1  = AWSIZE_M11;
	 end
	 else if (AWVALID_M12 && AWADDR_M12[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M12;
	    AWADDR_S1  = AWADDR_M12;
	    AWLEN_S1   = AWLEN_M12;
	    AWVALID_S1 = AWVALID_M12;
	    AWBURST_S1 = AWBURST_M12;
	    AWSIZE_S1  = AWSIZE_M12;
	 end
	 else if (AWVALID_M13 && AWADDR_M13[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M13;
	    AWADDR_S1  = AWADDR_M13;
	    AWLEN_S1   = AWLEN_M13;
	    AWVALID_S1 = AWVALID_M13;
	    AWBURST_S1 = AWBURST_M13;
	    AWSIZE_S1  = AWSIZE_M13;
	 end
	 else if (AWVALID_M14 && AWADDR_M14[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M14;
	    AWADDR_S1  = AWADDR_M14;
	    AWLEN_S1   = AWLEN_M14;
	    AWVALID_S1 = AWVALID_M14;
	    AWBURST_S1 = AWBURST_M14;
	    AWSIZE_S1  = AWSIZE_M14;
	 end
	 else if (AWVALID_M15 && AWADDR_M15[31:28] == SLAVE1) begin
	    AWID_S1    = AWID_M15;
	    AWADDR_S1  = AWADDR_M15;
	    AWLEN_S1   = AWLEN_M15;
	    AWVALID_S1 = AWVALID_M15;
	    AWBURST_S1 = AWBURST_M15;
	    AWSIZE_S1  = AWSIZE_M15;
	 end
	 else begin
	    AWID_S1    = 0;
	    AWADDR_S1  = 0;
	    AWLEN_S1   = 0;
	    AWVALID_S1 = 0;
	    AWBURST_S1 = 0;
	    AWSIZE_S1  = 0;
	 end 
   
   if (AWVALID_M1 && AWADDR_M1[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M1;
	    AWADDR_S2  = AWADDR_M1;
	    AWLEN_S2   = AWLEN_M1;
	    AWVALID_S2 = AWVALID_M1;
	    AWBURST_S2 = AWBURST_M1;
	    AWSIZE_S2  = AWSIZE_M1;
	 end
	 else if (AWVALID_M2 && AWADDR_M2[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M2;
	    AWADDR_S2  = AWADDR_M2;
	    AWLEN_S2   = AWLEN_M2;
	    AWVALID_S2 = AWVALID_M2;
	    AWBURST_S2 = AWBURST_M2;
	    AWSIZE_S2  = AWSIZE_M2;
	 end
	 else if (AWVALID_M3 && AWADDR_M3[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M3;
	    AWADDR_S2  = AWADDR_M3;
	    AWLEN_S2   = AWLEN_M3;
	    AWVALID_S2 = AWVALID_M3;
	    AWBURST_S2 = AWBURST_M3;
	    AWSIZE_S2  = AWSIZE_M3;
	 end
	 else if (AWVALID_M4 && AWADDR_M4[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M4;
	    AWADDR_S2  = AWADDR_M4;
	    AWLEN_S2   = AWLEN_M4;
	    AWVALID_S2 = AWVALID_M4;
	    AWBURST_S2 = AWBURST_M4;
	    AWSIZE_S2  = AWSIZE_M4;
	 end
	 else if (AWVALID_M5 && AWADDR_M5[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M5;
	    AWADDR_S2  = AWADDR_M5;
	    AWLEN_S2   = AWLEN_M5;
	    AWVALID_S2 = AWVALID_M5;
	    AWBURST_S2 = AWBURST_M5;
	    AWSIZE_S2  = AWSIZE_M5;
	 end
	 else if (AWVALID_M6 && AWADDR_M6[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M6;
	    AWADDR_S2  = AWADDR_M6;
	    AWLEN_S2   = AWLEN_M6;
	    AWVALID_S2 = AWVALID_M6;
	    AWBURST_S2 = AWBURST_M6;
	    AWSIZE_S2  = AWSIZE_M6;
	 end
	 else if (AWVALID_M7 && AWADDR_M7[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M7;
	    AWADDR_S2  = AWADDR_M7;
	    AWLEN_S2   = AWLEN_M7;
	    AWVALID_S2 = AWVALID_M7;
	    AWBURST_S2 = AWBURST_M7;
	    AWSIZE_S2  = AWSIZE_M7;
	 end
	 else if (AWVALID_M8 && AWADDR_M8[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M8;
	    AWADDR_S2  = AWADDR_M8;
	    AWLEN_S2   = AWLEN_M8;
	    AWVALID_S2 = AWVALID_M8;
	    AWBURST_S2 = AWBURST_M8;
	    AWSIZE_S2  = AWSIZE_M8;
	 end
	 else if (AWVALID_M9 && AWADDR_M9[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M9;
	    AWADDR_S2  = AWADDR_M9;
	    AWLEN_S2   = AWLEN_M9;
	    AWVALID_S2 = AWVALID_M9;
	    AWBURST_S2 = AWBURST_M9;
	    AWSIZE_S2  = AWSIZE_M9;
	 end
	 else if (AWVALID_M10 && AWADDR_M10[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M10;
	    AWADDR_S2  = AWADDR_M10;
	    AWLEN_S2   = AWLEN_M10;
	    AWVALID_S2 = AWVALID_M10;
	    AWBURST_S2 = AWBURST_M10;
	    AWSIZE_S2  = AWSIZE_M10;
	 end
	 else if (AWVALID_M11 && AWADDR_M11[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M11;
	    AWADDR_S2  = AWADDR_M11;
	    AWLEN_S2   = AWLEN_M11;
	    AWVALID_S2 = AWVALID_M11;
	    AWBURST_S2 = AWBURST_M11;
	    AWSIZE_S2  = AWSIZE_M11;
	 end
	 else if (AWVALID_M12 && AWADDR_M12[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M12;
	    AWADDR_S2  = AWADDR_M12;
	    AWLEN_S2   = AWLEN_M12;
	    AWVALID_S2 = AWVALID_M12;
	    AWBURST_S2 = AWBURST_M12;
	    AWSIZE_S2  = AWSIZE_M12;
	 end
	 else if (AWVALID_M13 && AWADDR_M13[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M13;
	    AWADDR_S2  = AWADDR_M13;
	    AWLEN_S2   = AWLEN_M13;
	    AWVALID_S2 = AWVALID_M13;
	    AWBURST_S2 = AWBURST_M13;
	    AWSIZE_S2  = AWSIZE_M13;
	 end
	 else if (AWVALID_M14 && AWADDR_M14[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M14;
	    AWADDR_S2  = AWADDR_M14;
	    AWLEN_S2   = AWLEN_M14;
	    AWVALID_S2 = AWVALID_M14;
	    AWBURST_S2 = AWBURST_M14;
	    AWSIZE_S2  = AWSIZE_M14;
	 end
	 else if (AWVALID_M15 && AWADDR_M15[31:28] == SLAVE2) begin
	    AWID_S2    = AWID_M15;
	    AWADDR_S2  = AWADDR_M15;
	    AWLEN_S2   = AWLEN_M15;
	    AWVALID_S2 = AWVALID_M15;
	    AWBURST_S2 = AWBURST_M15;
	    AWSIZE_S2  = AWSIZE_M15;
	 end
	 else begin
	    AWID_S2    = 0;
	    AWADDR_S2  = 0;
	    AWLEN_S2   = 0;
	    AWVALID_S2 = 0;
	    AWBURST_S2 = 0;
	    AWSIZE_S2  = 0;
	 end 
       
    
	 if (AWVALID_M1 && AWADDR_M1[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M1;
	    AWADDR_S3  = AWADDR_M1;
	    AWLEN_S3   = AWLEN_M1;
	    AWVALID_S3 = AWVALID_M1;
	    AWBURST_S3 = AWBURST_M1;
	    AWSIZE_S3  = AWSIZE_M1;
	 end
	 else if (AWVALID_M2 && AWADDR_M2[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M2;
	    AWADDR_S3  = AWADDR_M2;
	    AWLEN_S3   = AWLEN_M2;
	    AWVALID_S3 = AWVALID_M2;
	    AWBURST_S3 = AWBURST_M2;
	    AWSIZE_S3  = AWSIZE_M2;
	 end
	 else if (AWVALID_M3 && AWADDR_M3[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M3;
	    AWADDR_S3  = AWADDR_M3;
	    AWLEN_S3   = AWLEN_M3;
	    AWVALID_S3 = AWVALID_M3;
	    AWBURST_S3 = AWBURST_M3;
	    AWSIZE_S3  = AWSIZE_M3;
	 end
	 else if (AWVALID_M4 && AWADDR_M4[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M4;
	    AWADDR_S3  = AWADDR_M4;
	    AWLEN_S3   = AWLEN_M4;
	    AWVALID_S3 = AWVALID_M4;
	    AWBURST_S3 = AWBURST_M4;
	    AWSIZE_S3  = AWSIZE_M4;
	 end
	 else if (AWVALID_M5 && AWADDR_M5[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M5;
	    AWADDR_S3  = AWADDR_M5;
	    AWLEN_S3   = AWLEN_M5;
	    AWVALID_S3 = AWVALID_M5;
	    AWBURST_S3 = AWBURST_M5;
	    AWSIZE_S3  = AWSIZE_M5;
	 end
	 else if (AWVALID_M6 && AWADDR_M6[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M6;
	    AWADDR_S3  = AWADDR_M6;
	    AWLEN_S3   = AWLEN_M6;
	    AWVALID_S3 = AWVALID_M6;
	    AWBURST_S3 = AWBURST_M6;
	    AWSIZE_S3  = AWSIZE_M6;
	 end
	 else if (AWVALID_M7 && AWADDR_M7[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M7;
	    AWADDR_S3  = AWADDR_M7;
	    AWLEN_S3   = AWLEN_M7;
	    AWVALID_S3 = AWVALID_M7;
	    AWBURST_S3 = AWBURST_M7;
	    AWSIZE_S3  = AWSIZE_M7;
	 end
	 else if (AWVALID_M8 && AWADDR_M8[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M8;
	    AWADDR_S3  = AWADDR_M8;
	    AWLEN_S3   = AWLEN_M8;
	    AWVALID_S3 = AWVALID_M8;
	    AWBURST_S3 = AWBURST_M8;
	    AWSIZE_S3  = AWSIZE_M8;
	 end
	 else if (AWVALID_M9 && AWADDR_M9[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M9;
	    AWADDR_S3  = AWADDR_M9;
	    AWLEN_S3   = AWLEN_M9;
	    AWVALID_S3 = AWVALID_M9;
	    AWBURST_S3 = AWBURST_M9;
	    AWSIZE_S3  = AWSIZE_M9;
	 end
	 else if (AWVALID_M10 && AWADDR_M10[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M10;
	    AWADDR_S3  = AWADDR_M10;
	    AWLEN_S3   = AWLEN_M10;
	    AWVALID_S3 = AWVALID_M10;
	    AWBURST_S3 = AWBURST_M10;
	    AWSIZE_S3  = AWSIZE_M10;
	 end
	 else if (AWVALID_M11 && AWADDR_M11[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M11;
	    AWADDR_S3  = AWADDR_M11;
	    AWLEN_S3   = AWLEN_M11;
	    AWVALID_S3 = AWVALID_M11;
	    AWBURST_S3 = AWBURST_M11;
	    AWSIZE_S3  = AWSIZE_M11;
	 end
	 else if (AWVALID_M12 && AWADDR_M12[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M12;
	    AWADDR_S3  = AWADDR_M12;
	    AWLEN_S3   = AWLEN_M12;
	    AWVALID_S3 = AWVALID_M12;
	    AWBURST_S3 = AWBURST_M12;
	    AWSIZE_S3  = AWSIZE_M12;
	 end
	 else if (AWVALID_M13 && AWADDR_M13[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M13;
	    AWADDR_S3  = AWADDR_M13;
	    AWLEN_S3   = AWLEN_M13;
	    AWVALID_S3 = AWVALID_M13;
	    AWBURST_S3 = AWBURST_M13;
	    AWSIZE_S3  = AWSIZE_M13;
	 end
	 else if (AWVALID_M14 && AWADDR_M14[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M14;
	    AWADDR_S3  = AWADDR_M14;
	    AWLEN_S3   = AWLEN_M14;
	    AWVALID_S3 = AWVALID_M14;
	    AWBURST_S3 = AWBURST_M14;
	    AWSIZE_S3  = AWSIZE_M14;
	 end
	 else if (AWVALID_M15 && AWADDR_M15[31:28] == SLAVE3) begin
	    AWID_S3    = AWID_M15;
	    AWADDR_S3  = AWADDR_M15;
	    AWLEN_S3   = AWLEN_M15;
	    AWVALID_S3 = AWVALID_M15;
	    AWBURST_S3 = AWBURST_M15;
	    AWSIZE_S3  = AWSIZE_M15;
	 end
	 else begin
	    AWID_S3    = 0;
	    AWADDR_S3  = 0;
	    AWLEN_S3   = 0;
	    AWVALID_S3 = 0;
	    AWBURST_S3 = 0;
	    AWSIZE_S3  = 0;
	 end 

      
   if (AWVALID_M1 && AWADDR_M1[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M1;
	    AWADDR_S4  = AWADDR_M1;
	    AWLEN_S4   = AWLEN_M1;
	    AWVALID_S4 = AWVALID_M1;
	    AWBURST_S4 = AWBURST_M1;
	    AWSIZE_S4  = AWSIZE_M1;
	 end
	 else if (AWVALID_M2 && AWADDR_M2[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M2;
	    AWADDR_S4  = AWADDR_M2;
	    AWLEN_S4   = AWLEN_M2;
	    AWVALID_S4 = AWVALID_M2;
	    AWBURST_S4 = AWBURST_M2;
	    AWSIZE_S4  = AWSIZE_M2;
	 end
	 else if (AWVALID_M3 && AWADDR_M3[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M3;
	    AWADDR_S4  = AWADDR_M3;
	    AWLEN_S4   = AWLEN_M3;
	    AWVALID_S4 = AWVALID_M3;
	    AWBURST_S4 = AWBURST_M3;
	    AWSIZE_S4  = AWSIZE_M3;
	 end
	 else if (AWVALID_M4 && AWADDR_M4[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M4;
	    AWADDR_S4  = AWADDR_M4;
	    AWLEN_S4   = AWLEN_M4;
	    AWVALID_S4 = AWVALID_M4;
	    AWBURST_S4 = AWBURST_M4;
	    AWSIZE_S4  = AWSIZE_M4;
	 end
	 else if (AWVALID_M5 && AWADDR_M5[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M5;
	    AWADDR_S4  = AWADDR_M5;
	    AWLEN_S4   = AWLEN_M5;
	    AWVALID_S4 = AWVALID_M5;
	    AWBURST_S4 = AWBURST_M5;
	    AWSIZE_S4  = AWSIZE_M5;
	 end
	 else if (AWVALID_M6 && AWADDR_M6[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M6;
	    AWADDR_S4  = AWADDR_M6;
	    AWLEN_S4   = AWLEN_M6;
	    AWVALID_S4 = AWVALID_M6;
	    AWBURST_S4 = AWBURST_M6;
	    AWSIZE_S4  = AWSIZE_M6;
	 end
	 else if (AWVALID_M7 && AWADDR_M7[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M7;
	    AWADDR_S4  = AWADDR_M7;
	    AWLEN_S4   = AWLEN_M7;
	    AWVALID_S4 = AWVALID_M7;
	    AWBURST_S4 = AWBURST_M7;
	    AWSIZE_S4  = AWSIZE_M7;
	 end
	 else if (AWVALID_M8 && AWADDR_M8[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M8;
	    AWADDR_S4  = AWADDR_M8;
	    AWLEN_S4   = AWLEN_M8;
	    AWVALID_S4 = AWVALID_M8;
	    AWBURST_S4 = AWBURST_M8;
	    AWSIZE_S4  = AWSIZE_M8;
	 end
	 else if (AWVALID_M9 && AWADDR_M9[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M9;
	    AWADDR_S4  = AWADDR_M9;
	    AWLEN_S4   = AWLEN_M9;
	    AWVALID_S4 = AWVALID_M9;
	    AWBURST_S4 = AWBURST_M9;
	    AWSIZE_S4  = AWSIZE_M9;
	 end
	 else if (AWVALID_M10 && AWADDR_M10[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M10;
	    AWADDR_S4  = AWADDR_M10;
	    AWLEN_S4   = AWLEN_M10;
	    AWVALID_S4 = AWVALID_M10;
	    AWBURST_S4 = AWBURST_M10;
	    AWSIZE_S4  = AWSIZE_M10;
	 end
	 else if (AWVALID_M11 && AWADDR_M11[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M11;
	    AWADDR_S4  = AWADDR_M11;
	    AWLEN_S4   = AWLEN_M11;
	    AWVALID_S4 = AWVALID_M11;
	    AWBURST_S4 = AWBURST_M11;
	    AWSIZE_S4  = AWSIZE_M11;
	 end
	 else if (AWVALID_M12 && AWADDR_M12[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M12;
	    AWADDR_S4  = AWADDR_M12;
	    AWLEN_S4   = AWLEN_M12;
	    AWVALID_S4 = AWVALID_M12;
	    AWBURST_S4 = AWBURST_M12;
	    AWSIZE_S4  = AWSIZE_M12;
	 end
	 else if (AWVALID_M13 && AWADDR_M13[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M13;
	    AWADDR_S4  = AWADDR_M13;
	    AWLEN_S4   = AWLEN_M13;
	    AWVALID_S4 = AWVALID_M13;
	    AWBURST_S4 = AWBURST_M13;
	    AWSIZE_S4  = AWSIZE_M13;
	 end
	 else if (AWVALID_M14 && AWADDR_M14[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M14;
	    AWADDR_S4  = AWADDR_M14;
	    AWLEN_S4   = AWLEN_M14;
	    AWVALID_S4 = AWVALID_M14;
	    AWBURST_S4 = AWBURST_M14;
	    AWSIZE_S4  = AWSIZE_M14;
	 end
	 else if (AWVALID_M15 && AWADDR_M15[31:28] == SLAVE4) begin
	    AWID_S4    = AWID_M15;
	    AWADDR_S4  = AWADDR_M15;
	    AWLEN_S4   = AWLEN_M15;
	    AWVALID_S4 = AWVALID_M15;
	    AWBURST_S4 = AWBURST_M15;
	    AWSIZE_S4  = AWSIZE_M15;
	 end
	 else begin
	    AWID_S4    = 0;
	    AWADDR_S4  = 0;
	    AWLEN_S4   = 0;
	    AWVALID_S4 = 0;
	    AWBURST_S4 = 0;
	    AWSIZE_S4  = 0;
	 end
   end // always @ (...
   
   
   //-------------------------------------------------------------------------
   // Write data channel muxing
   //-------------------------------------------------------------------------

   // slave mux
   always @ (posedge ack or negedge reset) begin
      if (!reset) begin
	 wid_lat_s1 <= 4'd0;
	 wid_lat_s2 <= 4'd0;
	 wid_lat_s3 <= 4'd0;
	 wid_lat_s4 <= 4'd0;
      end
      else begin
	 if(!WVALID_S1)
	   wid_lat_s1 <= awid_lat_s1;
	 else if (WLAST_S1)
	   wid_lat_s1 <= awid_lat_s1;

	 if(!WVALID_S2)
	   wid_lat_s2 <= awid_lat_s2;
	 else if (AWVALID_S2 & AWREADY_S2)
	   wid_lat_s2 <= AWID_S2;

	 if(!WVALID_S3)
	   wid_lat_s3 <= awid_lat_s3;
	 else if (AWVALID_S3 & AWREADY_S3)
	   wid_lat_s3 <= AWID_S3;

	 if(!WVALID_S4)
	   wid_lat_s4 <= awid_lat_s4;
	 else if (AWVALID_S4 & AWREADY_S4)
	   wid_lat_s4 <= AWID_S4;
      end
   end

   always @ (/*AS*/WID_M1 or WID_M10 or WID_M11 or WID_M12 or WID_M13
	     or WID_M14 or WID_M15 or WID_M2 or WID_M3 or WID_M4
	     or WID_M5 or WID_M6 or WID_M7 or WID_M8 or WID_M9
	     or WREADY_S1 or WREADY_S2 or WREADY_S3 or WREADY_S4
	     or wid_lat_s1 or wid_lat_s2 or wid_lat_s3 or wid_lat_s4) begin

      // master 1
      if (WID_M1 == wid_lat_s1)
	WREADY_M1 = WREADY_S1;
      else if (WID_M1 == wid_lat_s2)
	WREADY_M1 = WREADY_S2;
      else if (WID_M1 == wid_lat_s3)
	WREADY_M1 = WREADY_S3;
      else if(WID_M1 == wid_lat_s4)
	WREADY_M1 = WREADY_S4;
      else
	WREADY_M1 = 0;

      // master 2
      if (WID_M2 == wid_lat_s1)
	WREADY_M2 = WREADY_S1;
      else if (WID_M2 == wid_lat_s2)
	WREADY_M2 = WREADY_S2;
      else if (WID_M2 == wid_lat_s3)
	WREADY_M2 = WREADY_S3;
      else if(WID_M2 == wid_lat_s4)
	WREADY_M2 = WREADY_S4;
      else
	WREADY_M2 = 0;

      // master 3
      if (WID_M3 == wid_lat_s1)
	WREADY_M3 = WREADY_S1;
      else if (WID_M3 == wid_lat_s2)
	WREADY_M3 = WREADY_S2;
      else if (WID_M3 == wid_lat_s3)
	WREADY_M3 = WREADY_S3;
      else if(WID_M3 == wid_lat_s4)
	WREADY_M3 = WREADY_S4;
      else
	WREADY_M3 = 0;

      // master 4
      if (WID_M4 == wid_lat_s1)
	WREADY_M4 = WREADY_S1;
      else if (WID_M4 == wid_lat_s2)
	WREADY_M4 = WREADY_S2;
      else if (WID_M4 == wid_lat_s3)
	WREADY_M4 = WREADY_S3;
      else if(WID_M4 == wid_lat_s4)
	WREADY_M4 = WREADY_S4;
      else
	WREADY_M4 = 0;

      // master 5
      if (WID_M5 == wid_lat_s1)
	WREADY_M5 = WREADY_S1;
      else if (WID_M5 == wid_lat_s2)
	WREADY_M5 = WREADY_S2;
      else if (WID_M5 == wid_lat_s3)
	WREADY_M5 = WREADY_S3;
      else if(WID_M5 == wid_lat_s4)
	WREADY_M5 = WREADY_S4;
      else
	WREADY_M5 = 0;

      // master 6
      if (WID_M6 == wid_lat_s1)
	WREADY_M6 = WREADY_S1;
      else if (WID_M6 == wid_lat_s2)
	WREADY_M6 = WREADY_S2;
      else if (WID_M6 == wid_lat_s3)
	WREADY_M6 = WREADY_S3;
      else if(WID_M6 == wid_lat_s4)
	WREADY_M6 = WREADY_S4;
      else
	WREADY_M6 = 0;

      // master 7
      if (WID_M7 == wid_lat_s1)
	WREADY_M7 = WREADY_S1;
      else if (WID_M7 == wid_lat_s2)
	WREADY_M7 = WREADY_S2;
      else if (WID_M7 == wid_lat_s3)
	WREADY_M7 = WREADY_S3;
      else if(WID_M7 == wid_lat_s4)
	WREADY_M7 = WREADY_S4;
      else
	WREADY_M7 = 0;

      // master 8
      if (WID_M8 == wid_lat_s1)
	WREADY_M8 = WREADY_S1;
      else if (WID_M8 == wid_lat_s2)
	WREADY_M8 = WREADY_S2;
      else if (WID_M8 == wid_lat_s3)
	WREADY_M8 = WREADY_S3;
      else if(WID_M8 == wid_lat_s4)
	WREADY_M8 = WREADY_S4;
      else
	WREADY_M8 = 0;

      // master 9
      if (WID_M9 == wid_lat_s1)
	WREADY_M9 = WREADY_S1;
      else if (WID_M9 == wid_lat_s2)
	WREADY_M9 = WREADY_S2;
      else if (WID_M9 == wid_lat_s3)
	WREADY_M9 = WREADY_S3;
      else if(WID_M9 == wid_lat_s4)
	WREADY_M9 = WREADY_S4;
      else
	WREADY_M9 = 0;

      // master 10
      if (WID_M10 == wid_lat_s1)
	WREADY_M10 = WREADY_S1;
      else if (WID_M10 == wid_lat_s2)
	WREADY_M10 = WREADY_S2;
      else if (WID_M10 == wid_lat_s3)
	WREADY_M10 = WREADY_S3;
      else if(WID_M10 == wid_lat_s4)
	WREADY_M10 = WREADY_S4;
      else
	WREADY_M10 = 0;

      // master 11
      if (WID_M11 == wid_lat_s1)
	WREADY_M11 = WREADY_S1;
      else if (WID_M11 == wid_lat_s2)
	WREADY_M11 = WREADY_S2;
      else if (WID_M11 == wid_lat_s3)
	WREADY_M11 = WREADY_S3;
      else if(WID_M11 == wid_lat_s4)
	WREADY_M11 = WREADY_S4;
      else
	WREADY_M11 = 0;

      // master 12
      if (WID_M12 == wid_lat_s1)
	WREADY_M12 = WREADY_S1;
      else if (WID_M12 == wid_lat_s2)
	WREADY_M12 = WREADY_S2;
      else if (WID_M12 == wid_lat_s3)
	WREADY_M12 = WREADY_S3;
      else if(WID_M12 == wid_lat_s4)
	WREADY_M12 = WREADY_S4;
      else
	WREADY_M12 = 0;

      // master 13
      if (WID_M13 == wid_lat_s1)
	WREADY_M13 = WREADY_S1;
      else if (WID_M13 == wid_lat_s2)
	WREADY_M13 = WREADY_S2;
      else if (WID_M13 == wid_lat_s3)
	WREADY_M13 = WREADY_S3;
      else if(WID_M13 == wid_lat_s4)
	WREADY_M13 = WREADY_S4;
      else
	WREADY_M13 = 0;

      // master 14
      if (WID_M14 == wid_lat_s1)
	WREADY_M14 = WREADY_S1;
      else if (WID_M14 == wid_lat_s2)
	WREADY_M14 = WREADY_S2;
      else if (WID_M14 == wid_lat_s3)
	WREADY_M14 = WREADY_S3;
      else if(WID_M14 == wid_lat_s4)
	WREADY_M14 = WREADY_S4;
      else
	WREADY_M14 = 0;

      // master 15
      if (WID_M15 == wid_lat_s1)
	WREADY_M15 = WREADY_S1;
      else if (WID_M15 == wid_lat_s2)
	WREADY_M15 = WREADY_S2;
      else if (WID_M15 == wid_lat_s3)
	WREADY_M15 = WREADY_S3;
      else if(WID_M15 == wid_lat_s4)
	WREADY_M15 = WREADY_S4;
      else
	WREADY_M15 = 0;

   end
   
   // slave mux
   always @ (/*AS*/WDATA_M1 or WDATA_M10 or WDATA_M11 or WDATA_M12
	     or WDATA_M13 or WDATA_M14 or WDATA_M15 or WDATA_M2
	     or WDATA_M3 or WDATA_M4 or WDATA_M5 or WDATA_M6
	     or WDATA_M7 or WDATA_M8 or WDATA_M9 or WID_M1 or WID_M10
	     or WID_M11 or WID_M12 or WID_M13 or WID_M14 or WID_M15
	     or WID_M2 or WID_M3 or WID_M4 or WID_M5 or WID_M6
	     or WID_M7 or WID_M8 or WID_M9 or WLAST_M1 or WLAST_M10
	     or WLAST_M11 or WLAST_M12 or WLAST_M13 or WLAST_M14
	     or WLAST_M15 or WLAST_M2 or WLAST_M3 or WLAST_M4
	     or WLAST_M5 or WLAST_M6 or WLAST_M7 or WLAST_M8
	     or WLAST_M9 or WVALID_M1 or WVALID_M10 or WVALID_M11
	     or WVALID_M12 or WVALID_M13 or WVALID_M14 or WVALID_M15
	     or WVALID_M2 or WVALID_M3 or WVALID_M4 or WVALID_M5
	     or WVALID_M6 or WVALID_M7 or WVALID_M8 or WVALID_M9
	     or wid_lat_s1 or wid_lat_s2 or wid_lat_s3 or wid_lat_s4) begin

      // slave 1
      if(wid_lat_s1 == WID_M1) begin
	 WID_S1    = WID_M1;
	 WDATA_S1  = WDATA_M1;
	 WLAST_S1  = WLAST_M1;
	 WVALID_S1 = WVALID_M1;
      end
      else if(wid_lat_s1 == WID_M2) begin
	 WID_S1    = WID_M2;
	 WDATA_S1  = WDATA_M2;
	 WLAST_S1  = WLAST_M2;
	 WVALID_S1 = WVALID_M2;
      end
      else if(wid_lat_s1 == WID_M3) begin
	 WID_S1    = WID_M3;
	 WDATA_S1  = WDATA_M3;
	 WLAST_S1  = WLAST_M3;
	 WVALID_S1 = WVALID_M3;
      end
      else if(wid_lat_s1 == WID_M4) begin
	 WID_S1    = WID_M4;
	 WDATA_S1  = WDATA_M4;
	 WLAST_S1  = WLAST_M4;
	 WVALID_S1 = WVALID_M4;
      end
      else if(wid_lat_s1 == WID_M5) begin
	 WID_S1    = WID_M5;
	 WDATA_S1  = WDATA_M5;
	 WLAST_S1  = WLAST_M5;
	 WVALID_S1 = WVALID_M5;
      end
      else if(wid_lat_s1 == WID_M6) begin
	 WID_S1    = WID_M6;
	 WDATA_S1  = WDATA_M6;
	 WLAST_S1  = WLAST_M6;
	 WVALID_S1 = WVALID_M6;
      end
      else if(wid_lat_s1 == WID_M7) begin
	 WID_S1    = WID_M7;
	 WDATA_S1  = WDATA_M7;
	 WLAST_S1  = WLAST_M7;
	 WVALID_S1 = WVALID_M7;
      end
      else if(wid_lat_s1 == WID_M8) begin
	 WID_S1    = WID_M8;
	 WDATA_S1  = WDATA_M8;
	 WLAST_S1  = WLAST_M8;
	 WVALID_S1 = WVALID_M8;
      end
      else if(wid_lat_s1 == WID_M9) begin
	 WID_S1    = WID_M9;
	 WDATA_S1  = WDATA_M9;
	 WLAST_S1  = WLAST_M9;
	 WVALID_S1 = WVALID_M9;
      end
      else if(wid_lat_s1 == WID_M10) begin
	 WID_S1    = WID_M10;
	 WDATA_S1  = WDATA_M10;
	 WLAST_S1  = WLAST_M10;
	 WVALID_S1 = WVALID_M10;
      end
      else if(wid_lat_s1 == WID_M11) begin
	 WID_S1    = WID_M11;
	 WDATA_S1  = WDATA_M11;
	 WLAST_S1  = WLAST_M11;
	 WVALID_S1 = WVALID_M11;
      end
      else if(wid_lat_s1 == WID_M12) begin
	 WID_S1    = WID_M12;
	 WDATA_S1  = WDATA_M12;
	 WLAST_S1  = WLAST_M12;
	 WVALID_S1 = WVALID_M12;
      end
      else if(wid_lat_s1 == WID_M13) begin
	 WID_S1    = WID_M13;
	 WDATA_S1  = WDATA_M13;
	 WLAST_S1  = WLAST_M13;
	 WVALID_S1 = WVALID_M13;
      end
      else if(wid_lat_s1 == WID_M14) begin
	 WID_S1    = WID_M14;
	 WDATA_S1  = WDATA_M14;
	 WLAST_S1  = WLAST_M14;
	 WVALID_S1 = WVALID_M14;
      end
      else if(wid_lat_s1 == WID_M15) begin
	 WID_S1    = WID_M15;
	 WDATA_S1  = WDATA_M15;
	 WLAST_S1  = WLAST_M15;
	 WVALID_S1 = WVALID_M15;
      end
      else begin
	 WID_S1    = 0;
	 WDATA_S1  = 0;
	 WLAST_S1  = 0;
	 WVALID_S1 = 0;
      end

      // slave 2
      if(wid_lat_s2 == WID_M1) begin
	 WID_S2    = WID_M1;
	 WDATA_S2  = WDATA_M1;
	 WLAST_S2  = WLAST_M1;
	 WVALID_S2 = WVALID_M1;
      end
      else if(wid_lat_s2 == WID_M2) begin
	 WID_S2    = WID_M2;
	 WDATA_S2  = WDATA_M2;
	 WLAST_S2  = WLAST_M2;
	 WVALID_S2 = WVALID_M2;
      end
      else if(wid_lat_s2 == WID_M3) begin
	 WID_S2    = WID_M3;
	 WDATA_S2  = WDATA_M3;
	 WLAST_S2  = WLAST_M3;
	 WVALID_S2 = WVALID_M3;
      end
      else if(wid_lat_s2 == WID_M4) begin
	 WID_S2    = WID_M4;
	 WDATA_S2  = WDATA_M4;
	 WLAST_S2  = WLAST_M4;
	 WVALID_S2 = WVALID_M4;
      end
      else if(wid_lat_s2 == WID_M5) begin
	 WID_S2    = WID_M5;
	 WDATA_S2  = WDATA_M5;
	 WLAST_S2  = WLAST_M5;
	 WVALID_S2 = WVALID_M5;
      end
      else if(wid_lat_s2 == WID_M6) begin
	 WID_S2    = WID_M6;
	 WDATA_S2  = WDATA_M6;
	 WLAST_S2  = WLAST_M6;
	 WVALID_S2 = WVALID_M6;
      end
      else if(wid_lat_s2 == WID_M7) begin
	 WID_S2    = WID_M7;
	 WDATA_S2  = WDATA_M7;
	 WLAST_S2  = WLAST_M7;
	 WVALID_S2 = WVALID_M7;
      end
      else if(wid_lat_s2 == WID_M8) begin
	 WID_S2    = WID_M8;
	 WDATA_S2  = WDATA_M8;
	 WLAST_S2  = WLAST_M8;
	 WVALID_S2 = WVALID_M8;
      end
      else if(wid_lat_s2 == WID_M9) begin
	 WID_S2    = WID_M9;
	 WDATA_S2  = WDATA_M9;
	 WLAST_S2  = WLAST_M9;
	 WVALID_S2 = WVALID_M9;
      end
      else if(wid_lat_s2 == WID_M10) begin
	 WID_S2    = WID_M10;
	 WDATA_S2  = WDATA_M10;
	 WLAST_S2  = WLAST_M10;
	 WVALID_S2 = WVALID_M10;
      end
      else if(wid_lat_s2 == WID_M11) begin
	 WID_S2    = WID_M11;
	 WDATA_S2  = WDATA_M11;
	 WLAST_S2  = WLAST_M11;
	 WVALID_S2 = WVALID_M11;
      end
      else if(wid_lat_s2 == WID_M12) begin
	 WID_S2    = WID_M12;
	 WDATA_S2  = WDATA_M12;
	 WLAST_S2  = WLAST_M12;
	 WVALID_S2 = WVALID_M12;
      end
      else if(wid_lat_s2 == WID_M13) begin
	 WID_S2    = WID_M13;
	 WDATA_S2  = WDATA_M13;
	 WLAST_S2  = WLAST_M13;
	 WVALID_S2 = WVALID_M13;
      end
      else if(wid_lat_s2 == WID_M14) begin
	 WID_S2    = WID_M14;
	 WDATA_S2  = WDATA_M14;
	 WLAST_S2  = WLAST_M14;
	 WVALID_S2 = WVALID_M14;
      end
      else if(wid_lat_s2 == WID_M15) begin
	 WID_S2    = WID_M15;
	 WDATA_S2  = WDATA_M15;
	 WLAST_S2  = WLAST_M15;
	 WVALID_S2 = WVALID_M15;
      end
      else begin
	 WID_S2    = 0;
	 WDATA_S2  = 0;
	 WLAST_S2  = 0;
	 WVALID_S2 = 0;
      end

      // slave 3
      if(wid_lat_s3 == WID_M1) begin
	 WID_S3    = WID_M1;
	 WDATA_S3  = WDATA_M1;
	 WLAST_S3  = WLAST_M1;
	 WVALID_S3 = WVALID_M1;
      end
      else if(wid_lat_s3 == WID_M2) begin
	 WID_S3    = WID_M2;
	 WDATA_S3  = WDATA_M2;
	 WLAST_S3  = WLAST_M2;
	 WVALID_S3 = WVALID_M2;
      end
      else if(wid_lat_s3 == WID_M3) begin
	 WID_S3    = WID_M3;
	 WDATA_S3  = WDATA_M3;
	 WLAST_S3  = WLAST_M3;
	 WVALID_S3 = WVALID_M3;
      end
      else if(wid_lat_s3 == WID_M4) begin
	 WID_S3    = WID_M4;
	 WDATA_S3  = WDATA_M4;
	 WLAST_S3  = WLAST_M4;
	 WVALID_S3 = WVALID_M4;
      end
      else if(wid_lat_s3 == WID_M5) begin
	 WID_S3    = WID_M5;
	 WDATA_S3  = WDATA_M5;
	 WLAST_S3  = WLAST_M5;
	 WVALID_S3 = WVALID_M5;
      end
      else if(wid_lat_s3 == WID_M6) begin
	 WID_S3    = WID_M6;
	 WDATA_S3  = WDATA_M6;
	 WLAST_S3  = WLAST_M6;
	 WVALID_S3 = WVALID_M6;
      end
      else if(wid_lat_s3 == WID_M7) begin
	 WID_S3    = WID_M7;
	 WDATA_S3  = WDATA_M7;
	 WLAST_S3  = WLAST_M7;
	 WVALID_S3 = WVALID_M7;
      end
      else if(wid_lat_s3 == WID_M8) begin
	 WID_S3    = WID_M8;
	 WDATA_S3  = WDATA_M8;
	 WLAST_S3  = WLAST_M8;
	 WVALID_S3 = WVALID_M8;
      end
      else if(wid_lat_s3 == WID_M9) begin
	 WID_S3    = WID_M9;
	 WDATA_S3  = WDATA_M9;
	 WLAST_S3  = WLAST_M9;
	 WVALID_S3 = WVALID_M9;
      end
      else if(wid_lat_s3 == WID_M10) begin
	 WID_S3    = WID_M10;
	 WDATA_S3  = WDATA_M10;
	 WLAST_S3  = WLAST_M10;
	 WVALID_S3 = WVALID_M10;
      end
      else if(wid_lat_s3 == WID_M11) begin
	 WID_S3    = WID_M11;
	 WDATA_S3  = WDATA_M11;
	 WLAST_S3  = WLAST_M11;
	 WVALID_S3 = WVALID_M11;
      end
      else if(wid_lat_s3 == WID_M12) begin
	 WID_S3    = WID_M12;
	 WDATA_S3  = WDATA_M12;
	 WLAST_S3  = WLAST_M12;
	 WVALID_S3 = WVALID_M12;
      end
      else if(wid_lat_s3 == WID_M13) begin
	 WID_S3    = WID_M13;
	 WDATA_S3  = WDATA_M13;
	 WLAST_S3  = WLAST_M13;
	 WVALID_S3 = WVALID_M13;
      end
      else if(wid_lat_s3 == WID_M14) begin
	 WID_S3    = WID_M14;
	 WDATA_S3  = WDATA_M14;
	 WLAST_S3  = WLAST_M14;
	 WVALID_S3 = WVALID_M14;
      end
      else if(wid_lat_s3 == WID_M15) begin
	 WID_S3    = WID_M15;
	 WDATA_S3  = WDATA_M15;
	 WLAST_S3  = WLAST_M15;
	 WVALID_S3 = WVALID_M15;
      end
      else begin
	 WID_S3    = 0;
	 WDATA_S3  = 0;
	 WLAST_S3  = 0;
	 WVALID_S3 = 0;
      end

      // slave 0
      if(wid_lat_s4 == WID_M1) begin
	 WID_S4    = WID_M1;
	 WDATA_S4  = WDATA_M1;
	 WLAST_S4  = WLAST_M1;
	 WVALID_S4 = WVALID_M1;
      end
      else if(wid_lat_s4 == WID_M2) begin
	 WID_S4    = WID_M2;
	 WDATA_S4  = WDATA_M2;
	 WLAST_S4  = WLAST_M2;
	 WVALID_S4 = WVALID_M2;
      end
      else if(wid_lat_s4 == WID_M3) begin
	 WID_S4    = WID_M3;
	 WDATA_S4  = WDATA_M3;
	 WLAST_S4  = WLAST_M3;
	 WVALID_S4 = WVALID_M3;
      end
      else if(wid_lat_s4 == WID_M4) begin
	 WID_S4    = WID_M4;
	 WDATA_S4  = WDATA_M4;
	 WLAST_S4  = WLAST_M4;
	 WVALID_S4 = WVALID_M4;
      end
      else if(wid_lat_s4 == WID_M5) begin
	 WID_S4    = WID_M5;
	 WDATA_S4  = WDATA_M5;
	 WLAST_S4  = WLAST_M5;
	 WVALID_S4 = WVALID_M5;
      end
      else if(wid_lat_s4 == WID_M6) begin
	 WID_S4    = WID_M6;
	 WDATA_S4  = WDATA_M6;
	 WLAST_S4  = WLAST_M6;
	 WVALID_S4 = WVALID_M6;
      end
      else if(wid_lat_s4 == WID_M7) begin
	 WID_S4    = WID_M7;
	 WDATA_S4  = WDATA_M7;
	 WLAST_S4  = WLAST_M7;
	 WVALID_S4 = WVALID_M7;
      end
      else if(wid_lat_s4 == WID_M8) begin
	 WID_S4    = WID_M8;
	 WDATA_S4  = WDATA_M8;
	 WLAST_S4  = WLAST_M8;
	 WVALID_S4 = WVALID_M8;
      end
      else if(wid_lat_s4 == WID_M9) begin
	 WID_S4    = WID_M9;
	 WDATA_S4  = WDATA_M9;
	 WLAST_S4  = WLAST_M9;
	 WVALID_S4 = WVALID_M9;
      end
      else if(wid_lat_s4 == WID_M10) begin
	 WID_S4    = WID_M10;
	 WDATA_S4  = WDATA_M10;
	 WLAST_S4  = WLAST_M10;
	 WVALID_S4 = WVALID_M10;
      end
      else if(wid_lat_s4 == WID_M11) begin
	 WID_S4    = WID_M11;
	 WDATA_S4  = WDATA_M11;
	 WLAST_S4  = WLAST_M11;
	 WVALID_S4 = WVALID_M11;
      end
      else if(wid_lat_s4 == WID_M12) begin
	 WID_S4    = WID_M12;
	 WDATA_S4  = WDATA_M12;
	 WLAST_S4  = WLAST_M12;
	 WVALID_S4 = WVALID_M12;
      end
      else if(wid_lat_s4 == WID_M13) begin
	 WID_S4    = WID_M13;
	 WDATA_S4  = WDATA_M13;
	 WLAST_S4  = WLAST_M13;
	 WVALID_S4 = WVALID_M13;
      end
      else if(wid_lat_s4 == WID_M14) begin
	 WID_S4    = WID_M14;
	 WDATA_S4  = WDATA_M14;
	 WLAST_S4  = WLAST_M14;
	 WVALID_S4 = WVALID_M14;
      end
      else if(wid_lat_s4 == WID_M15) begin
	 WID_S4    = WID_M15;
	 WDATA_S4  = WDATA_M15;
	 WLAST_S4  = WLAST_M15;
	 WVALID_S4 = WVALID_M15;
      end
      else begin
	 WID_S4    = 0;
	 WDATA_S4  = 0;
	 WLAST_S4  = 0;
	 WVALID_S4 = 0;
      end

   end    

   //-------------------------------------------------------------------------
   // Write response channel muxing
   //-------------------------------------------------------------------------

   always @ (/*AS*/BID_S1 or BID_S2 or BID_S3 or BID_S4 or BRESP_S1
	     or BRESP_S2 or BRESP_S3 or BRESP_S4 or BVALID_S1
	     or BVALID_S2 or BVALID_S3 or BVALID_S4) begin

      // master 1
      if (BID_S1 == MASTER1) begin
	 BID_M1    = BID_S1;
	 BRESP_M1  = BRESP_S1;
	 BVALID_M1 = BVALID_S1;
      end
      else if (BID_S2 == MASTER1) begin
	 BID_M1    = BID_S2;
	 BRESP_M1  = BRESP_S2;
	 BVALID_M1 = BVALID_S2;
      end
      else if (BID_S3 == MASTER1) begin
	 BID_M1    = BID_S3;
	 BRESP_M1  = BRESP_S3;
	 BVALID_M1 = BVALID_S3;
      end
      else if(BID_S4 == MASTER1) begin
	 BID_M1    = BID_S4;
	 BRESP_M1  = BRESP_S4;
	 BVALID_M1 = BVALID_S4;
      end
      else begin
	 BID_M1    = 0;
	 BRESP_M1  = 0;
	 BVALID_M1 = 0;
      end
   
      // master 2
      if (BID_S1 == MASTER2) begin
	 BID_M2    = BID_S1;
	 BRESP_M2  = BRESP_S1;
	 BVALID_M2 = BVALID_S1;
      end
      else if (BID_S2 == MASTER2) begin
	 BID_M2    = BID_S2;
	 BRESP_M2  = BRESP_S2;
	 BVALID_M2 = BVALID_S2;
      end
      else if (BID_S3 == MASTER2) begin
	 BID_M2    = BID_S3;
	 BRESP_M2  = BRESP_S3;
	 BVALID_M2 = BVALID_S3;
      end
      else if(BID_S4 == MASTER2) begin
	 BID_M2    = BID_S4;
	 BRESP_M2  = BRESP_S4;
	 BVALID_M2 = BVALID_S4;
      end
      else begin
	 BID_M2    = 0;
	 BRESP_M2  = 0;
	 BVALID_M2 = 0;
      end

      // master 3
      if (BID_S1 == MASTER3) begin
	 BID_M3    = BID_S1;
	 BRESP_M3  = BRESP_S1;
	 BVALID_M3 = BVALID_S1;
      end
      else if (BID_S2 == MASTER3) begin
	 BID_M3    = BID_S2;
	 BRESP_M3  = BRESP_S2;
	 BVALID_M3 = BVALID_S2;
      end
      else if (BID_S3 == MASTER3) begin
	 BID_M3    = BID_S3;
	 BRESP_M3  = BRESP_S3;
	 BVALID_M3 = BVALID_S3;
      end
      else if(BID_S4 == MASTER3) begin
	 BID_M3    = BID_S4;
	 BRESP_M3  = BRESP_S4;
	 BVALID_M3 = BVALID_S4;
      end
      else begin
	 BID_M3    = 0;
	 BRESP_M3  = 0;
	 BVALID_M3 = 0;
      end

      // master 4
      if (BID_S1 == MASTER4) begin
	 BID_M4    = BID_S1;
	 BRESP_M4  = BRESP_S1;
	 BVALID_M4 = BVALID_S1;
      end
      else if (BID_S2 == MASTER4) begin
	 BID_M4    = BID_S2;
	 BRESP_M4  = BRESP_S2;
	 BVALID_M4 = BVALID_S2;
      end
      else if (BID_S3 == MASTER4) begin
	 BID_M4    = BID_S3;
	 BRESP_M4  = BRESP_S3;
	 BVALID_M4 = BVALID_S3;
      end
      else if(BID_S4 == MASTER4) begin
	 BID_M4    = BID_S4;
	 BRESP_M4  = BRESP_S4;
	 BVALID_M4 = BVALID_S4;
      end
      else begin
	 BID_M4    = 0;
	 BRESP_M4  = 0;
	 BVALID_M4 = 0;
      end

      // master 5
      if (BID_S1 == MASTER5) begin
	 BID_M5    = BID_S1;
	 BRESP_M5  = BRESP_S1;
	 BVALID_M5 = BVALID_S1;
      end
      else if (BID_S2 == MASTER5) begin
	 BID_M5    = BID_S2;
	 BRESP_M5  = BRESP_S2;
	 BVALID_M5 = BVALID_S2;
      end
      else if (BID_S3 == MASTER5) begin
	 BID_M5    = BID_S3;
	 BRESP_M5  = BRESP_S3;
	 BVALID_M5 = BVALID_S3;
      end
      else if(BID_S4 == MASTER5) begin
	 BID_M5    = BID_S4;
	 BRESP_M5  = BRESP_S4;
	 BVALID_M5 = BVALID_S4;
      end
      else begin
	 BID_M5    = 0;
	 BRESP_M5  = 0;
	 BVALID_M5 = 0;
      end

      // master 6
      if (BID_S1 == MASTER6) begin
	 BID_M6    = BID_S1;
	 BRESP_M6  = BRESP_S1;
	 BVALID_M6 = BVALID_S1;
      end
      else if (BID_S2 == MASTER6) begin
	 BID_M6    = BID_S2;
	 BRESP_M6  = BRESP_S2;
	 BVALID_M6 = BVALID_S2;
      end
      else if (BID_S3 == MASTER6) begin
	 BID_M6    = BID_S3;
	 BRESP_M6  = BRESP_S3;
	 BVALID_M6 = BVALID_S3;
      end
      else if(BID_S4 == MASTER6) begin
	 BID_M6    = BID_S4;
	 BRESP_M6  = BRESP_S4;
	 BVALID_M6 = BVALID_S4;
      end
      else begin
	 BID_M6    = 0;
	 BRESP_M6  = 0;
	 BVALID_M6 = 0;
      end

      // master 7
      if (BID_S1 == MASTER7) begin
	 BID_M7    = BID_S1;
	 BRESP_M7  = BRESP_S1;
	 BVALID_M7 = BVALID_S1;
      end
      else if (BID_S2 == MASTER7) begin
	 BID_M7    = BID_S2;
	 BRESP_M7  = BRESP_S2;
	 BVALID_M7 = BVALID_S2;
      end
      else if (BID_S3 == MASTER7) begin
	 BID_M7    = BID_S3;
	 BRESP_M7  = BRESP_S3;
	 BVALID_M7 = BVALID_S3;
      end
      else if(BID_S4 == MASTER7) begin
	 BID_M7    = BID_S4;
	 BRESP_M7  = BRESP_S4;
	 BVALID_M7 = BVALID_S4;
      end
      else begin
	 BID_M7    = 0;
	 BRESP_M7  = 0;
	 BVALID_M7 = 0;
      end

      // master 8
      if (BID_S1 == MASTER8) begin
	 BID_M8    = BID_S1;
	 BRESP_M8  = BRESP_S1;
	 BVALID_M8 = BVALID_S1;
      end
      else if (BID_S2 == MASTER8) begin
	 BID_M8    = BID_S2;
	 BRESP_M8  = BRESP_S2;
	 BVALID_M8 = BVALID_S2;
      end
      else if (BID_S3 == MASTER8) begin
	 BID_M8    = BID_S3;
	 BRESP_M8  = BRESP_S3;
	 BVALID_M8 = BVALID_S3;
      end
      else if(BID_S4 == MASTER8) begin
	 BID_M8    = BID_S4;
	 BRESP_M8  = BRESP_S4;
	 BVALID_M8 = BVALID_S4;
      end
      else begin
	 BID_M8    = 0;
	 BRESP_M8  = 0;
	 BVALID_M8 = 0;
      end

      // master 9
      if (BID_S1 == MASTER9) begin
	 BID_M9    = BID_S1;
	 BRESP_M9  = BRESP_S1;
	 BVALID_M9 = BVALID_S1;
      end
      else if (BID_S2 == MASTER9) begin
	 BID_M9    = BID_S2;
	 BRESP_M9  = BRESP_S2;
	 BVALID_M9 = BVALID_S2;
      end
      else if (BID_S3 == MASTER9) begin
	 BID_M9    = BID_S3;
	 BRESP_M9  = BRESP_S3;
	 BVALID_M9 = BVALID_S3;
      end
      else if(BID_S4 == MASTER9) begin
	 BID_M9    = BID_S4;
	 BRESP_M9  = BRESP_S4;
	 BVALID_M9 = BVALID_S4;
      end
      else begin
	 BID_M9    = 0;
	 BRESP_M9  = 0;
	 BVALID_M9 = 0;
      end

      // master 10
      if (BID_S1 == MASTER10) begin
	 BID_M10    = BID_S1;
	 BRESP_M10  = BRESP_S1;
	 BVALID_M10 = BVALID_S1;
      end
      else if (BID_S2 == MASTER10) begin
	 BID_M10    = BID_S2;
	 BRESP_M10  = BRESP_S2;
	 BVALID_M10 = BVALID_S2;
      end
      else if (BID_S3 == MASTER10) begin
	 BID_M10    = BID_S3;
	 BRESP_M10  = BRESP_S3;
	 BVALID_M10 = BVALID_S3;
      end
      else if(BID_S4 == MASTER10) begin
	 BID_M10    = BID_S4;
	 BRESP_M10  = BRESP_S4;
	 BVALID_M10 = BVALID_S4;
      end
      else begin
	 BID_M10    = 0;
	 BRESP_M10  = 0;
	 BVALID_M10 = 0;
      end

      // master 11
      if (BID_S1 == MASTER11) begin
	 BID_M11    = BID_S1;
	 BRESP_M11  = BRESP_S1;
	 BVALID_M11 = BVALID_S1;
      end
      else if (BID_S2 == MASTER11) begin
	 BID_M11    = BID_S2;
	 BRESP_M11  = BRESP_S2;
	 BVALID_M11 = BVALID_S2;
      end
      else if (BID_S3 == MASTER11) begin
	 BID_M11    = BID_S3;
	 BRESP_M11  = BRESP_S3;
	 BVALID_M11 = BVALID_S3;
      end
      else if(BID_S4 == MASTER11) begin
	 BID_M11    = BID_S4;
	 BRESP_M11  = BRESP_S4;
	 BVALID_M11 = BVALID_S4;
      end
      else begin
	 BID_M11    = 0;
	 BRESP_M11  = 0;
	 BVALID_M11 = 0;
      end

      // master 12
      if (BID_S1 == MASTER12) begin
	 BID_M12    = BID_S1;
	 BRESP_M12  = BRESP_S1;
	 BVALID_M12 = BVALID_S1;
      end
      else if (BID_S2 == MASTER12) begin
	 BID_M12    = BID_S2;
	 BRESP_M12  = BRESP_S2;
	 BVALID_M12 = BVALID_S2;
      end
      else if (BID_S3 == MASTER12) begin
	 BID_M12    = BID_S3;
	 BRESP_M12  = BRESP_S3;
	 BVALID_M12 = BVALID_S3;
      end
      else if(BID_S4 == MASTER12) begin
	 BID_M12    = BID_S4;
	 BRESP_M12  = BRESP_S4;
	 BVALID_M12 = BVALID_S4;
      end
      else begin
	 BID_M12    = 0;
	 BRESP_M12  = 0;
	 BVALID_M12 = 0;
      end

      // master 13
      if (BID_S1 == MASTER13) begin
	 BID_M13    = BID_S1;
	 BRESP_M13  = BRESP_S1;
	 BVALID_M13 = BVALID_S1;
      end
      else if (BID_S2 == MASTER13) begin
	 BID_M13    = BID_S2;
	 BRESP_M13  = BRESP_S2;
	 BVALID_M13 = BVALID_S2;
      end
      else if (BID_S3 == MASTER13) begin
	 BID_M13    = BID_S3;
	 BRESP_M13  = BRESP_S3;
	 BVALID_M13 = BVALID_S3;
      end
      else if(BID_S4 == MASTER13) begin
	 BID_M13    = BID_S4;
	 BRESP_M13  = BRESP_S4;
	 BVALID_M13 = BVALID_S4;
      end
      else begin
	 BID_M13    = 0;
	 BRESP_M13  = 0;
	 BVALID_M13 = 0;
      end

      // master 14
      if (BID_S1 == MASTER14) begin
	 BID_M14    = BID_S1;
	 BRESP_M14  = BRESP_S1;
	 BVALID_M14 = BVALID_S1;
      end
      else if (BID_S2 == MASTER14) begin
	 BID_M14    = BID_S2;
	 BRESP_M14  = BRESP_S2;
	 BVALID_M14 = BVALID_S2;
      end
      else if (BID_S3 == MASTER14) begin
	 BID_M14    = BID_S3;
	 BRESP_M14  = BRESP_S3;
	 BVALID_M14 = BVALID_S3;
      end
      else if(BID_S4 == MASTER14) begin
	 BID_M14    = BID_S4;
	 BRESP_M14  = BRESP_S4;
	 BVALID_M14 = BVALID_S4;
      end
      else begin
	 BID_M14    = 0;
	 BRESP_M14  = 0;
	 BVALID_M14 = 0;
      end

      // master 15
      if (BID_S1 == MASTER15) begin
	 BID_M15    = BID_S1;
	 BRESP_M15  = BRESP_S1;
	 BVALID_M15 = BVALID_S1;
      end
      else if (BID_S2 == MASTER15) begin
	 BID_M15    = BID_S2;
	 BRESP_M15  = BRESP_S2;
	 BVALID_M15 = BVALID_S2;
      end
      else if (BID_S3 == MASTER15) begin
	 BID_M15    = BID_S3;
	 BRESP_M15  = BRESP_S3;
	 BVALID_M15 = BVALID_S3;
      end
      if(BID_S4 == MASTER15) begin
	 BID_M15    = BID_S4;
	 BRESP_M15  = BRESP_S4;
	 BVALID_M15 = BVALID_S4;
      end
      else begin
	 BID_M15    = 0;
	 BRESP_M15  = 0;
	 BVALID_M15 = 0;
      end

   end // always @ (...
   
   // slave mux
   always @ (/*AS*/BID_S1 or BID_S2 or BID_S3 or BID_S4 or BREADY_M1
	     or BREADY_M10 or BREADY_M11 or BREADY_M12 or BREADY_M13
	     or BREADY_M14 or BREADY_M15 or BREADY_M2 or BREADY_M3
	     or BREADY_M4 or BREADY_M5 or BREADY_M6 or BREADY_M7
	     or BREADY_M8 or BREADY_M9) begin

      // slave 1
      if(BID_S1 == MASTER1) begin
	 BREADY_S1 = BREADY_M1;
      end
      else if(BID_S1 == MASTER2) begin
	 BREADY_S1 = BREADY_M2;
      end
      else if(BID_S1 == MASTER3) begin
	 BREADY_S1 = BREADY_M3;
      end
      else if(BID_S1 == MASTER4) begin
	 BREADY_S1 = BREADY_M4;
      end
      else if(BID_S1 == MASTER5) begin
	 BREADY_S1 = BREADY_M5;
      end
      else if(BID_S1 == MASTER6) begin
	 BREADY_S1 = BREADY_M6;
      end
      else if(BID_S1 == MASTER7) begin
	 BREADY_S1 = BREADY_M7;
      end
      else if(BID_S1 == MASTER8) begin
	 BREADY_S1 = BREADY_M8;
      end
      else if(BID_S1 == MASTER9) begin
	 BREADY_S1 = BREADY_M9;
      end
      else if(BID_S1 == MASTER10) begin
	 BREADY_S1 = BREADY_M10;
      end
      else if(BID_S1 == MASTER11) begin
	 BREADY_S1 = BREADY_M11;
      end
      else if(BID_S1 == MASTER12) begin
	 BREADY_S1 = BREADY_M12;
      end
      else if(BID_S1 == MASTER13) begin
	 BREADY_S1 = BREADY_M13;
      end
      else if(BID_S1 == MASTER14) begin
	 BREADY_S1 = BREADY_M14;
      end
      else if(BID_S1 == MASTER15) begin
	 BREADY_S1 = BREADY_M15;
      end
      else begin
	 BREADY_S1 = 0;
      end

      // slave 2
      if(BID_S2 == MASTER1) begin
	 BREADY_S2 = BREADY_M1;
      end
      else if(BID_S2 == MASTER2) begin
	 BREADY_S2 = BREADY_M2;
      end
      else if(BID_S2 == MASTER3) begin
	 BREADY_S2 = BREADY_M3;
      end
      else if(BID_S2 == MASTER4) begin
	 BREADY_S2 = BREADY_M4;
      end
      else if(BID_S2 == MASTER5) begin
	 BREADY_S2 = BREADY_M5;
      end
      else if(BID_S2 == MASTER6) begin
	 BREADY_S2 = BREADY_M6;
      end
      else if(BID_S2 == MASTER7) begin
	 BREADY_S2 = BREADY_M7;
      end
      else if(BID_S2 == MASTER8) begin
	 BREADY_S2 = BREADY_M8;
      end
      else if(BID_S2 == MASTER9) begin
	 BREADY_S2 = BREADY_M9;
      end
      else if(BID_S2 == MASTER10) begin
	 BREADY_S2 = BREADY_M10;
      end
      else if(BID_S2 == MASTER11) begin
	 BREADY_S2 = BREADY_M11;
      end
      else if(BID_S2 == MASTER12) begin
	 BREADY_S2 = BREADY_M12;
      end
      else if(BID_S2 == MASTER13) begin
	 BREADY_S2 = BREADY_M13;
      end
      else if(BID_S2 == MASTER14) begin
	 BREADY_S2 = BREADY_M14;
      end
      else if(BID_S2 == MASTER15) begin
	 BREADY_S2 = BREADY_M15;
      end
      else begin
	 BREADY_S2 = 0;
      end

      // slave 3
      if(BID_S3 == MASTER1) begin
	 BREADY_S3 = BREADY_M1;
      end
      else if(BID_S3 == MASTER2) begin
	 BREADY_S3 = BREADY_M2;
      end
      else if(BID_S3 == MASTER3) begin
	 BREADY_S3 = BREADY_M3;
      end
      else if(BID_S3 == MASTER4) begin
	 BREADY_S3 = BREADY_M4;
      end
      else if(BID_S3 == MASTER5) begin
	 BREADY_S3 = BREADY_M5;
      end
      else if(BID_S3 == MASTER6) begin
	 BREADY_S3 = BREADY_M6;
      end
      else if(BID_S3 == MASTER7) begin
	 BREADY_S3 = BREADY_M7;
      end
      else if(BID_S3 == MASTER8) begin
	 BREADY_S3 = BREADY_M8;
      end
      else if(BID_S3 == MASTER9) begin
	 BREADY_S3 = BREADY_M9;
      end
      else if(BID_S3 == MASTER10) begin
	 BREADY_S3 = BREADY_M10;
      end
      else if(BID_S3 == MASTER11) begin
	 BREADY_S3 = BREADY_M11;
      end
      else if(BID_S3 == MASTER12) begin
	 BREADY_S3 = BREADY_M12;
      end
      else if(BID_S3 == MASTER13) begin
	 BREADY_S3 = BREADY_M13;
      end
      else if(BID_S3 == MASTER14) begin
	 BREADY_S3 = BREADY_M14;
      end
      else if(BID_S3 == MASTER15) begin
	 BREADY_S3 = BREADY_M15;
      end
      else begin
	 BREADY_S3 = 0;
      end

      // slave 4
      if(BID_S4 == MASTER1) begin
	 BREADY_S4 = BREADY_M1;
      end
      else if(BID_S4 == MASTER2) begin
	 BREADY_S4 = BREADY_M2;
      end
      else if(BID_S4 == MASTER3) begin
	 BREADY_S4 = BREADY_M3;
      end
      else if(BID_S4 == MASTER4) begin
	 BREADY_S4 = BREADY_M4;
      end
      else if(BID_S4 == MASTER5) begin
	 BREADY_S4 = BREADY_M5;
      end
      else if(BID_S4 == MASTER6) begin
	 BREADY_S4 = BREADY_M6;
      end
      else if(BID_S4 == MASTER7) begin
	 BREADY_S4 = BREADY_M7;
      end
      else if(BID_S4 == MASTER8) begin
	 BREADY_S4 = BREADY_M8;
      end
      else if(BID_S4 == MASTER9) begin
	 BREADY_S4 = BREADY_M9;
      end
      else if(BID_S4 == MASTER10) begin
	 BREADY_S4 = BREADY_M10;
      end
      else if(BID_S4 == MASTER11) begin
	 BREADY_S4 = BREADY_M11;
      end
      else if(BID_S4 == MASTER12) begin
	 BREADY_S4 = BREADY_M12;
      end
      else if(BID_S4 == MASTER13) begin
	 BREADY_S4 = BREADY_M13;
      end
      else if(BID_S4 == MASTER14) begin
	 BREADY_S4 = BREADY_M14;
      end
      else if(BID_S4 == MASTER15) begin
	 BREADY_S4 = BREADY_M15;
      end
      else begin
	 BREADY_S4 = 0;
      end
      
   end    

   //-------------------------------------------------------------------------
   // Read address channel muxing
   //-------------------------------------------------------------------------

   // master mux
   always @ (/*AS*/ARADDR_M1 or ARADDR_M10 or ARADDR_M11 or ARADDR_M12
	     or ARADDR_M13 or ARADDR_M14 or ARADDR_M15 or ARADDR_M2
	     or ARADDR_M3 or ARADDR_M4 or ARADDR_M5 or ARADDR_M6
	     or ARADDR_M7 or ARADDR_M8 or ARADDR_M9 or ARREADY_S1
	     or ARREADY_S2 or ARREADY_S3 or ARREADY_S4 or ARVALID_M1
	     or ARVALID_M10 or ARVALID_M11 or ARVALID_M12
	     or ARVALID_M13 or ARVALID_M14 or ARVALID_M15
	     or ARVALID_M2 or ARVALID_M3 or ARVALID_M4 or ARVALID_M5
	     or ARVALID_M6 or ARVALID_M7 or ARVALID_M8 or ARVALID_M9) begin

      if (ARVALID_M1) begin
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M1[31:28] == SLAVE1)
	   ARREADY_M1 = ARREADY_S1;
	 else if(ARADDR_M1[31:28] == SLAVE2)
	   ARREADY_M1 = ARREADY_S2;
	 else if(ARADDR_M1[31:28] == SLAVE3)
	   ARREADY_M1 = ARREADY_S3;
	 else if(ARADDR_M1[31:28] == SLAVE4)
	   ARREADY_M1 = ARREADY_S4;
	 else
	   ARREADY_M1 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M2) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M2[31:28] == SLAVE1)
	   ARREADY_M2 = ARREADY_S1;
	 else if(ARADDR_M2[31:28] == SLAVE2)
	   ARREADY_M2 = ARREADY_S2;
	 else if(ARADDR_M2[31:28] == SLAVE3)
	   ARREADY_M2 = ARREADY_S3;
	 else if(ARADDR_M2[31:28] == SLAVE4)
	   ARREADY_M2 = ARREADY_S4;
	 else
	   ARREADY_M2 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M3) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M3[31:28] == SLAVE1)
	   ARREADY_M3 = ARREADY_S1;
	 else if(ARADDR_M3[31:28] == SLAVE2)
	   ARREADY_M3 = ARREADY_S2;
	 else if(ARADDR_M3[31:28] == SLAVE3)
	   ARREADY_M3 = ARREADY_S3;
	 else if(ARADDR_M3[31:28] == SLAVE4)
	   ARREADY_M3 = ARREADY_S4;
	 else
	   ARREADY_M3 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M4) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M4[31:28] == SLAVE1)
	   ARREADY_M4 = ARREADY_S1;
	 else if(ARADDR_M4[31:28] == SLAVE2)
	   ARREADY_M4 = ARREADY_S2;
	 else if(ARADDR_M4[31:28] == SLAVE3)
	   ARREADY_M4 = ARREADY_S3;
	 else if(ARADDR_M4[31:28] == SLAVE4)
	   ARREADY_M4 = ARREADY_S4;
	 else
	   ARREADY_M4 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M5) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M5[31:28] == SLAVE1)
	   ARREADY_M5 = ARREADY_S1;
	 else if(ARADDR_M5[31:28] == SLAVE2)
	   ARREADY_M5 = ARREADY_S2;
	 else if(ARADDR_M5[31:28] == SLAVE3)
	   ARREADY_M5 = ARREADY_S3;
	 else if(ARADDR_M5[31:28] == SLAVE4)
	   ARREADY_M5 = ARREADY_S4;
	 else
	   ARREADY_M5 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M6) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M6[31:28] == SLAVE1)
	   ARREADY_M6 = ARREADY_S1;
	 else if(ARADDR_M6[31:28] == SLAVE2)
	   ARREADY_M6 = ARREADY_S2;
	 else if(ARADDR_M6[31:28] == SLAVE3)
	   ARREADY_M6 = ARREADY_S3;
	 else if(ARADDR_M6[31:28] == SLAVE4)
	   ARREADY_M6 = ARREADY_S4;
	 else
	   ARREADY_M6 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M7) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M7[31:28] == SLAVE1)
	   ARREADY_M7 = ARREADY_S1;
	 else if(ARADDR_M7[31:28] == SLAVE2)
	   ARREADY_M7 = ARREADY_S2;
	 else if(ARADDR_M7[31:28] == SLAVE3)
	   ARREADY_M7 = ARREADY_S3;
	 else if(ARADDR_M7[31:28] == SLAVE4)
	   ARREADY_M7 = ARREADY_S4;
	 else
	   ARREADY_M7 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M8) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M8[31:28] == SLAVE1)
	   ARREADY_M8 = ARREADY_S1;
	 else if(ARADDR_M8[31:28] == SLAVE2)
	   ARREADY_M8 = ARREADY_S2;
	 else if(ARADDR_M8[31:28] == SLAVE3)
	   ARREADY_M8 = ARREADY_S3;
	 else if(ARADDR_M8[31:28] == SLAVE4)
	   ARREADY_M8 = ARREADY_S4;
	 else
	   ARREADY_M8 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M9) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M9[31:28] == SLAVE1)
	   ARREADY_M9 = ARREADY_S1;
	 else if(ARADDR_M9[31:28] == SLAVE2)
	   ARREADY_M9 = ARREADY_S2;
	 else if(ARADDR_M9[31:28] == SLAVE3)
	   ARREADY_M9 = ARREADY_S3;
	 else if(ARADDR_M9[31:28] == SLAVE4)
	   ARREADY_M9 = ARREADY_S4;
	 else
	   ARREADY_M9 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M10) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M10[31:28] == SLAVE1)
	   ARREADY_M10 = ARREADY_S1;
	 else if(ARADDR_M10[31:28] == SLAVE2)
	   ARREADY_M10 = ARREADY_S2;
	 else if(ARADDR_M10[31:28] == SLAVE3)
	   ARREADY_M10 = ARREADY_S3;
	 else if(ARADDR_M10[31:28] == SLAVE4)
	   ARREADY_M10 = ARREADY_S4;
	 else
	   ARREADY_M10 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M11) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M11[31:28] == SLAVE1)
	   ARREADY_M11 = ARREADY_S1;
	 else if(ARADDR_M11[31:28] == SLAVE2)
	   ARREADY_M11 = ARREADY_S2;
	 else if(ARADDR_M11[31:28] == SLAVE3)
	   ARREADY_M11 = ARREADY_S3;
	 else if(ARADDR_M11[31:28] == SLAVE4)
	   ARREADY_M11 = ARREADY_S4;
	 else
	   ARREADY_M11 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M12) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M12[31:28] == SLAVE1)
	   ARREADY_M12 = ARREADY_S1;
	 else if(ARADDR_M12[31:28] == SLAVE2)
	   ARREADY_M12 = ARREADY_S2;
	 else if(ARADDR_M12[31:28] == SLAVE3)
	   ARREADY_M12 = ARREADY_S3;
	 else if(ARADDR_M12[31:28] == SLAVE4)
	   ARREADY_M12 = ARREADY_S4;
	 else
	   ARREADY_M12 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M13) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M14 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M13[31:28] == SLAVE1)
	   ARREADY_M13 = ARREADY_S1;
	 else if(ARADDR_M13[31:28] == SLAVE2)
	   ARREADY_M13 = ARREADY_S2;
	 else if(ARADDR_M13[31:28] == SLAVE3)
	   ARREADY_M13 = ARREADY_S3;
	 else if(ARADDR_M13[31:28] == SLAVE4)
	   ARREADY_M13 = ARREADY_S4;
	 else
	   ARREADY_M13 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M14) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M15 = 1'b0;

	 if(ARADDR_M14[31:28] == SLAVE1)
	   ARREADY_M14 = ARREADY_S1;
	 else if(ARADDR_M14[31:28] == SLAVE2)
	   ARREADY_M14 = ARREADY_S2;
	 else if(ARADDR_M14[31:28] == SLAVE3)
	   ARREADY_M14 = ARREADY_S3;
	 else if(ARADDR_M14[31:28] == SLAVE4)
	   ARREADY_M14 = ARREADY_S4;
	 else
	   ARREADY_M14 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else if (ARVALID_M15) begin
	 ARREADY_M1 = 1'b0;
	 ARREADY_M2 = 1'b0;
	 ARREADY_M3 = 1'b0;
	 ARREADY_M4 = 1'b0;
	 ARREADY_M5 = 1'b0;
	 ARREADY_M6 = 1'b0;
	 ARREADY_M7 = 1'b0;
	 ARREADY_M8 = 1'b0;
	 ARREADY_M9 = 1'b0;
	 ARREADY_M10 = 1'b0;
	 ARREADY_M11 = 1'b0;
	 ARREADY_M12 = 1'b0;
	 ARREADY_M13 = 1'b0;
	 ARREADY_M14 = 1'b0;

	 if(ARADDR_M15[31:28] == SLAVE1)
	   ARREADY_M15 = ARREADY_S1;
	 else if(ARADDR_M15[31:28] == SLAVE2)
	   ARREADY_M15 = ARREADY_S2;
	 else if(ARADDR_M15[31:28] == SLAVE3)
	   ARREADY_M15 = ARREADY_S3;
	 else if(ARADDR_M15[31:28] == SLAVE4)
	   ARREADY_M15 = ARREADY_S4;
	 else
	   ARREADY_M15 = (ARREADY_S1 | ARREADY_S2 | ARREADY_S3 | ARREADY_S4);
      end
      else begin
	   ARREADY_M1 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M2 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M3 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M4 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M5 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M6 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M7 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M8 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M9 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M10 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M11 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M12 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M13 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M14 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
	   ARREADY_M15 = (ARREADY_S4 | ARREADY_S1 | ARREADY_S2 | ARREADY_S3);
      end
      
   end
   
   // slave mux
   always @ (/*AS*/ARADDR_M1 or ARADDR_M10 or ARADDR_M11 or ARADDR_M12
	     or ARADDR_M13 or ARADDR_M14 or ARADDR_M15 or ARADDR_M2
	     or ARADDR_M3 or ARADDR_M4 or ARADDR_M5 or ARADDR_M6
	     or ARADDR_M7 or ARADDR_M8 or ARADDR_M9 or ARBURST_M1
	     or ARBURST_M10 or ARBURST_M11 or ARBURST_M12
	     or ARBURST_M13 or ARBURST_M14 or ARBURST_M15
	     or ARBURST_M2 or ARBURST_M3 or ARBURST_M4 or ARBURST_M5
	     or ARBURST_M6 or ARBURST_M7 or ARBURST_M8 or ARBURST_M9
	     or ARID_M1 or ARID_M10 or ARID_M11 or ARID_M12
	     or ARID_M13 or ARID_M14 or ARID_M15 or ARID_M2 or ARID_M3
	     or ARID_M4 or ARID_M5 or ARID_M6 or ARID_M7 or ARID_M8
	     or ARID_M9 or ARLEN_M1 or ARLEN_M10 or ARLEN_M11
	     or ARLEN_M12 or ARLEN_M13 or ARLEN_M14 or ARLEN_M15
	     or ARLEN_M2 or ARLEN_M3 or ARLEN_M4 or ARLEN_M5
	     or ARLEN_M6 or ARLEN_M7 or ARLEN_M8 or ARLEN_M9
	     or ARSIZE_M1 or ARSIZE_M10 or ARSIZE_M11 or ARSIZE_M12
	     or ARSIZE_M13 or ARSIZE_M14 or ARSIZE_M15 or ARSIZE_M2
	     or ARSIZE_M3 or ARSIZE_M4 or ARSIZE_M5 or ARSIZE_M6
	     or ARSIZE_M7 or ARSIZE_M8 or ARSIZE_M9 or ARVALID_M1
	     or ARVALID_M10 or ARVALID_M11 or ARVALID_M12
	     or ARVALID_M13 or ARVALID_M14 or ARVALID_M15
	     or ARVALID_M2 or ARVALID_M3 or ARVALID_M4 or ARVALID_M5
	     or ARVALID_M6 or ARVALID_M7 or ARVALID_M8 or ARVALID_M9) begin

      // slave 1
      if (ARVALID_M1 && ARADDR_M1[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M1;
	 ARADDR_S1 = ARADDR_M1;
	 ARLEN_S1 = ARLEN_M1;
	 ARVALID_S1 = ARVALID_M1;
 	 ARSIZE_S1  = ARSIZE_M1;
 	 ARBURST_S1 = ARBURST_M1;
      end
      else if (ARVALID_M2 && ARADDR_M2[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M2;
	 ARADDR_S1 = ARADDR_M2;
	 ARLEN_S1 = ARLEN_M2;
	 ARVALID_S1 = ARVALID_M2;
 	 ARSIZE_S1  = ARSIZE_M2;
 	 ARBURST_S1 = ARBURST_M2;
      end
      else if (ARVALID_M3 && ARADDR_M3[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M3;
	 ARADDR_S1 = ARADDR_M3;
	 ARLEN_S1 = ARLEN_M3;
	 ARVALID_S1 = ARVALID_M3;
 	 ARSIZE_S1  = ARSIZE_M3;
 	 ARBURST_S1 = ARBURST_M3;
      end
      else if(ARVALID_M4 && ARADDR_M4[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M4;
	 ARADDR_S1 = ARADDR_M4;
	 ARLEN_S1 = ARLEN_M4;
	 ARVALID_S1 = ARVALID_M4;
 	 ARSIZE_S1  = ARSIZE_M4;
 	 ARBURST_S1 = ARBURST_M4;
      end
      else if(ARVALID_M5 && ARADDR_M5[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M5;
	 ARADDR_S1 = ARADDR_M5;
	 ARLEN_S1 = ARLEN_M5;
	 ARVALID_S1 = ARVALID_M5;
 	 ARSIZE_S1  = ARSIZE_M5;
 	 ARBURST_S1 = ARBURST_M5;
      end
      else if(ARVALID_M6 && ARADDR_M6[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M6;
	 ARADDR_S1 = ARADDR_M6;
	 ARLEN_S1 = ARLEN_M6;
	 ARVALID_S1 = ARVALID_M6;
 	 ARSIZE_S1  = ARSIZE_M6;
 	 ARBURST_S1 = ARBURST_M6;
      end
      else if(ARVALID_M7 && ARADDR_M7[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M7;
	 ARADDR_S1 = ARADDR_M7;
	 ARLEN_S1 = ARLEN_M7;
	 ARVALID_S1 = ARVALID_M7;
 	 ARSIZE_S1  = ARSIZE_M7;
 	 ARBURST_S1 = ARBURST_M7;
      end
      else if(ARVALID_M8 && ARADDR_M8[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M8;
	 ARADDR_S1 = ARADDR_M8;
	 ARLEN_S1 = ARLEN_M8;
	 ARVALID_S1 = ARVALID_M8;
 	 ARSIZE_S1  = ARSIZE_M8;
 	 ARBURST_S1 = ARBURST_M8;
      end
      else if(ARVALID_M9 && ARADDR_M9[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M9;
	 ARADDR_S1 = ARADDR_M9;
	 ARLEN_S1 = ARLEN_M9;
	 ARVALID_S1 = ARVALID_M9;
 	 ARSIZE_S1  = ARSIZE_M9;
 	 ARBURST_S1 = ARBURST_M9;
      end
      else if(ARVALID_M10 && ARADDR_M10[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M10;
	 ARADDR_S1 = ARADDR_M10;
	 ARLEN_S1 = ARLEN_M10;
	 ARVALID_S1 = ARVALID_M10;
 	 ARSIZE_S1  = ARSIZE_M10;
 	 ARBURST_S1 = ARBURST_M10;
      end
      else if(ARVALID_M11 && ARADDR_M11[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M11;
	 ARADDR_S1 = ARADDR_M11;
	 ARLEN_S1 = ARLEN_M11;
	 ARVALID_S1 = ARVALID_M11;
 	 ARSIZE_S1  = ARSIZE_M11;
 	 ARBURST_S1 = ARBURST_M11;
      end
      else if(ARVALID_M12 && ARADDR_M12[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M12;
	 ARADDR_S1 = ARADDR_M12;
	 ARLEN_S1 = ARLEN_M12;
	 ARVALID_S1 = ARVALID_M12;
 	 ARSIZE_S1  = ARSIZE_M12;
 	 ARBURST_S1 = ARBURST_M12;
      end
      else if(ARVALID_M13 && ARADDR_M13[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M13;
	 ARADDR_S1 = ARADDR_M13;
	 ARLEN_S1 = ARLEN_M13;
	 ARVALID_S1 = ARVALID_M13;
 	 ARSIZE_S1  = ARSIZE_M13;
 	 ARBURST_S1 = ARBURST_M13;
      end
      else if(ARVALID_M14 && ARADDR_M14[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M14;
	 ARADDR_S1 = ARADDR_M14;
	 ARLEN_S1 = ARLEN_M14;
	 ARVALID_S1 = ARVALID_M14;
 	 ARSIZE_S1  = ARSIZE_M14;
 	 ARBURST_S1 = ARBURST_M14;
      end
      else if(ARVALID_M15 && ARADDR_M15[31:28] == SLAVE1) begin
	 ARID_S1 = ARID_M15;
	 ARADDR_S1 = ARADDR_M15;
	 ARLEN_S1 = ARLEN_M15;
	 ARVALID_S1 = ARVALID_M15;
 	 ARSIZE_S1  = ARSIZE_M15;
 	 ARBURST_S1 = ARBURST_M15;
      end
      else begin
	 ARID_S1    = 0;
	 ARADDR_S1  = 0;
	 ARLEN_S1   = 0;
	 ARVALID_S1 = 0;
 	 ARSIZE_S1  = 0;
 	 ARBURST_S1 = 0;
      end 

      // slave 2
      if (ARVALID_M1 && ARADDR_M1[31:28] == SLAVE2) begin
	 ARID_S2    = ARID_M1;
	 ARADDR_S2  = ARADDR_M1;
	 ARLEN_S2   = ARLEN_M1;
	 ARVALID_S2 = ARVALID_M1;
 	 ARSIZE_S2  = ARSIZE_M1;
 	 ARBURST_S2 = ARBURST_M1;
      end
      else if (ARVALID_M2 && ARADDR_M2[31:28] == SLAVE2) begin
	 ARID_S2    = ARID_M2;
	 ARADDR_S2  = ARADDR_M2;
	 ARLEN_S2   = ARLEN_M2;
	 ARVALID_S2 = ARVALID_M2;
 	 ARSIZE_S2  = ARSIZE_M2;
 	 ARBURST_S2 = ARBURST_M2;
      end
      else if (ARVALID_M3 && ARADDR_M3[31:28] == SLAVE2) begin
	 ARID_S2    = ARID_M3;
	 ARADDR_S2  = ARADDR_M3;
	 ARLEN_S2   = ARLEN_M3;
	 ARVALID_S2 = ARVALID_M3;
 	 ARSIZE_S2  = ARSIZE_M3;
 	 ARBURST_S2 = ARBURST_M3;
      end
      else if(ARVALID_M4 && ARADDR_M4[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M4;
	 ARADDR_S2 = ARADDR_M4;
	 ARLEN_S2 = ARLEN_M4;
	 ARVALID_S2 = ARVALID_M4;
 	 ARSIZE_S2  = ARSIZE_M4;
 	 ARBURST_S2 = ARBURST_M4;
      end
      else if(ARVALID_M5 && ARADDR_M5[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M5;
	 ARADDR_S2 = ARADDR_M5;
	 ARLEN_S2 = ARLEN_M5;
	 ARVALID_S2 = ARVALID_M5;
 	 ARSIZE_S2  = ARSIZE_M5;
 	 ARBURST_S2 = ARBURST_M5;
      end
      else if(ARVALID_M6 && ARADDR_M6[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M6;
	 ARADDR_S2 = ARADDR_M6;
	 ARLEN_S2 = ARLEN_M6;
	 ARVALID_S2 = ARVALID_M6;
 	 ARSIZE_S2  = ARSIZE_M6;
 	 ARBURST_S2 = ARBURST_M6;
      end
      else if(ARVALID_M7 && ARADDR_M7[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M7;
	 ARADDR_S2 = ARADDR_M7;
	 ARLEN_S2 = ARLEN_M7;
	 ARVALID_S2 = ARVALID_M7;
 	 ARSIZE_S2  = ARSIZE_M7;
 	 ARBURST_S2 = ARBURST_M7;
      end
      else if(ARVALID_M8 && ARADDR_M8[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M8;
	 ARADDR_S2 = ARADDR_M8;
	 ARLEN_S2 = ARLEN_M8;
	 ARVALID_S2 = ARVALID_M8;
 	 ARSIZE_S2  = ARSIZE_M8;
 	 ARBURST_S2 = ARBURST_M8;
      end
      else if(ARVALID_M9 && ARADDR_M9[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M9;
	 ARADDR_S2 = ARADDR_M9;
	 ARLEN_S2 = ARLEN_M9;
	 ARVALID_S2 = ARVALID_M9;
 	 ARSIZE_S2  = ARSIZE_M9;
 	 ARBURST_S2 = ARBURST_M9;
      end
      else if(ARVALID_M10 && ARADDR_M10[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M10;
	 ARADDR_S2 = ARADDR_M10;
	 ARLEN_S2 = ARLEN_M10;
	 ARVALID_S2 = ARVALID_M10;
 	 ARSIZE_S2  = ARSIZE_M10;
 	 ARBURST_S2 = ARBURST_M10;
      end
      else if(ARVALID_M11 && ARADDR_M11[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M11;
	 ARADDR_S2 = ARADDR_M11;
	 ARLEN_S2 = ARLEN_M11;
	 ARVALID_S2 = ARVALID_M11;
 	 ARSIZE_S2  = ARSIZE_M11;
 	 ARBURST_S2 = ARBURST_M11;
      end
      else if(ARVALID_M12 && ARADDR_M12[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M12;
	 ARADDR_S2 = ARADDR_M12;
	 ARLEN_S2 = ARLEN_M12;
	 ARVALID_S2 = ARVALID_M12;
 	 ARSIZE_S2  = ARSIZE_M12;
 	 ARBURST_S2 = ARBURST_M12;
      end
      else if(ARVALID_M13 && ARADDR_M13[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M13;
	 ARADDR_S2 = ARADDR_M13;
	 ARLEN_S2 = ARLEN_M13;
	 ARVALID_S2 = ARVALID_M13;
 	 ARSIZE_S2  = ARSIZE_M13;
 	 ARBURST_S2 = ARBURST_M13;
      end
      else if(ARVALID_M14 && ARADDR_M14[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M14;
	 ARADDR_S2 = ARADDR_M14;
	 ARLEN_S2 = ARLEN_M14;
	 ARVALID_S2 = ARVALID_M14;
 	 ARSIZE_S2  = ARSIZE_M14;
 	 ARBURST_S2 = ARBURST_M14;
      end
      else if(ARVALID_M15 && ARADDR_M15[31:28] == SLAVE2) begin
	 ARID_S2 = ARID_M15;
	 ARADDR_S2 = ARADDR_M15;
	 ARLEN_S2 = ARLEN_M15;
	 ARVALID_S2 = ARVALID_M15;
 	 ARSIZE_S2  = ARSIZE_M15;
 	 ARBURST_S2 = ARBURST_M15;
      end
      else begin
	 ARID_S2    = 0;
	 ARADDR_S2  = 0;
	 ARLEN_S2   = 0;
	 ARVALID_S2 = 0;
 	 ARSIZE_S2  = 0;
 	 ARBURST_S2 = 0;
      end 

      // slave 3
      if (ARVALID_M1 && ARADDR_M1[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M1;
	 ARADDR_S3 = ARADDR_M1;
	 ARLEN_S3 = ARLEN_M1;
	 ARVALID_S3 = ARVALID_M1;
 	 ARSIZE_S3  = ARSIZE_M1;
 	 ARBURST_S3 = ARBURST_M1;
      end
      else if (ARVALID_M2 && ARADDR_M2[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M2;
	 ARADDR_S3 = ARADDR_M2;
	 ARLEN_S3 = ARLEN_M2;
	 ARVALID_S3 = ARVALID_M2;
 	 ARSIZE_S3  = ARSIZE_M2;
 	 ARBURST_S3 = ARBURST_M2;
      end
      else if (ARVALID_M3 && ARADDR_M3[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M3;
	 ARADDR_S3 = ARADDR_M3;
	 ARLEN_S3 = ARLEN_M3;
	 ARVALID_S3 = ARVALID_M3;
 	 ARSIZE_S3  = ARSIZE_M3;
 	 ARBURST_S3 = ARBURST_M3;
      end
      else if(ARVALID_M4 && ARADDR_M4[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M4;
	 ARADDR_S3 = ARADDR_M4;
	 ARLEN_S3 = ARLEN_M4;
	 ARVALID_S3 = ARVALID_M4;
 	 ARSIZE_S3  = ARSIZE_M4;
 	 ARBURST_S3 = ARBURST_M4;
      end
      else if(ARVALID_M5 && ARADDR_M5[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M5;
	 ARADDR_S3 = ARADDR_M5;
	 ARLEN_S3 = ARLEN_M5;
	 ARVALID_S3 = ARVALID_M5;
 	 ARSIZE_S3  = ARSIZE_M5;
 	 ARBURST_S3 = ARBURST_M5;
      end
      else if(ARVALID_M6 && ARADDR_M6[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M6;
	 ARADDR_S3 = ARADDR_M6;
	 ARLEN_S3 = ARLEN_M6;
	 ARVALID_S3 = ARVALID_M6;
 	 ARSIZE_S3  = ARSIZE_M6;
 	 ARBURST_S3 = ARBURST_M6;
      end
      else if(ARVALID_M7 && ARADDR_M7[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M7;
	 ARADDR_S3 = ARADDR_M7;
	 ARLEN_S3 = ARLEN_M7;
	 ARVALID_S3 = ARVALID_M7;
 	 ARSIZE_S3  = ARSIZE_M7;
 	 ARBURST_S3 = ARBURST_M7;
      end
      else if(ARVALID_M8 && ARADDR_M8[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M8;
	 ARADDR_S3 = ARADDR_M8;
	 ARLEN_S3 = ARLEN_M8;
	 ARVALID_S3 = ARVALID_M8;
 	 ARSIZE_S3  = ARSIZE_M8;
 	 ARBURST_S3 = ARBURST_M8;
      end
      else if(ARVALID_M9 && ARADDR_M9[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M9;
	 ARADDR_S3 = ARADDR_M9;
	 ARLEN_S3 = ARLEN_M9;
	 ARVALID_S3 = ARVALID_M9;
 	 ARSIZE_S3  = ARSIZE_M9;
 	 ARBURST_S3 = ARBURST_M9;
      end
      else if(ARVALID_M10 && ARADDR_M10[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M10;
	 ARADDR_S3 = ARADDR_M10;
	 ARLEN_S3 = ARLEN_M10;
	 ARVALID_S3 = ARVALID_M10;
 	 ARSIZE_S3  = ARSIZE_M10;
 	 ARBURST_S3 = ARBURST_M10;
      end
      else if(ARVALID_M11 && ARADDR_M11[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M11;
	 ARADDR_S3 = ARADDR_M11;
	 ARLEN_S3 = ARLEN_M11;
	 ARVALID_S3 = ARVALID_M11;
 	 ARSIZE_S3  = ARSIZE_M11;
 	 ARBURST_S3 = ARBURST_M11;
      end
      else if(ARVALID_M12 && ARADDR_M12[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M12;
	 ARADDR_S3 = ARADDR_M12;
	 ARLEN_S3 = ARLEN_M12;
	 ARVALID_S3 = ARVALID_M12;
 	 ARSIZE_S3  = ARSIZE_M12;
 	 ARBURST_S3 = ARBURST_M12;
      end
      else if(ARVALID_M13 && ARADDR_M13[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M13;
	 ARADDR_S3 = ARADDR_M13;
	 ARLEN_S3 = ARLEN_M13;
	 ARVALID_S3 = ARVALID_M13;
 	 ARSIZE_S3  = ARSIZE_M13;
 	 ARBURST_S3 = ARBURST_M13;
      end
      else if(ARVALID_M14 && ARADDR_M14[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M14;
	 ARADDR_S3 = ARADDR_M14;
	 ARLEN_S3 = ARLEN_M14;
	 ARVALID_S3 = ARVALID_M14;
 	 ARSIZE_S3  = ARSIZE_M14;
 	 ARBURST_S3 = ARBURST_M14;
      end
      else if(ARVALID_M15 && ARADDR_M15[31:28] == SLAVE3) begin
	 ARID_S3 = ARID_M15;
	 ARADDR_S3 = ARADDR_M15;
	 ARLEN_S3 = ARLEN_M15;
	 ARVALID_S3 = ARVALID_M15;
 	 ARSIZE_S3  = ARSIZE_M15;
 	 ARBURST_S3 = ARBURST_M15;
      end
      else begin
	 ARID_S3 = 0;
	 ARADDR_S3 = 0;
	 ARLEN_S3 = 0;
	 ARVALID_S3 = 0;
 	 ARSIZE_S3  = 0;
 	 ARBURST_S3 = 0;
      end 
      
      // slave 4
      if(ARVALID_M1 && ARADDR_M1[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M1;
	 ARADDR_S4 = ARADDR_M1;
	 ARLEN_S4 = ARLEN_M1;
	 ARVALID_S4 = ARVALID_M1;
 	 ARSIZE_S4  = ARSIZE_M1;
 	 ARBURST_S4 = ARBURST_M1;
      end
      else if(ARVALID_M2 && ARADDR_M2[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M2;
	 ARADDR_S4 = ARADDR_M2;
	 ARLEN_S4 = ARLEN_M2;
	 ARVALID_S4 = ARVALID_M2;
 	 ARSIZE_S4  = ARSIZE_M2;
 	 ARBURST_S4 = ARBURST_M2;
      end
      else if(ARVALID_M3 && ARADDR_M3[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M3;
	 ARADDR_S4 = ARADDR_M3;
	 ARLEN_S4 = ARLEN_M3;
	 ARVALID_S4 = ARVALID_M3;
 	 ARSIZE_S4  = ARSIZE_M3;
 	 ARBURST_S4 = ARBURST_M3;
      end
      else if(ARVALID_M4 && ARADDR_M4[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M4;
	 ARADDR_S4 = ARADDR_M4;
	 ARLEN_S4 = ARLEN_M4;
	 ARVALID_S4 = ARVALID_M4;
 	 ARSIZE_S4  = ARSIZE_M4;
 	 ARBURST_S4 = ARBURST_M4;
      end
      else if(ARVALID_M5 && ARADDR_M5[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M5;
	 ARADDR_S4 = ARADDR_M5;
	 ARLEN_S4 = ARLEN_M5;
	 ARVALID_S4 = ARVALID_M5;
 	 ARSIZE_S4  = ARSIZE_M5;
 	 ARBURST_S4 = ARBURST_M5;
      end
      else if(ARVALID_M6 && ARADDR_M6[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M6;
	 ARADDR_S4 = ARADDR_M6;
	 ARLEN_S4 = ARLEN_M6;
	 ARVALID_S4 = ARVALID_M6;
 	 ARSIZE_S4  = ARSIZE_M6;
 	 ARBURST_S4 = ARBURST_M6;
      end
      else if(ARVALID_M7 && ARADDR_M7[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M7;
	 ARADDR_S4 = ARADDR_M7;
	 ARLEN_S4 = ARLEN_M7;
	 ARVALID_S4 = ARVALID_M7;
 	 ARSIZE_S4  = ARSIZE_M7;
 	 ARBURST_S4 = ARBURST_M7;
      end
      else if(ARVALID_M8 && ARADDR_M8[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M8;
	 ARADDR_S4 = ARADDR_M8;
	 ARLEN_S4 = ARLEN_M8;
	 ARVALID_S4 = ARVALID_M8;
 	 ARSIZE_S4  = ARSIZE_M8;
 	 ARBURST_S4 = ARBURST_M8;
      end
      else if(ARVALID_M9 && ARADDR_M9[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M9;
	 ARADDR_S4 = ARADDR_M9;
	 ARLEN_S4 = ARLEN_M9;
	 ARVALID_S4 = ARVALID_M9;
 	 ARSIZE_S4  = ARSIZE_M9;
 	 ARBURST_S4 = ARBURST_M9;
      end
      else if(ARVALID_M10 && ARADDR_M10[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M10;
	 ARADDR_S4 = ARADDR_M10;
	 ARLEN_S4 = ARLEN_M10;
	 ARVALID_S4 = ARVALID_M10;
 	 ARSIZE_S4  = ARSIZE_M10;
 	 ARBURST_S4 = ARBURST_M10;
      end
      else if(ARVALID_M11 && ARADDR_M11[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M11;
	 ARADDR_S4 = ARADDR_M11;
	 ARLEN_S4 = ARLEN_M11;
	 ARVALID_S4 = ARVALID_M11;
 	 ARSIZE_S4  = ARSIZE_M11;
 	 ARBURST_S4 = ARBURST_M11;
      end
      else if(ARVALID_M12 && ARADDR_M12[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M12;
	 ARADDR_S4 = ARADDR_M12;
	 ARLEN_S4 = ARLEN_M12;
	 ARVALID_S4 = ARVALID_M12;
 	 ARSIZE_S4  = ARSIZE_M12;
 	 ARBURST_S4 = ARBURST_M12;
      end
      else if(ARVALID_M13 && ARADDR_M13[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M13;
	 ARADDR_S4 = ARADDR_M13;
	 ARLEN_S4 = ARLEN_M13;
	 ARVALID_S4 = ARVALID_M13;
 	 ARSIZE_S4  = ARSIZE_M13;
 	 ARBURST_S4 = ARBURST_M13;
      end
      else if(ARVALID_M14 && ARADDR_M14[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M14;
	 ARADDR_S4 = ARADDR_M14;
	 ARLEN_S4 = ARLEN_M14;
	 ARVALID_S4 = ARVALID_M14;
 	 ARSIZE_S4  = ARSIZE_M14;
 	 ARBURST_S4 = ARBURST_M14;
      end
      else if(ARVALID_M15 && ARADDR_M15[31:28] == SLAVE4) begin
	 ARID_S4 = ARID_M15;
	 ARADDR_S4 = ARADDR_M15;
	 ARLEN_S4 = ARLEN_M15;
	 ARVALID_S4 = ARVALID_M15;
 	 ARSIZE_S4  = ARSIZE_M15;
 	 ARBURST_S4 = ARBURST_M15;
      end
      else begin
	 ARID_S4 = 0;
	 ARADDR_S4 = 0;
	 ARLEN_S4 = 0;
	 ARVALID_S4 = 0;
 	 ARSIZE_S4  = 0;
 	 ARBURST_S4 = 0;
      end 

   end
   
   //-------------------------------------------------------------------------
   // Read data channel muxing
   //-------------------------------------------------------------------------

   always @ (/*AS*/RDATA_S1 or RDATA_S2 or RDATA_S3 or RDATA_S4
	     or RID_S1 or RID_S2 or RID_S3 or RID_S4 or RLAST_S1
	     or RLAST_S2 or RLAST_S3 or RLAST_S4 or RRESP_S1
	     or RRESP_S2 or RRESP_S3 or RRESP_S4 or RVALID_S1
	     or RVALID_S2 or RVALID_S3 or RVALID_S4) begin

      // master 1
      if (RID_S1 == MASTER1 && RVALID_S1) begin
	 RID_M1    = RID_S1;
	 RDATA_M1  = RDATA_S1;
	 RVALID_M1 = RVALID_S1;
	 RLAST_M1  = RLAST_S1;
	 RRESP_M1  = RRESP_S1;
      end
      else if (RID_S2 == MASTER1 && RVALID_S2) begin
	 RID_M1    = RID_S2;
	 RDATA_M1  = RDATA_S2;
	 RVALID_M1 = RVALID_S2;
	 RLAST_M1  = RLAST_S2;
	 RRESP_M1  = RRESP_S2;
      end
      else if (RID_S3 == MASTER1 && RVALID_S3) begin
	 RID_M1    = RID_S3;
	 RDATA_M1  = RDATA_S3;
	 RVALID_M1 = RVALID_S3;
	 RLAST_M1  = RLAST_S3;
	 RRESP_M1  = RRESP_S3;
      end
      else if(RID_S4 == MASTER1 && RVALID_S4) begin
	 RID_M1    = RID_S4;
	 RDATA_M1  = RDATA_S4;
	 RVALID_M1 = RVALID_S4;
	 RLAST_M1  = RLAST_S4;
	 RRESP_M1  = RRESP_S4;
      end
      else begin
	 RID_M1    = 0;
	 RDATA_M1  = 0;
	 RVALID_M1 = 0;
	 RLAST_M1  = 0;
	 RRESP_M1  = 0;
      end

      // master 2
      if (RID_S1 == MASTER2 && RVALID_S1) begin
	 RID_M2    = RID_S1;
	 RDATA_M2  = RDATA_S1;
	 RVALID_M2 = RVALID_S1;
	 RLAST_M2  = RLAST_S1;
	 RRESP_M2  = RRESP_S1;
      end
      else if (RID_S2 == MASTER2 && RVALID_S2) begin
	 RID_M2    = RID_S2;
	 RDATA_M2  = RDATA_S2;
	 RVALID_M2 = RVALID_S2;
	 RLAST_M2  = RLAST_S2;
	 RRESP_M2  = RRESP_S2;
      end
      else if (RID_S3 == MASTER2 && RVALID_S3) begin
	 RID_M2    = RID_S3;
	 RDATA_M2  = RDATA_S3;
	 RVALID_M2 = RVALID_S3;
	 RLAST_M2  = RLAST_S3;
	 RRESP_M2  = RRESP_S3;
      end
      else if(RID_S4 == MASTER2 && RVALID_S4) begin
	 RID_M2    = RID_S4;
	 RDATA_M2  = RDATA_S4;
	 RVALID_M2 = RVALID_S4;
	 RLAST_M2  = RLAST_S4;
	 RRESP_M2  = RRESP_S4;
      end
      else begin
	 RID_M2    = 0;
	 RDATA_M2  = 0;
	 RVALID_M2 = 0;
	 RLAST_M2  = 0;
	 RRESP_M2  = 0;
      end

      // master 3
      if (RID_S1 == MASTER3 && RVALID_S1) begin
	 RID_M3    = RID_S1;
	 RDATA_M3  = RDATA_S1;
	 RVALID_M3 = RVALID_S1;
	 RLAST_M3  = RLAST_S1;
	 RRESP_M3  = RRESP_S1;
      end
      else if (RID_S2 == MASTER3 && RVALID_S2) begin
	 RID_M3    = RID_S2;
	 RDATA_M3  = RDATA_S2;
	 RVALID_M3 = RVALID_S2;
	 RLAST_M3  = RLAST_S2;
	 RRESP_M3  = RRESP_S2;
      end
      else if (RID_S3 == MASTER3 && RVALID_S3) begin
	 RID_M3    = RID_S3;
	 RDATA_M3  = RDATA_S3;
	 RVALID_M3 = RVALID_S3;
	 RLAST_M3  = RLAST_S3;
	 RRESP_M3  = RRESP_S3;
      end
      else if(RID_S4 == MASTER3 && RVALID_S4) begin
	 RID_M3    = RID_S4;
	 RDATA_M3  = RDATA_S4;
	 RVALID_M3 = RVALID_S4;
	 RLAST_M3  = RLAST_S4;
	 RRESP_M3  = RRESP_S4;
      end
      else begin
	 RID_M3    = 0;
	 RDATA_M3  = 0;
	 RVALID_M3 = 0;
	 RLAST_M3  = 0;
	 RRESP_M3  = 0;
      end
      
      // master 4
      if (RID_S1 == MASTER4 && RVALID_S1) begin
	 RID_M4    = RID_S1;
	 RDATA_M4  = RDATA_S1;
	 RVALID_M4 = RVALID_S1;
	 RLAST_M4  = RLAST_S1;
	 RRESP_M4  = RRESP_S1;
      end
      else if (RID_S2 == MASTER4 && RVALID_S2) begin
	 RID_M4    = RID_S2;
	 RDATA_M4  = RDATA_S2;
	 RVALID_M4 = RVALID_S2;
	 RLAST_M4  = RLAST_S2;
	 RRESP_M4  = RRESP_S2;
      end
      else if (RID_S3 == MASTER4 && RVALID_S3) begin
	 RID_M4    = RID_S3;
	 RDATA_M4  = RDATA_S3;
	 RVALID_M4 = RVALID_S3;
	 RLAST_M4  = RLAST_S3;
	 RRESP_M4  = RRESP_S3;
      end
      else if(RID_S4 == MASTER4 && RVALID_S4) begin
	 RID_M4    = RID_S4;
	 RDATA_M4  = RDATA_S4;
	 RVALID_M4 = RVALID_S4;
	 RLAST_M4  = RLAST_S4;
	 RRESP_M4  = RRESP_S4;
      end
      else begin
	 RID_M4    = 0;
	 RDATA_M4  = 0;
	 RVALID_M4 = 0;
	 RLAST_M4  = 0;
	 RRESP_M4  = 0;
      end

      // master 5
      if (RID_S1 == MASTER5 && RVALID_S1) begin
	 RID_M5    = RID_S1;
	 RDATA_M5  = RDATA_S1;
	 RVALID_M5 = RVALID_S1;
	 RLAST_M5  = RLAST_S1;
	 RRESP_M5  = RRESP_S1;
      end
      else if (RID_S2 == MASTER5 && RVALID_S2) begin
	 RID_M5    = RID_S2;
	 RDATA_M5  = RDATA_S2;
	 RVALID_M5 = RVALID_S2;
	 RLAST_M5  = RLAST_S2;
	 RRESP_M5  = RRESP_S2;
      end
      else if (RID_S3 == MASTER5 && RVALID_S3) begin
	 RID_M5    = RID_S3;
	 RDATA_M5  = RDATA_S3;
	 RVALID_M5 = RVALID_S3;
	 RLAST_M5  = RLAST_S3;
	 RRESP_M5  = RRESP_S3;
      end
      else if(RID_S4 == MASTER5 && RVALID_S4) begin
	 RID_M5    = RID_S4;
	 RDATA_M5  = RDATA_S4;
	 RVALID_M5 = RVALID_S4;
	 RLAST_M5  = RLAST_S4;
	 RRESP_M5  = RRESP_S4;
      end
      else begin
	 RID_M5    = 0;
	 RDATA_M5  = 0;
	 RVALID_M5 = 0;
	 RLAST_M5  = 0;
	 RRESP_M5  = 0;
      end

      // master 6
      if (RID_S1 == MASTER6 && RVALID_S1) begin
	 RID_M6    = RID_S1;
	 RDATA_M6  = RDATA_S1;
	 RVALID_M6 = RVALID_S1;
	 RLAST_M6  = RLAST_S1;
	 RRESP_M6  = RRESP_S1;
      end
      else if (RID_S2 == MASTER6 && RVALID_S2) begin
	 RID_M6    = RID_S2;
	 RDATA_M6  = RDATA_S2;
	 RVALID_M6 = RVALID_S2;
	 RLAST_M6  = RLAST_S2;
	 RRESP_M6  = RRESP_S2;
      end
      else if (RID_S3 == MASTER6 && RVALID_S3) begin
	 RID_M6    = RID_S3;
	 RDATA_M6  = RDATA_S3;
	 RVALID_M6 = RVALID_S3;
	 RLAST_M6  = RLAST_S3;
	 RRESP_M6  = RRESP_S3;
      end
      else if(RID_S4 == MASTER6 && RVALID_S4) begin
	 RID_M6    = RID_S4;
	 RDATA_M6  = RDATA_S4;
	 RVALID_M6 = RVALID_S4;
	 RLAST_M6  = RLAST_S4;
	 RRESP_M6  = RRESP_S4;
      end
      else begin
	 RID_M6    = 0;
	 RDATA_M6  = 0;
	 RVALID_M6 = 0;
	 RLAST_M6  = 0;
	 RRESP_M6  = 0;
      end

      // master 7
      if (RID_S1 == MASTER7 && RVALID_S1) begin
	 RID_M7    = RID_S1;
	 RDATA_M7  = RDATA_S1;
	 RVALID_M7 = RVALID_S1;
	 RLAST_M7  = RLAST_S1;
	 RRESP_M7  = RRESP_S1;
      end
      else if (RID_S2 == MASTER7 && RVALID_S2) begin
	 RID_M7    = RID_S2;
	 RDATA_M7  = RDATA_S2;
	 RVALID_M7 = RVALID_S2;
	 RLAST_M7  = RLAST_S2;
	 RRESP_M7  = RRESP_S2;
      end
      else if (RID_S3 == MASTER7 && RVALID_S3) begin
	 RID_M7    = RID_S3;
	 RDATA_M7  = RDATA_S3;
	 RVALID_M7 = RVALID_S3;
	 RLAST_M7  = RLAST_S3;
	 RRESP_M7  = RRESP_S3;
      end
      else if(RID_S4 == MASTER7 && RVALID_S4) begin
	 RID_M7    = RID_S4;
	 RDATA_M7  = RDATA_S4;
	 RVALID_M7 = RVALID_S4;
	 RLAST_M7  = RLAST_S4;
	 RRESP_M7  = RRESP_S4;
      end
      else begin
	 RID_M7    = 0;
	 RDATA_M7  = 0;
	 RVALID_M7 = 0;
	 RLAST_M7  = 0;
	 RRESP_M7  = 0;
      end

      // master 8
      if (RID_S1 == MASTER8 && RVALID_S1) begin
	 RID_M8    = RID_S1;
	 RDATA_M8  = RDATA_S1;
	 RVALID_M8 = RVALID_S1;
	 RLAST_M8  = RLAST_S1;
	 RRESP_M8  = RRESP_S1;
      end
      else if (RID_S2 == MASTER8 && RVALID_S2) begin
	 RID_M8    = RID_S2;
	 RDATA_M8  = RDATA_S2;
	 RVALID_M8 = RVALID_S2;
	 RLAST_M8  = RLAST_S2;
	 RRESP_M8  = RRESP_S2;
      end
      else if (RID_S3 == MASTER8 && RVALID_S3) begin
	 RID_M8    = RID_S3;
	 RDATA_M8  = RDATA_S3;
	 RVALID_M8 = RVALID_S3;
	 RLAST_M8  = RLAST_S3;
	 RRESP_M8  = RRESP_S3;
      end
      else if(RID_S4 == MASTER8 && RVALID_S4) begin
	 RID_M8    = RID_S4;
	 RDATA_M8  = RDATA_S4;
	 RVALID_M8 = RVALID_S4;
	 RLAST_M8  = RLAST_S4;
	 RRESP_M8  = RRESP_S4;
      end
      else begin
	 RID_M8    = 0;
	 RDATA_M8  = 0;
	 RVALID_M8 = 0;
	 RLAST_M8  = 0;
	 RRESP_M8  = 0;
      end

      // master 9
      if (RID_S1 == MASTER9 && RVALID_S1) begin
	 RID_M9    = RID_S1;
	 RDATA_M9  = RDATA_S1;
	 RVALID_M9 = RVALID_S1;
	 RLAST_M9  = RLAST_S1;
	 RRESP_M9  = RRESP_S1;
      end
      else if (RID_S2 == MASTER9 && RVALID_S2) begin
	 RID_M9    = RID_S2;
	 RDATA_M9  = RDATA_S2;
	 RVALID_M9 = RVALID_S2;
	 RLAST_M9  = RLAST_S2;
	 RRESP_M9  = RRESP_S2;
      end
      else if (RID_S3 == MASTER9 && RVALID_S3) begin
	 RID_M9    = RID_S3;
	 RDATA_M9  = RDATA_S3;
	 RVALID_M9 = RVALID_S3;
	 RLAST_M9  = RLAST_S3;
	 RRESP_M9  = RRESP_S3;
      end
      else if(RID_S4 == MASTER9 && RVALID_S4) begin
	 RID_M9    = RID_S4;
	 RDATA_M9  = RDATA_S4;
	 RVALID_M9 = RVALID_S4;
	 RLAST_M9  = RLAST_S4;
	 RRESP_M9  = RRESP_S4;
      end
      else begin
	 RID_M9    = 0;
	 RDATA_M9  = 0;
	 RVALID_M9 = 0;
	 RLAST_M9  = 0;
	 RRESP_M9  = 0;
      end

      // master 10
      if (RID_S1 == MASTER10 && RVALID_S1) begin
	 RID_M10    = RID_S1;
	 RDATA_M10  = RDATA_S1;
	 RVALID_M10 = RVALID_S1;
	 RLAST_M10  = RLAST_S1;
	 RRESP_M10  = RRESP_S1;
      end
      else if (RID_S2 == MASTER10 && RVALID_S2) begin
	 RID_M10    = RID_S2;
	 RDATA_M10  = RDATA_S2;
	 RVALID_M10 = RVALID_S2;
	 RLAST_M10  = RLAST_S2;
	 RRESP_M10  = RRESP_S2;
      end
      else if (RID_S3 == MASTER10 && RVALID_S3) begin
	 RID_M10    = RID_S3;
	 RDATA_M10  = RDATA_S3;
	 RVALID_M10 = RVALID_S3;
	 RLAST_M10  = RLAST_S3;
	 RRESP_M10  = RRESP_S3;
      end
      else if(RID_S4 == MASTER10 && RVALID_S4) begin
	 RID_M10    = RID_S4;
	 RDATA_M10  = RDATA_S4;
	 RVALID_M10 = RVALID_S4;
	 RLAST_M10  = RLAST_S4;
	 RRESP_M10  = RRESP_S4;
      end
      else begin
	 RID_M10    = 0;
	 RDATA_M10  = 0;
	 RVALID_M10 = 0;
	 RLAST_M10  = 0;
	 RRESP_M10  = 0;
      end

      // master 11
      if (RID_S1 == MASTER11 && RVALID_S1) begin
	 RID_M11    = RID_S1;
	 RDATA_M11  = RDATA_S1;
	 RVALID_M11 = RVALID_S1;
	 RLAST_M11  = RLAST_S1;
	 RRESP_M11  = RRESP_S1;
      end
      else if (RID_S2 == MASTER11 && RVALID_S2) begin
	 RID_M11    = RID_S2;
	 RDATA_M11  = RDATA_S2;
	 RVALID_M11 = RVALID_S2;
	 RLAST_M11  = RLAST_S2;
	 RRESP_M11  = RRESP_S2;
      end
      else if (RID_S3 == MASTER11 && RVALID_S3) begin
	 RID_M11    = RID_S3;
	 RDATA_M11  = RDATA_S3;
	 RVALID_M11 = RVALID_S3;
	 RLAST_M11  = RLAST_S3;
	 RRESP_M11  = RRESP_S3;
      end
      else if(RID_S4 == MASTER11 && RVALID_S4) begin
	 RID_M11    = RID_S4;
	 RDATA_M11  = RDATA_S4;
	 RVALID_M11 = RVALID_S4;
	 RLAST_M11  = RLAST_S4;
	 RRESP_M11  = RRESP_S4;
      end
      else begin
	 RID_M11    = 0;
	 RDATA_M11  = 0;
	 RVALID_M11 = 0;
	 RLAST_M11  = 0;
	 RRESP_M11  = 0;
      end

      // master 12
      if (RID_S1 == MASTER12 && RVALID_S1) begin
	 RID_M12    = RID_S1;
	 RDATA_M12  = RDATA_S1;
	 RVALID_M12 = RVALID_S1;
	 RLAST_M12  = RLAST_S1;
	 RRESP_M12  = RRESP_S1;
      end
      else if (RID_S2 == MASTER12 && RVALID_S2) begin
	 RID_M12    = RID_S2;
	 RDATA_M12  = RDATA_S2;
	 RVALID_M12 = RVALID_S2;
	 RLAST_M12  = RLAST_S2;
	 RRESP_M12  = RRESP_S2;
      end
      else if (RID_S3 == MASTER12 && RVALID_S3) begin
	 RID_M12    = RID_S3;
	 RDATA_M12  = RDATA_S3;
	 RVALID_M12 = RVALID_S3;
	 RLAST_M12  = RLAST_S3;
	 RRESP_M12  = RRESP_S3;
      end
      else if(RID_S4 == MASTER12 && RVALID_S4) begin
	 RID_M12    = RID_S4;
	 RDATA_M12  = RDATA_S4;
	 RVALID_M12 = RVALID_S4;
	 RLAST_M12  = RLAST_S4;
	 RRESP_M12  = RRESP_S4;
      end
      else begin
	 RID_M12    = 0;
	 RDATA_M12  = 0;
	 RVALID_M12 = 0;
	 RLAST_M12  = 0;
	 RRESP_M12  = 0;
      end

      // master 13
      if (RID_S1 == MASTER13 && RVALID_S1) begin
	 RID_M13    = RID_S1;
	 RDATA_M13  = RDATA_S1;
	 RVALID_M13 = RVALID_S1;
	 RLAST_M13  = RLAST_S1;
	 RRESP_M13  = RRESP_S1;
      end
      else if (RID_S2 == MASTER13 && RVALID_S2) begin
	 RID_M13    = RID_S2;
	 RDATA_M13  = RDATA_S2;
	 RVALID_M13 = RVALID_S2;
	 RLAST_M13  = RLAST_S2;
	 RRESP_M13  = RRESP_S2;
      end
      else if (RID_S3 == MASTER13 && RVALID_S3) begin
	 RID_M13    = RID_S3;
	 RDATA_M13  = RDATA_S3;
	 RVALID_M13 = RVALID_S3;
	 RLAST_M13  = RLAST_S3;
	 RRESP_M13  = RRESP_S3;
      end
      else if(RID_S4 == MASTER13 && RVALID_S4) begin
	 RID_M13    = RID_S4;
	 RDATA_M13  = RDATA_S4;
	 RVALID_M13 = RVALID_S4;
	 RLAST_M13  = RLAST_S4;
	 RRESP_M13  = RRESP_S4;
      end
      else begin
	 RID_M13    = 0;
	 RDATA_M13  = 0;
	 RVALID_M13 = 0;
	 RLAST_M13  = 0;
	 RRESP_M13  = 0;
      end

      // master 14
      if (RID_S1 == MASTER14 && RVALID_S1) begin
	 RID_M14    = RID_S1;
	 RDATA_M14  = RDATA_S1;
	 RVALID_M14 = RVALID_S1;
	 RLAST_M14  = RLAST_S1;
	 RRESP_M14  = RRESP_S1;
      end
      else if (RID_S2 == MASTER14 && RVALID_S2) begin
	 RID_M14    = RID_S2;
	 RDATA_M14  = RDATA_S2;
	 RVALID_M14 = RVALID_S2;
	 RLAST_M14  = RLAST_S2;
	 RRESP_M14  = RRESP_S2;
      end
      else if (RID_S3 == MASTER14 && RVALID_S3) begin
	 RID_M14    = RID_S3;
	 RDATA_M14  = RDATA_S3;
	 RVALID_M14 = RVALID_S3;
	 RLAST_M14  = RLAST_S3;
	 RRESP_M14  = RRESP_S3;
      end
      else if(RID_S4 == MASTER14 && RVALID_S4) begin
	 RID_M14    = RID_S4;
	 RDATA_M14  = RDATA_S4;
	 RVALID_M14 = RVALID_S4;
	 RLAST_M14  = RLAST_S4;
	 RRESP_M14  = RRESP_S4;
      end
      else begin
	 RID_M14    = 0;
	 RDATA_M14  = 0;
	 RVALID_M14 = 0;
	 RLAST_M14  = 0;
	 RRESP_M14  = 0;
      end

      // master 15
      if(RID_S4 == MASTER15 && RVALID_S4) begin
	 RID_M15    = RID_S4;
	 RDATA_M15  = RDATA_S4;
	 RVALID_M15 = RVALID_S4;
	 RLAST_M15  = RLAST_S4;
	 RRESP_M15  = RRESP_S4;
      end
      else if (RID_S1 == MASTER15 && RVALID_S1) begin
	 RID_M15    = RID_S1;
	 RDATA_M15  = RDATA_S1;
	 RVALID_M15 = RVALID_S1;
	 RLAST_M15  = RLAST_S1;
	 RRESP_M15  = RRESP_S1;
      end
      else if (RID_S2 == MASTER15 && RVALID_S2) begin
	 RID_M15    = RID_S2;
	 RDATA_M15  = RDATA_S2;
	 RVALID_M15 = RVALID_S2;
	 RLAST_M15  = RLAST_S2;
	 RRESP_M15  = RRESP_S2;
      end
      else if (RID_S3 == MASTER15 && RVALID_S3) begin
	 RID_M15    = RID_S3;
	 RDATA_M15  = RDATA_S3;
	 RVALID_M15 = RVALID_S3;
	 RLAST_M15  = RLAST_S3;
	 RRESP_M15  = RRESP_S3;
      end
      else begin
	 RID_M15    = 0;
	 RDATA_M15  = 0;
	 RVALID_M15 = 0;
	 RLAST_M15  = 0;
	 RRESP_M15  = 0;
      end

   end
   
   // slave mux
   always @ (posedge ack or negedge reset) begin
      if (!reset) begin
	 rid_lat_s4 <= 4'd0;
	 rid_lat_s1 <= 4'd0;
	 rid_lat_s2 <= 4'd0;
	 rid_lat_s3 <= 4'd0;
      end
      else begin

	 if (ARREADY_S1) begin
	    if (ARVALID_M1 && ARADDR_M1[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER1;
	    else if (ARVALID_M2 && ARADDR_M2[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER2;
	    else if (ARVALID_M3 && ARADDR_M3[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER3;
	    else if(ARVALID_M4 && ARADDR_M4[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER4;
	    else if(ARVALID_M5 && ARADDR_M5[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER5;
	    else if(ARVALID_M6 && ARADDR_M6[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER6;
	    else if(ARVALID_M7 && ARADDR_M7[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER7;
	    else if(ARVALID_M8 && ARADDR_M8[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER8;
	    else if(ARVALID_M9 && ARADDR_M9[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER9;
	    else if(ARVALID_M10 && ARADDR_M10[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER10;
	    else if(ARVALID_M11 && ARADDR_M11[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER11;
	    else if(ARVALID_M12 && ARADDR_M12[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER12;
	    else if(ARVALID_M13 && ARADDR_M13[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER13;
	    else if(ARVALID_M14 && ARADDR_M14[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER14;
	    else if(ARVALID_M15 && ARADDR_M15[31:28] == SLAVE1)
	      rid_lat_s1 <= MASTER15;
	 end

	 if (ARREADY_S2) begin
	    if (ARVALID_M1 && ARADDR_M1[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER1;
	    else if (ARVALID_M2 && ARADDR_M2[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER2;
	    else if (ARVALID_M3 && ARADDR_M3[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER3;
	    else if(ARVALID_M4 && ARADDR_M4[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER4;
	    else if(ARVALID_M5 && ARADDR_M5[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER5;
	    else if(ARVALID_M6 && ARADDR_M6[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER6;
	    else if(ARVALID_M7 && ARADDR_M7[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER7;
	    else if(ARVALID_M8 && ARADDR_M8[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER8;
	    else if(ARVALID_M9 && ARADDR_M9[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER9;
	    else if(ARVALID_M10 && ARADDR_M10[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER10;
	    else if(ARVALID_M11 && ARADDR_M11[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER11;
	    else if(ARVALID_M12 && ARADDR_M12[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER12;
	    else if(ARVALID_M13 && ARADDR_M13[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER13;
	    else if(ARVALID_M14 && ARADDR_M14[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER14;
	    else if(ARVALID_M15 && ARADDR_M15[31:28] == SLAVE2)
	      rid_lat_s2 <= MASTER15;
	 end

	 if (ARREADY_S3) begin
	    if (ARVALID_M1 && ARADDR_M1[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER1;
	    else if (ARVALID_M2 && ARADDR_M2[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER2;
	    else if (ARVALID_M3 && ARADDR_M3[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER3;
	    else if(ARVALID_M4 && ARADDR_M4[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER4;
	    else if(ARVALID_M5 && ARADDR_M5[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER5;
	    else if(ARVALID_M6 && ARADDR_M6[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER6;
	    else if(ARVALID_M7 && ARADDR_M7[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER7;
	    else if(ARVALID_M8 && ARADDR_M8[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER8;
	    else if(ARVALID_M9 && ARADDR_M9[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER9;
	    else if(ARVALID_M10 && ARADDR_M10[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER10;
	    else if(ARVALID_M11 && ARADDR_M11[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER11;
	    else if(ARVALID_M12 && ARADDR_M12[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER12;
	    else if(ARVALID_M13 && ARADDR_M13[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER13;
	    else if(ARVALID_M14 && ARADDR_M14[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER14;
	    else if(ARVALID_M15 && ARADDR_M15[31:28] == SLAVE3)
	      rid_lat_s3 <= MASTER15;
	 end

	 if (ARREADY_S4) begin
	    if(ARVALID_M1 && ARADDR_M1[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER1;
	    else if(ARVALID_M2 && ARADDR_M2[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER2;
	    else if(ARVALID_M3 && ARADDR_M3[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER3;
	    else if(ARVALID_M4 && ARADDR_M4[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER4;
	    else if(ARVALID_M5 && ARADDR_M5[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER5;
	    else if(ARVALID_M6 && ARADDR_M6[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER6;
	    else if(ARVALID_M7 && ARADDR_M7[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER7;
	    else if(ARVALID_M8 && ARADDR_M8[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER8;
	    else if(ARVALID_M9 && ARADDR_M9[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER9;
	    else if(ARVALID_M10 && ARADDR_M10[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER10;
	    else if(ARVALID_M11 && ARADDR_M11[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER11;
	    else if(ARVALID_M12 && ARADDR_M12[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER12;
	    else if(ARVALID_M13 && ARADDR_M13[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER13;
	    else if(ARVALID_M14 && ARADDR_M14[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER14;
	    else if(ARVALID_M15 && ARADDR_M15[31:28] == SLAVE4)
	      rid_lat_s4 <= MASTER15;
	 end

      end
   end

   // slave mux
   always @ (/*AS*/RREADY_M1 or RREADY_M10 or RREADY_M11 or RREADY_M12
	     or RREADY_M13 or RREADY_M14 or RREADY_M15 or RREADY_M2
	     or RREADY_M3 or RREADY_M4 or RREADY_M5 or RREADY_M6
	     or RREADY_M7 or RREADY_M8 or RREADY_M9 or rid_lat_s1
	     or rid_lat_s2 or rid_lat_s3 or rid_lat_s4) begin

      // slave 1
      if(rid_lat_s1 == MASTER1) begin
	 RREADY_S1 = RREADY_M1;
      end
      else if(rid_lat_s1 == MASTER2) begin
	 RREADY_S1 = RREADY_M2;
      end
      else if(rid_lat_s1 == MASTER3) begin
	 RREADY_S1 = RREADY_M3;
      end
      else if(rid_lat_s1 == MASTER4) begin
	 RREADY_S1 = RREADY_M4;
      end
      else if(rid_lat_s1 == MASTER5) begin
	 RREADY_S1 = RREADY_M5;
      end
      else if(rid_lat_s1 == MASTER6) begin
	 RREADY_S1 = RREADY_M6;
      end
      else if(rid_lat_s1 == MASTER7) begin
	 RREADY_S1 = RREADY_M7;
      end
      else if(rid_lat_s1 == MASTER8) begin
	 RREADY_S1 = RREADY_M8;
      end
      else if(rid_lat_s1 == MASTER9) begin
	 RREADY_S1 = RREADY_M9;
      end
      else if(rid_lat_s1 == MASTER10) begin
	 RREADY_S1 = RREADY_M10;
      end
      else if(rid_lat_s1 == MASTER11) begin
	 RREADY_S1 = RREADY_M11;
      end
      else if(rid_lat_s1 == MASTER12) begin
	 RREADY_S1 = RREADY_M12;
      end
      else if(rid_lat_s1 == MASTER13) begin
	 RREADY_S1 = RREADY_M13;
      end
      else if(rid_lat_s1 == MASTER14) begin
	 RREADY_S1 = RREADY_M14;
      end
      else if(rid_lat_s1 == MASTER15) begin
	 RREADY_S1 = RREADY_M15;
      end
      else begin
	 RREADY_S1 = 0;
      end

      // slave 2
      if(rid_lat_s2 == MASTER1) begin
	 RREADY_S2 = RREADY_M1;
      end
      else if(rid_lat_s2 == MASTER2) begin
	 RREADY_S2 = RREADY_M2;
      end
      else if(rid_lat_s2 == MASTER3) begin
	 RREADY_S2 = RREADY_M3;
      end
      else if(rid_lat_s2 == MASTER4) begin
	 RREADY_S2 = RREADY_M4;
      end
      else if(rid_lat_s2 == MASTER5) begin
	 RREADY_S2 = RREADY_M5;
      end
      else if(rid_lat_s2 == MASTER6) begin
	 RREADY_S2 = RREADY_M6;
      end
      else if(rid_lat_s2 == MASTER7) begin
	 RREADY_S2 = RREADY_M7;
      end
      else if(rid_lat_s2 == MASTER8) begin
	 RREADY_S2 = RREADY_M8;
      end
      else if(rid_lat_s2 == MASTER9) begin
	 RREADY_S2 = RREADY_M9;
      end
      else if(rid_lat_s2 == MASTER10) begin
	 RREADY_S2 = RREADY_M10;
      end
      else if(rid_lat_s2 == MASTER11) begin
	 RREADY_S2 = RREADY_M11;
      end
      else if(rid_lat_s2 == MASTER12) begin
	 RREADY_S2 = RREADY_M12;
      end
      else if(rid_lat_s2 == MASTER13) begin
	 RREADY_S2 = RREADY_M13;
      end
      else if(rid_lat_s2 == MASTER14) begin
	 RREADY_S2 = RREADY_M14;
      end
      else if(rid_lat_s2 == MASTER15) begin
	 RREADY_S2 = RREADY_M15;
      end
      else begin
	 RREADY_S2 = 0;
      end

      // slave 3
      if(rid_lat_s3 == MASTER1) begin
	 RREADY_S3 = RREADY_M1;
      end
      else if(rid_lat_s3 == MASTER2) begin
	 RREADY_S3 = RREADY_M2;
      end
      else if(rid_lat_s3 == MASTER3) begin
	 RREADY_S3 = RREADY_M3;
      end
      else if(rid_lat_s3 == MASTER4) begin
	 RREADY_S3 = RREADY_M4;
      end
      else if(rid_lat_s3 == MASTER5) begin
	 RREADY_S3 = RREADY_M5;
      end
      else if(rid_lat_s3 == MASTER6) begin
	 RREADY_S3 = RREADY_M6;
      end
      else if(rid_lat_s3 == MASTER7) begin
	 RREADY_S3 = RREADY_M7;
      end
      else if(rid_lat_s3 == MASTER8) begin
	 RREADY_S3 = RREADY_M8;
      end
      else if(rid_lat_s3 == MASTER9) begin
	 RREADY_S3 = RREADY_M9;
      end
      else if(rid_lat_s3 == MASTER10) begin
	 RREADY_S3 = RREADY_M10;
      end
      else if(rid_lat_s3 == MASTER11) begin
	 RREADY_S3 = RREADY_M11;
      end
      else if(rid_lat_s3 == MASTER12) begin
	 RREADY_S3 = RREADY_M12;
      end
      else if(rid_lat_s3 == MASTER13) begin
	 RREADY_S3 = RREADY_M13;
      end
      else if(rid_lat_s3 == MASTER14) begin
	 RREADY_S3 = RREADY_M14;
      end
      else if(rid_lat_s3 == MASTER15) begin
	 RREADY_S3 = RREADY_M15;
      end
      else begin
	 RREADY_S3 = 0;
      end

      // slave 4
      if(rid_lat_s4 == MASTER1) begin
	 RREADY_S4 = RREADY_M1;
      end
      else if(rid_lat_s4 == MASTER2) begin
	 RREADY_S4 = RREADY_M2;
      end
      else if(rid_lat_s4 == MASTER3) begin
	 RREADY_S4 = RREADY_M3;
      end
      else if(rid_lat_s4 == MASTER4) begin
	 RREADY_S4 = RREADY_M4;
      end
      else if(rid_lat_s4 == MASTER5) begin
	 RREADY_S4 = RREADY_M5;
      end
      else if(rid_lat_s4 == MASTER6) begin
	 RREADY_S4 = RREADY_M6;
      end
      else if(rid_lat_s4 == MASTER7) begin
	 RREADY_S4 = RREADY_M7;
      end
      else if(rid_lat_s4 == MASTER8) begin
	 RREADY_S4 = RREADY_M8;
      end
      else if(rid_lat_s4 == MASTER9) begin
	 RREADY_S4 = RREADY_M9;
      end
      else if(rid_lat_s4 == MASTER10) begin
	 RREADY_S4 = RREADY_M10;
      end
      else if(rid_lat_s4 == MASTER11) begin
	 RREADY_S4 = RREADY_M11;
      end
      else if(rid_lat_s4 == MASTER12) begin
	 RREADY_S4 = RREADY_M12;
      end
      else if(rid_lat_s4 == MASTER13) begin
	 RREADY_S4 = RREADY_M13;
      end
      else if(rid_lat_s4 == MASTER14) begin
	 RREADY_S4 = RREADY_M14;
      end
      else if(rid_lat_s4 == MASTER15) begin
	 RREADY_S4 = RREADY_M15;
      end
      else begin
	 RREADY_S4 = 0;
      end
      
   end    

endmodule


