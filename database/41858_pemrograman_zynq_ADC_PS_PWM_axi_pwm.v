// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module axi_pwm
    (
	    // *** AXI4 clock and reset port ***
		input  wire        aclk,
		input  wire        aresetn,
        // *** AXI4-lite slave port ***
        output wire        s_axi_awready,
		input  wire [31:0] s_axi_awaddr,
		input  wire        s_axi_awvalid,
		output wire        s_axi_wready,
		input  wire [3:0]  s_axi_wstrb,
		input  wire [31:0] s_axi_wdata,
		input  wire        s_axi_wvalid,
		input  wire        s_axi_bready,
		output wire [1:0]  s_axi_bresp,
		output wire        s_axi_bvalid,
		output wire        s_axi_arready,
		input  wire [31:0] s_axi_araddr,
		input  wire        s_axi_arvalid,
		input  wire        s_axi_rready,
		output wire [31:0] s_axi_rdata,		
        output wire [1:0]  s_axi_rresp,
        output wire        s_axi_rvalid,
        // *** AXI4-stream slave signals ***
        output wire        pwm_out
    );
    
	localparam C_ADDR_BITS = 8;
	// *** Address ***
	localparam C_ADDR_PWM_REG = 4'h0;
	// *** AXI write FSM ***
	localparam S_WRIDLE = 2'd0,
			   S_WRDATA = 2'd1,
			   S_WRRESP = 2'd2;
	// *** AXI read FSM ***
	localparam S_RDIDLE = 2'd0,
			   S_RDDATA = 2'd1;

    // *** AXI write ***
	reg [1:0] wstate_cs, wstate_ns;
	reg [C_ADDR_BITS-1:0] waddr;
	wire [31:0] wmask;
	wire aw_hs, w_hs;
	// *** AXI read ***
	reg [1:0] rstate_cs, rstate_ns;
	wire [C_ADDR_BITS-1:0] raddr;
	reg [31:0] rdata;
	wire ar_hs;
	// *** Internal registers ***
    reg [7:0] pwm_reg;
    	
	// *** AXI write ************************************************************
    assign s_axi_awready = (wstate_cs == S_WRIDLE);
    assign s_axi_wready = (wstate_cs == S_WRDATA);
    assign s_axi_bresp = 2'b00;    // OKAY
    assign s_axi_bvalid = (wstate_cs == S_WRRESP);
    assign wmask = {{8{s_axi_wstrb[3]}}, {8{s_axi_wstrb[2]}}, {8{s_axi_wstrb[1]}}, {8{s_axi_wstrb[0]}}};
    assign aw_hs = s_axi_awvalid & s_axi_awready;
    assign w_hs = s_axi_wvalid & s_axi_wready;

    // *** Write state register ***
    always @(posedge aclk)
    begin
        if (!aresetn)
            wstate_cs <= S_WRIDLE;
        else
            wstate_cs <= wstate_ns;
    end
    
    // *** Write state next ***
    always @(*)
    begin
        case (wstate_cs)
            S_WRIDLE:
                if (s_axi_awvalid)
                    wstate_ns = S_WRDATA;
                else
                    wstate_ns = S_WRIDLE;
            S_WRDATA:
                if (s_axi_wvalid)
                    wstate_ns = S_WRRESP;
                else
                    wstate_ns = S_WRDATA;
            S_WRRESP:
                if (s_axi_bready)
                    wstate_ns = S_WRIDLE;
                else
                    wstate_ns = S_WRRESP;
            default:
                wstate_ns = S_WRIDLE;
        endcase
    end
    
    // *** Write address register ***
    always @(posedge aclk)
    begin
        if (aw_hs)
            waddr <= s_axi_awaddr[C_ADDR_BITS-1:0];
    end

    // *** AXI read *************************************************************
    assign s_axi_arready = (rstate_cs == S_RDIDLE);
    assign s_axi_rdata = rdata;
    assign s_axi_rresp = 2'b00;   // OKAY
    assign s_axi_rvalid = (rstate_cs == S_RDDATA);
    assign ar_hs = s_axi_arvalid & s_axi_arready;
    assign raddr = s_axi_araddr[C_ADDR_BITS-1:0];
    
    // *** Read state register ***
    always @(posedge aclk)
    begin
        if (!aresetn)
            rstate_cs <= S_RDIDLE;
        else
            rstate_cs <= rstate_ns;
    end

    // *** Read state next ***
    always @(*) 
    begin
        case (rstate_cs)
            S_RDIDLE:
                if (s_axi_arvalid)
                    rstate_ns = S_RDDATA;
                else
                    rstate_ns = S_RDIDLE;
            S_RDDATA:
                if (s_axi_rready)
                    rstate_ns = S_RDIDLE;
                else
                    rstate_ns = S_RDDATA;
            default:
                rstate_ns = S_RDIDLE;
        endcase
    end
    
    // *** Read data register ***
    always @(posedge aclk)
    begin
        if (!aresetn)
        begin
            rdata <= 0;
        end
        else if (ar_hs)
        begin
            case (raddr)
                C_ADDR_PWM_REG:
                begin
                    rdata <= {{24{1'b0}}, pwm_reg};
                end         
            endcase
        end
    end

    // *** Internal registers ***************************************************
    always @(posedge aclk)
    begin
        if (!aresetn)
        begin
            pwm_reg <= 50;
        end
        else if (w_hs && waddr == C_ADDR_PWM_REG)
        begin
            pwm_reg <= s_axi_wdata[7:0];
        end
    end

    pwm_core pwm_core_0
    (
        .clk(aclk),
        .rst_n(aresetn),
        .pwm_value(pwm_reg),
        .pwm_out(pwm_out)
    );
 
endmodule
