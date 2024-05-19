// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ps / 1ps
module tb_NandFlashController_Top_AXI;

`define rCommand 32'd0
`define rAddress 32'd4
`define rLength  32'd8
`define rDMARAddress 32'd12
`define rDMAWAddress 32'd16
`define rFeature 32'd20

`define rCommandFail 32'd24
`define rNFCStatus 32'd28
`define rNandRBStatus 32'd32
    /*
    * AXI-lite slave interface
    */
	parameter AXIL_ADDR_WIDTH           = 32              ;
	parameter AXIL_DATA_WIDTH           = 32              ;
	parameter AXIL_STRB_WIDTH           = AXIL_DATA_WIDTH/8    ;
	/*
	* AXI master interface
	*/
	parameter AXI_ID_WIDTH         = 2               ;
	parameter AXI_ADDR_WIDTH       = 32              ;
	parameter AXI_DATA_WIDTH       = 64              ;
	parameter AXI_MAX_BURST_LEN    = 256             ;
	parameter AXI_STRB_WIDTH       = AXI_DATA_WIDTH/8;
	
	parameter IDelayValue          = 15              ;
	parameter InputClockBufferType = 0               ;
	parameter NumberOfWays         = 2               ;
    parameter PageSize             = 8640            ; 

	reg                           s_axil_clk              ;
	reg                           s_axil_rst              ;

	wire                          m_axi_clk               ;
	wire                          m_axi_rst               ;

    reg                           iSystemClock            ; // SDR 100MHz
    reg                           iDelayRefClock          ; // SDR 200Mhz
    reg                           iOutputDrivingClock     ; // SDR 200Mhz
    reg                           iSystemClock_120         ;
    reg                           iReset                  ;
    // glbl glbl();
    // 100 MHz
    initial                 
    begin
        iSystemClock     <= 1'b0;
        iSystemClock_120  <= 1'b0;
        #10000;
        forever
        begin    
            iSystemClock <= 1'b1;
            iSystemClock_120 <= 1'b0;
            #3000;
            iSystemClock <= 1'b1;
            iSystemClock_120 <= 1'b1;
            #2000;
            iSystemClock <= 1'b0;
            iSystemClock_120 <= 1'b1;
            #3000;
            iSystemClock <= 1'b0;
            iSystemClock_120 <= 1'b0;
            #2000;
        end
    end

    // 200 MHz
    initial                 
    begin
        iDelayRefClock          <= 1'b0;
        #10000;
        forever
        begin    
            iDelayRefClock      <= 1'b1;
            #2500;
            iDelayRefClock      <= 1'b0;
            #2500;
        end
    end

    // 200 MHz
    initial                 
    begin
        iOutputDrivingClock     <= 1'b0;
        #10000;
        forever
        begin    
            iOutputDrivingClock <= 1'b1;
            #3000;
            iOutputDrivingClock <= 1'b0;
            #3000;
        end
    end

    // 200 MHz
    initial                 
    begin
        s_axil_clk          <= 1'b0;
        #10000;
        forever
        begin    
            s_axil_clk      <= 1'b1;
            #5000;
            s_axil_clk      <= 1'b0;
            #5000;
        end
    end

    reg  [AXIL_ADDR_WIDTH-1:0]      s_axil_awaddr                             ;
    reg  [2:0]                 s_axil_awprot                             ;
    reg                        s_axil_awvalid                            ;
    reg  [AXIL_DATA_WIDTH-1:0]      s_axil_wdata                              ;
    reg  [AXIL_STRB_WIDTH-1:0]      s_axil_wstrb                              ;
    reg                        s_axil_wvalid                             ;
    reg                        s_axil_bready                             ;
    reg  [AXIL_ADDR_WIDTH-1:0]      s_axil_araddr                             ;
    reg  [2:0]                 s_axil_arprot                             ;
    reg                        s_axil_arvalid                            ;
    reg                        s_axil_rready                             ;

    wire                       s_axil_awready                            ;
    wire                       s_axil_wready                             ;
    wire [1:0]                 s_axil_bresp                              ;
    wire                       s_axil_bvalid                             ;
    wire                       s_axil_arready                            ;
    wire [AXIL_DATA_WIDTH-1:0]      s_axil_rdata                              ;
    wire [1:0]                 s_axil_rresp                              ;
    wire                       s_axil_rvalid                             ;

    wire                       m_axi_awready                             ;
    wire                       m_axi_wready                              ;
    wire [AXI_ID_WIDTH-1:0]    m_axi_bid                                 ;
    wire [1:0]                 m_axi_bresp                               ;
    wire                       m_axi_bvalid                              ;
    wire                       m_axi_arready                             ;
    wire [AXI_ID_WIDTH-1:0]    m_axi_rid                                 ;
    wire [AXI_DATA_WIDTH-1:0]  m_axi_rdata                               ;
    wire [1:0]                 m_axi_rresp                               ;
    wire                       m_axi_rlast                               ;
    wire                       m_axi_rvalid                              ;

    wire [AXI_ID_WIDTH-1:0]    m_axi_awid                                ;
    wire [AXI_ADDR_WIDTH-1:0]  m_axi_awaddr                              ;
    wire [7:0]                 m_axi_awlen                               ;
    wire [2:0]                 m_axi_awsize                              ;
    wire [1:0]                 m_axi_awburst                             ;
    wire                       m_axi_awlock                              ;
    wire [3:0]                 m_axi_awcache                             ;
    wire [2:0]                 m_axi_awprot                              ;
    wire                       m_axi_awvalid                             ;
    wire [AXI_DATA_WIDTH-1:0]  m_axi_wdata                               ;
    wire [AXI_STRB_WIDTH-1:0]  m_axi_wstrb                               ;
    wire                       m_axi_wlast                               ;
    wire                       m_axi_wvalid                              ;
    wire                       m_axi_bready                              ;
    wire [AXI_ID_WIDTH-1:0]    m_axi_arid                                ;
    wire [AXI_ADDR_WIDTH-1:0]  m_axi_araddr                              ;
    wire [7:0]                 m_axi_arlen                               ;
    wire [2:0]                 m_axi_arsize                              ;
    wire [1:0]                 m_axi_arburst                             ;
    wire                       m_axi_arlock                              ;
    wire [3:0]                 m_axi_arcache                             ;
    wire [2:0]                 m_axi_arprot                              ;
    wire                       m_axi_arvalid                             ;
    wire                       m_axi_rready                              ;

    wire                          IO_NAND_DQS                 ;
    wire                  [7:0]   IO_NAND_DQ                  ;
    wire   [NumberOfWays - 1:0]   O_NAND_CE                   ;
    wire                          O_NAND_WE                   ;
    wire                          O_NAND_RE                   ;
    wire                          O_NAND_ALE                  ;
    wire                          O_NAND_CLE                  ;
    wire   [NumberOfWays - 1:0]   I_NAND_RB                   ;
    wire                          O_NAND_WP                   ;
	NandFlashController_Top_AXI #(
			.AXIL_ADDR_WIDTH           (AXIL_ADDR_WIDTH           ),
			.AXIL_DATA_WIDTH           (AXIL_DATA_WIDTH           ),
			.AXIL_STRB_WIDTH           (AXIL_STRB_WIDTH           ),
			.AXI_ID_WIDTH         (AXI_ID_WIDTH         ),
			.AXI_ADDR_WIDTH       (AXI_ADDR_WIDTH       ),
			.AXI_DATA_WIDTH       (AXI_DATA_WIDTH       ),
			.AXI_MAX_BURST_LEN    (AXI_MAX_BURST_LEN    ),
			.AXI_STRB_WIDTH       (AXI_STRB_WIDTH       ),
			.IDelayValue          (IDelayValue          ),
			.InputClockBufferType (InputClockBufferType ),
			.NumberOfWays         (NumberOfWays         ),
            .PageSize             (PageSize)
		) inst_NandFlashController_Top_AXI (
			.s_axil_clk          (s_axil_clk          ),
			.s_axil_rst          (s_axil_rst          ),
			
			.s_axil_awaddr       (s_axil_awaddr       ),
			.s_axil_awprot       (s_axil_awprot       ),
			.s_axil_awvalid      (s_axil_awvalid      ),
			.s_axil_awready      (s_axil_awready      ),
			.s_axil_wdata        (s_axil_wdata        ),
			.s_axil_wstrb        (s_axil_wstrb        ),
			.s_axil_wvalid       (s_axil_wvalid       ),
			.s_axil_wready       (s_axil_wready       ),
			.s_axil_bresp        (s_axil_bresp        ),
			.s_axil_bvalid       (s_axil_bvalid       ),
			.s_axil_bready       (s_axil_bready       ),
			.s_axil_araddr       (s_axil_araddr       ),
			.s_axil_arprot       (s_axil_arprot       ),
			.s_axil_arvalid      (s_axil_arvalid      ),
			.s_axil_arready      (s_axil_arready      ),
			.s_axil_rdata        (s_axil_rdata        ),
			.s_axil_rresp        (s_axil_rresp        ),
			.s_axil_rvalid       (s_axil_rvalid       ),
			.s_axil_rready       (s_axil_rready       ),
			
			.m_axi_clk           (m_axi_clk           ),
			.m_axi_rst           (m_axi_rst           ),
			
			.m_axi_awid          (m_axi_awid          ),
			.m_axi_awaddr        (m_axi_awaddr        ),
			.m_axi_awlen         (m_axi_awlen         ),
			.m_axi_awsize        (m_axi_awsize        ),
			.m_axi_awburst       (m_axi_awburst       ),
			.m_axi_awlock        (m_axi_awlock        ),
			.m_axi_awcache       (m_axi_awcache       ),
			.m_axi_awprot        (m_axi_awprot        ),
			.m_axi_awvalid       (m_axi_awvalid       ),
			.m_axi_awready       (m_axi_awready       ),
			.m_axi_wdata         (m_axi_wdata         ),
			.m_axi_wstrb         (m_axi_wstrb         ),
			.m_axi_wlast         (m_axi_wlast         ),
			.m_axi_wvalid        (m_axi_wvalid        ),
			.m_axi_wready        (m_axi_wready        ),
			.m_axi_bid           (m_axi_bid           ),
			.m_axi_bresp         (m_axi_bresp         ),
			.m_axi_bvalid        (m_axi_bvalid        ),
			.m_axi_bready        (m_axi_bready        ),
			.m_axi_arid          (m_axi_arid          ),
			.m_axi_araddr        (m_axi_araddr        ),
			.m_axi_arlen         (m_axi_arlen         ),
			.m_axi_arsize        (m_axi_arsize        ),
			.m_axi_arburst       (m_axi_arburst       ),
			.m_axi_arlock        (m_axi_arlock        ),
			.m_axi_arcache       (m_axi_arcache       ),
			.m_axi_arprot        (m_axi_arprot        ),
			.m_axi_arvalid       (m_axi_arvalid       ),
			.m_axi_arready       (m_axi_arready       ),
			.m_axi_rid           (m_axi_rid           ),
			.m_axi_rdata         (m_axi_rdata         ),
			.m_axi_rresp         (m_axi_rresp         ),
			.m_axi_rlast         (m_axi_rlast         ),
			.m_axi_rvalid        (m_axi_rvalid        ),
			.m_axi_rready        (m_axi_rready        ),
			
			.iSystemClock        (iSystemClock        ),
			.iDelayRefClock      (iDelayRefClock      ),
			// .iOutputDrivingClock (iOutputDrivingClock ),
            .iSystemClock_120     (iSystemClock_120),
			.iReset              (iReset              ),

			.IO_NAND_DQS         (IO_NAND_DQS         ),
			.IO_NAND_DQ          (IO_NAND_DQ          ),
			.O_NAND_CE           (O_NAND_CE           ),
			.O_NAND_WE           (O_NAND_WE           ),
			.O_NAND_RE           (O_NAND_RE           ),
			.O_NAND_ALE          (O_NAND_ALE          ),
			.O_NAND_CLE          (O_NAND_CLE          ),
			.I_NAND_RB           (I_NAND_RB           ),
			.O_NAND_WP           (O_NAND_WP           )
		);


    nand_model nand_b0_1 (
	        //clocks
	        .Clk_We_n(O_NAND_WE), //same connection to both wen/nclk
	        
	        //CE
	        .Ce_n(O_NAND_CE[0]),
	        .Ce2_n(O_NAND_CE[1]),
	        
	        //Ready/busy
	        .Rb_n(I_NAND_RB[0]),
	        .Rb2_n(I_NAND_RB[1]),
	         
	        //DQ DQS
	        .Dqs(IO_NAND_DQS), 
	        //Reversed DQ
	        .Dq_Io(IO_NAND_DQ),
	         
	        //ALE CLE WR WP
	        .Cle(O_NAND_CLE), 
	        //.Cle2(),
	        .Ale(O_NAND_ALE), 
	        //.Ale2(),
	        .Wr_Re_n(O_NAND_RE), 
	        //.Wr_Re2_n(),
	        .Wp_n(O_NAND_WP) 
	        //.Wp2_n()
        );  

    axi_ram #(
        .DATA_WIDTH      (64      ),
        .ADDR_WIDTH      (20      ),
        .ID_WIDTH        ( 8      ),
        .PIPELINE_OUTPUT ( 0      )
    )
    axi_ram (
        .clk           (m_axi_clk     ),
        .rst           (~m_axi_rst     ),
        .s_axi_awid    (m_axi_awid    ),
        .s_axi_awaddr  (m_axi_awaddr  ),
        .s_axi_awlen   (m_axi_awlen   ),
        .s_axi_awsize  (m_axi_awsize  ),
        .s_axi_awburst (m_axi_awburst ),
        .s_axi_awlock  (m_axi_awlock  ),
        .s_axi_awcache (m_axi_awcache ),
        .s_axi_awprot  (m_axi_awprot  ),
        .s_axi_awvalid (m_axi_awvalid ),
        .s_axi_awready (m_axi_awready ),
        .s_axi_wdata   (m_axi_wdata   ),
        .s_axi_wstrb   (m_axi_wstrb   ),
        .s_axi_wlast   (m_axi_wlast   ),
        .s_axi_wvalid  (m_axi_wvalid  ),
        .s_axi_wready  (m_axi_wready  ),
        .s_axi_bid     (m_axi_bid     ),
        .s_axi_bresp   (m_axi_bresp   ),
        .s_axi_bvalid  (m_axi_bvalid  ),
        .s_axi_bready  (m_axi_bready  ),
        .s_axi_arid    (m_axi_arid    ),
        .s_axi_araddr  (m_axi_araddr  ),
        .s_axi_arlen   (m_axi_arlen   ),
        .s_axi_arsize  (m_axi_arsize  ),
        .s_axi_arburst (m_axi_arburst ),
        .s_axi_arlock  (m_axi_arlock  ),
        .s_axi_arcache (m_axi_arcache ),
        .s_axi_arprot  (m_axi_arprot  ),
        .s_axi_arvalid (m_axi_arvalid ),
        .s_axi_arready (m_axi_arready ),
        .s_axi_rid     (m_axi_rid     ),
        .s_axi_rdata   (m_axi_rdata   ),
        .s_axi_rresp   (m_axi_rresp   ),
        .s_axi_rlast   (m_axi_rlast   ),
        .s_axi_rvalid  (m_axi_rvalid  ),
        .s_axi_rready  (m_axi_rready  )
    );

    task AXIL32_WriteChannel;
		input  [AXIL_ADDR_WIDTH-1:0]      r_axil_awaddr ;
		input  [2:0]                 r_axil_awprot ;
		input                        r_axil_awvalid;
		input  [AXIL_DATA_WIDTH-1:0]      r_axil_wdata  ;
		input  [AXIL_STRB_WIDTH-1:0]      r_axil_wstrb  ;
		input                        r_axil_wvalid ;
		input                        r_axil_bready ;
    	begin
    		@(posedge s_axil_clk);   
			s_axil_awaddr  <= r_axil_awaddr ;
			s_axil_awprot  <= r_axil_awprot ;
			s_axil_awvalid <= r_axil_awvalid;
			s_axil_wdata   <= r_axil_wdata  ;
			s_axil_wstrb   <= r_axil_wstrb  ;
			s_axil_wvalid  <= r_axil_wvalid ;
			s_axil_bready  <= r_axil_bready ;
    	end                     
    endtask

    task AXIL32_ReadChannel;
	    input  [AXIL_ADDR_WIDTH-1:0]      r_axil_araddr ;
	    input  [2:0]                 r_axil_arprot ;
	    input                        r_axil_arvalid;
	    input                        r_axil_rready ;
    	begin
    		@(posedge s_axil_clk);   
			s_axil_araddr <= r_axil_araddr ;
			s_axil_arprot <= r_axil_arprot ;
			s_axil_arvalid<= r_axil_arvalid;
			s_axil_rready <= r_axil_rready ;
    	end                     
    endtask

    task AXIL32_IN;
    	input [31:0] addr;
    	output reg [31:0] odata;
    	begin
    		AXIL32_ReadChannel(addr, 0, 1, 1);
    		wait(s_axil_rvalid == 1);
    		AXIL32_ReadChannel(addr, 0, 0, 0);  
    		odata <= s_axil_rdata;
    		@(posedge s_axil_clk);  
    	end                  
    endtask

    task AXIL32_OUT;
    	input [31:0] addr;
    	input [31:0] data;
    	begin
    		AXIL32_WriteChannel(addr, 3'd0, 1, data, 4'hf, 1, 1);
    		wait(s_axil_awready == 1);
    		@(posedge s_axil_clk);   
    		AXIL32_WriteChannel(   0, 3'd0, 0, data, 4'hf, 0, 0);
    	end                          
                      
    endtask

    reg [7:0]  global_way;
    reg [15:0] global_col;
    reg [23:0] global_row;

    task select_way;
        input [7:0] way;
        begin
        global_way = way;
		AXIL32_OUT(`rAddress, way);
		AXIL32_OUT(`rCommand, {11'd0, 5'b00000, 10'd0, 6'b100000});
        end
    endtask

    task set_coladdr;
        input [15:0] col;
        begin
        global_col = col;
		AXIL32_OUT(`rAddress, {16'd0,col});
		AXIL32_OUT(`rCommand, {11'd0, 5'b00000, 10'd0, 6'b100010});
        end
    endtask

    task set_rowaddr;
        input [23:0] row;
        begin
        global_row = row;
		AXIL32_OUT(`rAddress, {8'd0,row});
		AXIL32_OUT(`rCommand, {11'd0, 5'b00000, 10'd0, 6'b100100});
        end
    endtask

    task set_feature;
        input [31:0] feature;
        begin
		AXIL32_OUT(`rAddress, feature);
		AXIL32_OUT(`rCommand, {11'd0, 5'b00000, 10'd0, 6'b101000});
        end
    endtask

	reg [31:0] status;

    task reset_ffh;
        begin
        AXIL32_OUT(`rCommand, {11'd0, 5'b00101, 10'd0, 6'b000001});
        AXIL32_IN(`rNFCStatus, status);
        @(posedge s_axil_clk);
        while(status[0] == 0) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        while(status[0] == 1) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        end
    endtask

    task setfeature_efh;
        begin
        AXIL32_OUT(`rCommand, {11'd0, 5'b00101, 10'd0, 6'b000010});
        AXIL32_IN(`rNFCStatus, status);
        @(posedge s_axil_clk);
        while(status[0] == 0) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        while(status[0] == 1) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        end
    endtask

    task getfeature_eeh;
        begin
        AXIL32_OUT(`rCommand, {11'd0, 5'b00101, 10'd0, 6'b000101});
        AXIL32_IN(`rNFCStatus, status);
        @(posedge s_axil_clk);
        while(status[0] == 0) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        while(status[0] == 1) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        end
    endtask

    task progpage_80h_10h;
    	input [15:0] number;
        begin
        AXIL32_OUT(`rLength, {16'd0, number});
        // AXIL32_OUT(`rDMARAddress, 0); //DMA addr
        AXIL32_OUT(`rCommand, {11'd0, 5'b00000, 10'd0, 6'b000011});
            AXIL32_IN(`rNFCStatus, status);
            @(posedge s_axil_clk);
            while(status[0] == 0) begin
                AXIL32_IN(`rNFCStatus, status);
                @(posedge s_axil_clk);
                end
            while(status[0] == 1) begin
                AXIL32_IN(`rNFCStatus, status);
                @(posedge s_axil_clk);
                end
        end
    endtask

    task progpage_80h_15h_cache;
    	input [15:0] number;
        begin
        AXIL32_OUT(`rLength, {16'd0, number});
        // AXIL32_OUT(`rDMARAddress, 0); //DMA addr
        AXIL32_OUT(`rCommand, {11'd0, 5'b00001, 10'd0, 6'b000011});
            AXIL32_IN(`rNFCStatus, status);
            @(posedge s_axil_clk);
            while(status[0] == 0) begin
                AXIL32_IN(`rNFCStatus, status);
                @(posedge s_axil_clk);
                end
            while(status[0] == 1) begin
                AXIL32_IN(`rNFCStatus, status);
                @(posedge s_axil_clk);
                end
        end
    endtask

    task progpage_80h_10h_multplane;
    	input [15:0] number;
        begin
        AXIL32_OUT(`rLength, {16'd0, number});
        // AXIL32_OUT(`rDMARAddress, 0); //DMA addr
        AXIL32_OUT(`rCommand, {11'd0, 5'b00010, 10'd0, 6'b000011});
            AXIL32_IN(`rNFCStatus, status);
            @(posedge s_axil_clk);
            while(status[0] == 0) begin
                AXIL32_IN(`rNFCStatus, status);
                @(posedge s_axil_clk);
                end
            while(status[0] == 1) begin
                AXIL32_IN(`rNFCStatus, status);
                @(posedge s_axil_clk);
                end
        end
    endtask

    task readpage_00h_30h;
    	input [15:0] number;
    	input check;
    	integer base_adr;
        begin
        base_adr = global_row[7]*6 + global_row[2:0];
        AXIL32_OUT(`rLength, {16'd0, number});
        AXIL32_OUT(`rDMAWAddress, base_adr*PageSize+12*PageSize); //DMA addr
        AXIL32_OUT(`rCommand, {11'd0, 5'b00000, 10'd0, 6'b000100});
        AXIL32_IN(`rNFCStatus, status);
        @(posedge s_axil_clk);

        while(status[0] == 0) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        while(status[0] == 1) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        end
    endtask

    task eraseblock_60h_d0h;
        begin
        AXIL32_OUT(`rCommand, {11'd0, 5'b00000, 10'd0, 6'b000110});
        AXIL32_IN(`rNFCStatus, status);
        @(posedge s_axil_clk);
        while(status[0] == 0) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        while(status[0] == 1) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        end
    endtask

    task eraseblock_60h_d1h_multiplane;
        begin
        AXIL32_OUT(`rCommand, {11'd0, 5'b00010, 10'd0, 6'b000110});
        AXIL32_IN(`rNFCStatus, status);
        @(posedge s_axil_clk);
        while(status[0] == 0) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        while(status[0] == 1) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        end
    endtask

    task readstatus_70h;
        begin
        AXIL32_OUT(`rCommand, {11'd0, 5'b00100, 10'd0, 6'b000111});
        
        @(posedge s_axil_clk);
        while(status[0] == 0) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        while(status[0] == 1) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        AXIL32_IN(`rNFCStatus, status);
        end
    endtask

    task readstatus_78h;
        begin
        AXIL32_OUT(`rCommand, {11'd0, 5'b00101, 10'd0, 6'b000111});
        AXIL32_IN(`rNFCStatus, status);
        @(posedge s_axil_clk);
        while(status[0] == 0) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        while(status[0] == 1) begin
	        AXIL32_IN(`rNFCStatus, status);
	        @(posedge s_axil_clk);
	        end
        AXIL32_IN(`rNFCStatus, status);
        end
    endtask

    wire RDY  = status[8+6];
    wire ARDY = status[8+5];

    integer I;
    task program_multiplane_cache;
        input [11:0] block;
        input [6:0] page;
        input finished;

        reg [11:0] rblock;
        reg [6:0] rpage;

        integer base_adr;
        begin
            rblock <= block + 1'b1;
            rpage <= page + 1'b1;

            
            // plane0 page0
            set_rowaddr({{5'd0},{block},page});
            readstatus_70h;
            while (RDY == 0) begin
                readstatus_70h;
            end
            base_adr = global_row[7]*6 + global_row[2:0];
            AXIL32_OUT(`rDMARAddress, base_adr*PageSize);
            progpage_80h_10h_multplane(PageSize);


            // plane1 page0
            set_rowaddr({{5'd0},{rblock},page});
            readstatus_70h;
            while (RDY == 0) begin
                readstatus_70h;
            end
            base_adr = global_row[7]*6 + global_row[2:0];
            AXIL32_OUT(`rDMARAddress, base_adr*PageSize);
            progpage_80h_15h_cache(PageSize);


            // plane0 page1 cache
            
            set_rowaddr({{5'd0},{block},{rpage}});
            readstatus_70h;
            while (RDY == 0) begin
                readstatus_70h;
            end
            base_adr = global_row[7]*6 + global_row[2:0];
            AXIL32_OUT(`rDMARAddress, base_adr*PageSize);
            progpage_80h_10h_multplane(PageSize);


            // plane1 page1 cache
            set_rowaddr({{5'd0},{rblock},{rpage}});
            readstatus_70h;
            while (RDY == 0) begin
                readstatus_70h;
            end
            base_adr = global_row[7]*6 + global_row[2:0];
            AXIL32_OUT(`rDMARAddress, base_adr*PageSize);
            if (finished)
                progpage_80h_10h(PageSize);
            else
                progpage_80h_15h_cache(PageSize);

        end
    endtask

    integer seed;

    initial  begin seed =  0; end

	integer i, j;

    initial
        begin
        // $dumpfile("./tb_NFC_Physical_Top.vcd");
        // $dumpvars(0, tb_NFC_Physical_Top);
		iReset     <= 1;
		s_axil_rst <= 0;
		AXIL32_ReadChannel(0,0,0,0);
		AXIL32_WriteChannel(   0, 3'd0, 0, 0, 4'hf, 0, 0);

	    for (i = 0; i < 2**14; i = i + 1) begin
	    	if (i < (PageSize/8*12)) begin
	    		axi_ram.mem[i] =  {$random(seed),$random(seed)};
	    	end else begin
	    		axi_ram.mem[i] =  0;
	    	end
	    end

		# 1000000
		iReset     <= 0;
		s_axil_rst <= 1;

        select_way(8'd1);
        reset_ffh;
        set_feature(32'h15000000);
        setfeature_efh;
        program_multiplane_cache(11'd0, 7'd0, 0);
        program_multiplane_cache(11'd0, 7'd2, 0);
        program_multiplane_cache(11'd0, 7'd4, 1);

        readstatus_70h;
        while (ARDY == 0) begin
            readstatus_70h;
        end

        set_rowaddr({{5'd0},{11'd0},{7'd0}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd0},{7'd1}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd0},{7'd2}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd0},{7'd3}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd0},{7'd4}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd0},{7'd5}});
        readpage_00h_30h(PageSize,1);


        set_rowaddr({{5'd0},{11'd1},{7'd0}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd1},{7'd1}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd1},{7'd2}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd1},{7'd3}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd1},{7'd4}});
        readpage_00h_30h(PageSize,1);
        set_rowaddr({{5'd0},{11'd1},{7'd5}});
        readpage_00h_30h(PageSize,1);

        repeat (100) @(posedge s_axil_clk);

        for (i = 0; i < (PageSize/8*12); i=i+1) begin
        	
        	if (axi_ram.mem[i] != axi_ram.mem[i+(PageSize/8*12)]) begin
        		$display("test wrong!");
        		$display("data %d %016x %016x",i, axi_ram.mem[i],axi_ram.mem[i+(PageSize/8*12)]);
        		$stop;
        	end else if (i<10) begin
        		$display("data %d %016x %016x",i, axi_ram.mem[i],axi_ram.mem[i+(PageSize/8*12)]);
        	end
        end

        $display("data chack finished!");

        set_rowaddr({{5'd0},{11'd0},{7'd0}});
        eraseblock_60h_d1h_multiplane;
        set_rowaddr({{5'd0},{11'd1},{7'd0}});
        readstatus_78h;
        AXIL32_IN(`rNFCStatus, status);
        while (ARDY == 0) begin
            readstatus_78h;
            AXIL32_IN(`rNFCStatus, status);
        end

        eraseblock_60h_d0h;
        readstatus_78h;
        AXIL32_IN(`rNFCStatus, status);
        while (ARDY == 0) begin
            readstatus_78h;
            AXIL32_IN(`rNFCStatus, status);
        end

        set_rowaddr({{5'd0},{11'd0},{7'd0}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd0},{7'd1}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd0},{7'd2}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd0},{7'd3}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd0},{7'd4}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd0},{7'd5}});
        readpage_00h_30h(PageSize,0);


        set_rowaddr({{5'd0},{11'd1},{7'd0}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd1},{7'd1}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd1},{7'd2}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd1},{7'd3}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd1},{7'd4}});
        readpage_00h_30h(PageSize,0);
        set_rowaddr({{5'd0},{11'd1},{7'd5}});
        readpage_00h_30h(PageSize,0);


        $display("test finished!");
        repeat (50) @(posedge s_axil_clk);
        end

endmodule