// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_resize_half
        #(
            parameter   COMPONENT_NUM       = 3,
            parameter   DATA_WIDTH          = 8,
            parameter   AXI4S_TUSER_WIDTH   = 1,
            parameter   AXI4S_TDATA_WIDTH   = COMPONENT_NUM*DATA_WIDTH,
            
            parameter   AXI4L_ADDR_WIDTH    = 32,
            parameter   AXI4L_DATA_SIZE     = 2,        // 0:bit, 1:16bit, 2:32bit ...
            parameter   AXI4L_DATA_WIDTH    = (8 << AXI4L_DATA_SIZE),
            parameter   AXI4L_STRB_WIDTH    = AXI4L_DATA_WIDTH / 8,
            parameter   REG_ADDR_STEP       = AXI4L_DATA_SIZE,
            parameter   INDEX_WIDTH         = 1,
            
            parameter   MAX_X_NUM           = 4096,
            parameter   RAM_TYPE            = MAX_X_NUM > 128 ? "block" : "distributed",
            parameter   M_SLAVE_REGS        = 1,
            parameter   M_MASTER_REGS       = 1,
            
            parameter   INIT_PARAM_V_ENABLE = 1,
            parameter   INIT_PARAM_H_ENABLE = 1
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            input   wire                            aclken,
            
            input   wire    [AXI4S_TUSER_WIDTH-1:0] s_axi4s_tuser,
            input   wire                            s_axi4s_tlast,
            input   wire    [AXI4S_TDATA_WIDTH-1:0] s_axi4s_tdata,
            input   wire                            s_axi4s_tvalid,
            output  wire                            s_axi4s_tready,
            
            output  wire    [AXI4S_TUSER_WIDTH-1:0] m_axi4s_tuser,
            output  wire                            m_axi4s_tlast,
            output  wire    [AXI4S_TDATA_WIDTH-1:0] m_axi4s_tdata,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready,
            
            
            input   wire                            s_axi4l_aresetn,
            input   wire                            s_axi4l_aclk,
            input   wire    [AXI4L_ADDR_WIDTH-1:0]  s_axi4l_awaddr,
            input   wire    [2:0]                   s_axi4l_awprot,
            input   wire                            s_axi4l_awvalid,
            output  wire                            s_axi4l_awready,
            input   wire    [AXI4L_STRB_WIDTH-1:0]  s_axi4l_wstrb,
            input   wire    [AXI4L_DATA_WIDTH-1:0]  s_axi4l_wdata,
            input   wire                            s_axi4l_wvalid,
            output  wire                            s_axi4l_wready,
            output  wire    [1:0]                   s_axi4l_bresp,
            output  wire                            s_axi4l_bvalid,
            input   wire                            s_axi4l_bready,
            input   wire    [AXI4L_ADDR_WIDTH-1:0]  s_axi4l_araddr,
            input   wire    [2:0]                   s_axi4l_arprot,
            input   wire                            s_axi4l_arvalid,
            output  wire                            s_axi4l_arready,
            output  wire    [AXI4L_DATA_WIDTH-1:0]  s_axi4l_rdata,
            output  wire    [1:0]                   s_axi4l_rresp,
            output  wire                            s_axi4l_rvalid,
            input   wire                            s_axi4l_rready
        );
    
    localparam  ADDR_WIDTH          = 2 + REG_ADDR_STEP;
    localparam  ADDR_CTL_UPDATE     = (32'h0000 << REG_ADDR_STEP);
    localparam  ADDR_CTL_INDEX      = (32'h0000 << REG_ADDR_STEP);
    localparam  ADDR_PARAM_V_ENABLE = (32'h0002 << REG_ADDR_STEP);
    localparam  ADDR_PARAM_H_ENABLE = (32'h0003 << REG_ADDR_STEP);
    
    
    // signal
    wire                        sig_update_ack;
    
    // registers
    reg                         reg_ctl_update;
    wire    [INDEX_WIDTH-1:0]   sig_ctl_index;
    
    reg                         reg_param_v_enable;
    reg                         reg_param_h_enable;
    
    // write
    always @(posedge s_axi4l_aclk) begin
        if ( ~s_axi4l_aresetn ) begin
            reg_ctl_update     <= 1'b0;
            reg_param_v_enable <= INIT_PARAM_V_ENABLE;
            reg_param_h_enable <= INIT_PARAM_H_ENABLE;
        end
        else begin
            if ( s_axi4l_bvalid && s_axi4l_bready && s_axi4l_wstrb != 0 ) begin
                case ( s_axi4l_awaddr[ADDR_WIDTH-1:0] )
                ADDR_CTL_UPDATE:        reg_ctl_update     <= s_axi4l_wdata;
                ADDR_PARAM_V_ENABLE:    reg_param_v_enable <= s_axi4l_wdata;
                ADDR_PARAM_H_ENABLE:    reg_param_h_enable <= s_axi4l_wdata;
                endcase
            end
            
            // auto clear
            if ( sig_update_ack ) begin
                reg_ctl_update <= 1'b0;
            end
        end
    end
    
    // read
    reg     [AXI4L_DATA_WIDTH-1:0]  tmp_rdata;
    always @* begin
        tmp_rdata = {AXI4L_DATA_WIDTH{1'b0}};
        case ( s_axi4l_araddr[ADDR_WIDTH-1:0] )
        ADDR_CTL_UPDATE:        tmp_rdata = reg_ctl_update;
        ADDR_CTL_INDEX:         tmp_rdata = sig_ctl_index;
        ADDR_PARAM_V_ENABLE:    tmp_rdata = reg_param_v_enable;
        ADDR_PARAM_H_ENABLE:    tmp_rdata = reg_param_h_enable;
        endcase
    end
    
    assign s_axi4l_awready = s_axi4l_bready & s_axi4l_wvalid;
    assign s_axi4l_wready  = s_axi4l_bready & s_axi4l_awvalid;
    assign s_axi4l_bresp   = 2'b00;
    assign s_axi4l_bvalid  = s_axi4l_awvalid & s_axi4l_wvalid;
    assign s_axi4l_arready = s_axi4l_rready;
    assign s_axi4l_rdata   = tmp_rdata;
    assign s_axi4l_rresp   = 2'b00;
    assign s_axi4l_rvalid  = s_axi4l_arvalid;
    
    
    
    // shadow register
    wire            update;
    
    jelly_shadow_reg_ctl
            #(
                .INDEX_WIDTH        (INDEX_WIDTH)
            )
        i_shadow_reg_ctl
            (
                .reset              (~s_axi4l_aresetn),
                .clk                (s_axi4l_aclk),
                .update_req         (reg_ctl_update),
                .update_ack         (sig_update_ack),
                .index              (sig_ctl_index),
                
                .core_reset         (~aresetn),
                .core_clk           (aclk),
                .core_acceptable    (s_axi4s_tuser[0] & s_axi4s_tvalid & s_axi4s_tready),
                .core_update        (update)
            );
    
    
    reg                         reg_shadow_v_enable;
    reg                         reg_shadow_h_enable;
    always @(posedge aclk) begin
        if ( update ) begin
            reg_shadow_v_enable <= reg_param_v_enable;
            reg_shadow_h_enable <= reg_param_h_enable;
        end
    end
    
    
    jelly_video_resize_half_core
            #(
                .COMPONENT_NUM      (COMPONENT_NUM),
                .DATA_WIDTH         (DATA_WIDTH),
                .TUSER_WIDTH        (AXI4S_TUSER_WIDTH),
                .TDATA_WIDTH        (AXI4S_TDATA_WIDTH),
                .MAX_X_NUM          (MAX_X_NUM),
                .RAM_TYPE           (RAM_TYPE),
                .M_SLAVE_REGS       (M_SLAVE_REGS),
                .M_MASTER_REGS      (M_MASTER_REGS)
            )
        i_video_resize_half_core
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                
                .param_v_enable     (reg_shadow_v_enable),
                .param_h_enable     (reg_shadow_h_enable),
                
                .s_axi4s_tuser      (s_axi4s_tuser),
                .s_axi4s_tlast      (s_axi4s_tlast),
                .s_axi4s_tdata      (s_axi4s_tdata),
                .s_axi4s_tvalid     (s_axi4s_tvalid),
                .s_axi4s_tready     (s_axi4s_tready),
                
                .m_axi4s_tuser      (m_axi4s_tuser),
                .m_axi4s_tlast      (m_axi4s_tlast),
                .m_axi4s_tdata      (m_axi4s_tdata),
                .m_axi4s_tvalid     (m_axi4s_tvalid),
                .m_axi4s_tready     (m_axi4s_tready)
            );
    
    
    
endmodule



`default_nettype wire



// end of file
