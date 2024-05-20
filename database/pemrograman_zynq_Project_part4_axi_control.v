// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module axi_control
    #(
        C_ADDR_WIDTH = 32,
        C_DATA_WIDTH = 32
    )
    (
        // *** Clock and reset signals ***
        input wire aclk,
        input wire aresetn,
        // *** AXI4-lite slave signals ***
        output wire s_axi_awready,
        input wire [C_ADDR_WIDTH-1:0] s_axi_awaddr,
        input wire s_axi_awvalid,
        output wire s_axi_wready,
        input wire [C_DATA_WIDTH-1:0] s_axi_wdata,
        input wire [C_DATA_WIDTH/8-1:0] s_axi_wstrb,
        input wire s_axi_wvalid,
        input wire s_axi_bready,
        output wire [1:0] s_axi_bresp,
        output wire s_axi_bvalid,
        output wire s_axi_arready,
        input wire [C_ADDR_WIDTH-1:0] s_axi_araddr,
        input wire s_axi_arvalid,
        input wire s_axi_rready,
        output wire [C_DATA_WIDTH-1:0] s_axi_rdata,
        output wire [1:0] s_axi_rresp,
        output wire s_axi_rvalid,
        // *** Control signals ***
        output wire [9:0] num_of_inp,
        output wire [7:0] gain,
        output wire start,
        input wire done
    );
    
    // *** Register map ***
    // 0x00: done[11] (R) | start[10] (R/W) | num_of_inp[9:0] (R/W)
    // 0x04: gain[7:0] (R/W)
    localparam C_ADDR_BITS = 4;
    // *** Address ***
    localparam C_ADDR_CTRL = 4'h00,
               C_ADDR_GAIN = 4'h04;
              
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
    reg [9:0] num_of_inp_reg;
    reg start_reg;
    reg done_reg;
    reg [7:0] gain_reg;
    
    // *** User signals ***
    
    // *** AXI write ************************************************************
    assign s_axi_awready = (wstate_cs == S_WRIDLE);
    assign s_axi_wready = (wstate_cs == S_WRDATA);
    assign s_axi_bresp = 2'b00; // OKAY
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
    assign s_axi_rdata = rdata; assign s_axi_rresp = 2'b00; // OKAY
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
            rdata <= 0;
        else if (ar_hs)
            case (raddr)
                C_ADDR_CTRL:
                    rdata <= {done_reg, start_reg, num_of_inp_reg[9:0]};
                C_ADDR_GAIN:
                    rdata <= gain_reg[7:0];
            endcase
    end
    
    // *** Internal registers ***************************************************
    // *** num_of_inp_reg[9:0], start_reg ***
    always @(posedge aclk)
    begin
        if (!aresetn)
        begin
            start_reg <= 0;
            num_of_inp_reg[9:0] <= 0;
        end
        else if (w_hs && waddr == C_ADDR_CTRL)
        begin
            if (s_axi_wdata[10] == 1) start_reg <= 1;
                num_of_inp_reg[9:0] <= (s_axi_wdata[31:0] & wmask) | (num_of_inp_reg[9:0] & ~wmask);
        end
        else
        begin
            start_reg <= 0;
        end
    end
        
    // *** gain_reg[7:0] ***
    always @(posedge aclk)
    begin
        if (!aresetn)
            gain_reg[7:0] <= 0;
        else if (w_hs && waddr == C_ADDR_GAIN)
            gain_reg[7:0] <= (s_axi_wdata[31:0] & wmask) | (gain_reg[7:0] & ~wmask);
    end
    
    // *** done_reg ***
    always @(posedge aclk)
    begin
        if (!aresetn)
            done_reg <= 0;
        else
            done_reg <= done;
    end
    
    // *** Instantiation ********************************************************
    assign num_of_inp = num_of_inp_reg;
    assign gain = gain_reg;
    assign start = start_reg;

endmodule
