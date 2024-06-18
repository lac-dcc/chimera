// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module vga_sync(
    input               clk,
    output              hsync,
    output              vsync,
    output              active,
    output wire [12:0]  h,
    output wire [12:0]  v
);

    // VGA Timing Parameters
    //
    // Resolution:      1024 x 768  (XGA)
    // Frame Rate:      60 Hz
    // Vertical Rate:   48.36 kHz
    // Pixel Clock:     65 MHz
    //
    // Horizontal (px):
    //   Active Area:  1024
    //   Front Porch:  24
    //   Sync Pulse:   136
    //   Back Porch:   160
    //
    // Vertical (px):
    //   Active Area:  768
    //   Front Porch:  3
    //   Sync Pulse:   6
    //   Back Porch:   29

    
	localparam H_ACTIVE = 1024;     // Horizontal active pixels
	localparam H_FPORCH = 24;       // Horizontal front porch
	localparam H_PULSE  = 136;      // Horizontal sync pulse
	localparam H_BPORCH = 160;      // Horizontal back porch
	localparam V_ACTIVE = 768;      // Vertical active pixels
	localparam V_FPORCH = 3;        // Vertical front porch
	localparam V_PULSE  = 6;        // Vertical sync pulse
	localparam V_BPORCH = 29;       // Vertical back porch

	// Calculated timing parameters
	localparam H_SYNC_S = H_ACTIVE + H_FPORCH;     							// Horizontal sync start
	localparam H_SYNC_E = H_SYNC_S + H_PULSE;      							// Horizontal sync end
	localparam H_TOTAL  = H_ACTIVE + H_FPORCH + H_PULSE + H_BPORCH - 1;     // Horizontal total pixels
	localparam V_SYNC_S = V_ACTIVE + V_FPORCH;     							// Horizontal sync start
	localparam V_SYNC_E = V_SYNC_S + V_PULSE;      							// Horizontal sync end
	localparam V_TOTAL  = V_ACTIVE + V_FPORCH + V_PULSE + V_BPORCH - 1;     // Horizontal total pixels

    // Position registers
	reg [12:0] h_out, v_out;
	
	// Generate horizontal and vertical sync signals
	always @(posedge clk) begin
		// Reset horizontal position if at last pixel
		// else increment to next pixel
		h_out <= h_out == H_TOTAL ? 0 : h_out + 1;
		
		// Increment vertical position after horizontal reset
		// and reset vertical position if at last row
		// else do nothing
		v_out <= h_out == 0 ? (
			v_out == V_TOTAL ? 0 : v_out + 1
		) : v_out;
	end
	
	// Assign outputs
    assign hsync  = ~( h_out >= H_SYNC_S && h_out <= H_SYNC_E );
    assign vsync  = ~( v_out >= V_SYNC_S && v_out <= V_SYNC_E );
    assign active =    h_out <  H_ACTIVE && v_out <  V_ACTIVE  ;
    assign h = h_out;
    assign v = v_out;
endmodule


module vga_bram(
    clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb
);

    input clka;
    input ena;
    input [0 : 0] wea;
    input [15 : 0] addra;
    input [7 : 0] dina;
    input clkb;
    input [15 : 0] addrb;
    output [7 : 0] doutb;

    // synthesis translate_off

    BLK_MEM_GEN_V7_3 #(
        .C_ADDRA_WIDTH(16),
        .C_ADDRB_WIDTH(16),
        .C_ALGORITHM(1),
        .C_AXI_ID_WIDTH(4),
        .C_AXI_SLAVE_TYPE(0),
        .C_AXI_TYPE(1),
        .C_BYTE_SIZE(9),
        .C_COMMON_CLK(0),
        .C_DEFAULT_DATA("1C"),
        .C_DISABLE_WARN_BHV_COLL(0),
        .C_DISABLE_WARN_BHV_RANGE(0),
        .C_ENABLE_32BIT_ADDRESS(0),
        .C_FAMILY("spartan6"),
        .C_HAS_AXI_ID(0),
        .C_HAS_ENA(1),
        .C_HAS_ENB(0),
        .C_HAS_INJECTERR(0),
        .C_HAS_MEM_OUTPUT_REGS_A(0),
        .C_HAS_MEM_OUTPUT_REGS_B(0),
        .C_HAS_MUX_OUTPUT_REGS_A(0),
        .C_HAS_MUX_OUTPUT_REGS_B(0),
        .C_HAS_REGCEA(0),
        .C_HAS_REGCEB(0),
        .C_HAS_RSTA(0),
        .C_HAS_RSTB(0),
        .C_HAS_SOFTECC_INPUT_REGS_A(0),
        .C_HAS_SOFTECC_OUTPUT_REGS_B(0),
        .C_INIT_FILE("BlankString"),
        .C_INIT_FILE_NAME("vga_bram.mif"),
        .C_INITA_VAL("0"),
        .C_INITB_VAL("0"),
        .C_INTERFACE_TYPE(0),
        .C_LOAD_INIT_FILE(1),
        .C_MEM_TYPE(1),
        .C_MUX_PIPELINE_STAGES(0),
        .C_PRIM_TYPE(1),
        .C_READ_DEPTH_A(49152),
        .C_READ_DEPTH_B(49152),
        .C_READ_WIDTH_A(8),
        .C_READ_WIDTH_B(8),
        .C_RST_PRIORITY_A("CE"),
        .C_RST_PRIORITY_B("CE"),
        .C_RST_TYPE("SYNC"),
        .C_RSTRAM_A(0),
        .C_RSTRAM_B(0),
        .C_SIM_COLLISION_CHECK("ALL"),
        .C_USE_BRAM_BLOCK(0),
        .C_USE_BYTE_WEA(0),
        .C_USE_BYTE_WEB(0),
        .C_USE_DEFAULT_DATA(1),
        .C_USE_ECC(0),
        .C_USE_SOFTECC(0),
        .C_WEA_WIDTH(1),
        .C_WEB_WIDTH(1),
        .C_WRITE_DEPTH_A(49152),
        .C_WRITE_DEPTH_B(49152),
        .C_WRITE_MODE_A("WRITE_FIRST"),
        .C_WRITE_MODE_B("WRITE_FIRST"),
        .C_WRITE_WIDTH_A(8),
        .C_WRITE_WIDTH_B(8),
        .C_XDEVICEFAMILY("spartan6")
    )
    inst (
        .CLKA(clka),
        .ENA(ena),
        .WEA(wea),
        .ADDRA(addra),
        .DINA(dina),
        .CLKB(clkb),
        .ADDRB(addrb),
        .DOUTB(doutb),
        .RSTA(),
        .REGCEA(),
        .DOUTA(),
        .RSTB(),
        .ENB(),
        .REGCEB(),
        .WEB(),
        .DINB(),
        .INJECTSBITERR(),
        .INJECTDBITERR(),
        .SBITERR(),
        .DBITERR(),
        .RDADDRECC(),
        .S_ACLK(),
        .S_ARESETN(),
        .S_AXI_AWID(),
        .S_AXI_AWADDR(),
        .S_AXI_AWLEN(),
        .S_AXI_AWSIZE(),
        .S_AXI_AWBURST(),
        .S_AXI_AWVALID(),
        .S_AXI_AWREADY(),
        .S_AXI_WDATA(),
        .S_AXI_WSTRB(),
        .S_AXI_WLAST(),
        .S_AXI_WVALID(),
        .S_AXI_WREADY(),
        .S_AXI_BID(),
        .S_AXI_BRESP(),
        .S_AXI_BVALID(),
        .S_AXI_BREADY(),
        .S_AXI_ARID(),
        .S_AXI_ARADDR(),
        .S_AXI_ARLEN(),
        .S_AXI_ARSIZE(),
        .S_AXI_ARBURST(),
        .S_AXI_ARVALID(),
        .S_AXI_ARREADY(),
        .S_AXI_RID(),
        .S_AXI_RDATA(),
        .S_AXI_RRESP(),
        .S_AXI_RLAST(),
        .S_AXI_RVALID(),
        .S_AXI_RREADY(),
        .S_AXI_INJECTSBITERR(),
        .S_AXI_INJECTDBITERR(),
        .S_AXI_SBITERR(),
        .S_AXI_DBITERR(),
        .S_AXI_RDADDRECC()
    );

    // synthesis translate_on

endmodule
