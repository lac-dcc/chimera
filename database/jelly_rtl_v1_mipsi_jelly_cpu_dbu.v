// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    MIPS like CPU core
//
//                                  Copyright (C) 2008-2010 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



// debug register addresss map
`define DBG_ADR_DBG_CTL         4'h0
`define DBG_ADR_DBG_ADDR        4'h2
`define DBG_ADR_REG_DATA        4'h4
`define DBG_ADR_DBUS_DATA       4'h6
`define DBG_ADR_IBUS_DATA       4'h7

// register address
`define REG_ADR_HI              8'h10
`define REG_ADR_LO              8'h11
`define REG_ADR_R0              8'h20
`define REG_ADR_R1              8'h21
`define REG_ADR_R2              8'h22
`define REG_ADR_R3              8'h23
`define REG_ADR_R4              8'h24
`define REG_ADR_R5              8'h25
`define REG_ADR_R6              8'h26
`define REG_ADR_R7              8'h27
`define REG_ADR_R8              8'h28
`define REG_ADR_R9              8'h29
`define REG_ADR_R10             8'h2a
`define REG_ADR_R11             8'h2b
`define REG_ADR_R12             8'h2c
`define REG_ADR_R13             8'h2d
`define REG_ADR_R14             8'h2e
`define REG_ADR_R15             8'h2f
`define REG_ADR_R16             8'h30
`define REG_ADR_R17             8'h31
`define REG_ADR_R18             8'h32
`define REG_ADR_R19             8'h33
`define REG_ADR_R20             8'h34
`define REG_ADR_R21             8'h35
`define REG_ADR_R22             8'h36
`define REG_ADR_R23             8'h37
`define REG_ADR_R24             8'h38
`define REG_ADR_R25             8'h39
`define REG_ADR_R26             8'h3a
`define REG_ADR_R27             8'h3b
`define REG_ADR_R28             8'h3c
`define REG_ADR_R29             8'h3d
`define REG_ADR_R30             8'h3e
`define REG_ADR_R31             8'h3f
`define REG_ADR_COP0_STATUS     8'h4c
`define REG_ADR_COP0_CAUSE      8'h4d
`define REG_ADR_COP0_EPC        8'h4e
`define REG_ADR_COP0_DEBUG      8'h57
`define REG_ADR_COP0_DEEPC      8'h58


// Debug Unit
module jelly_cpu_dbu
        #(
            parameter                   USE_IBUS_HOOK = 1'b0,
            parameter                   USE_DBUS_HOOK = 1'b1
        )
        (
            // system
            input   wire                reset,
            input   wire                clk,
            input   wire                endian,
            
            // wishbone bus
            input   wire    [3:0]       wb_adr_i,
            input   wire    [31:0]      wb_dat_i,
            output  reg     [31:0]      wb_dat_o,
            input   wire                wb_we_i,
            input   wire    [3:0]       wb_sel_i,
            input   wire                wb_stb_i,
            output  reg                 wb_ack_o,
            
            
            // debug status
            output  reg                 dbg_enable,
            output  reg                 dbg_break_req,
            input   wire                dbg_break,

            // instruction bus control
            output  wire                ibus_en,
            output  wire    [31:2]      ibus_addr,
            output  wire    [31:0]      ibus_wdata,
            input   wire    [31:0]      ibus_rdata,
            output  wire                ibus_we,
            output  wire    [3:0]       ibus_sel,
            output  wire                ibus_valid,
            input   wire                ibus_ready,
            
            // data bus control
            output  wire                dbus_en,
            output  wire    [31:2]      dbus_addr,
            output  wire    [31:0]      dbus_wdata,
            input   wire    [31:0]      dbus_rdata,
            output  wire                dbus_we,
            output  wire    [3:0]       dbus_sel,
            output  wire                dbus_valid,
            input   wire                dbus_ready,
                        
            // gpr control
            output  reg                 gpr_en,
            output  wire                gpr_we,
            output  wire    [4:0]       gpr_addr,
            output  wire    [31:0]      gpr_wdata,
            input   wire    [31:0]      gpr_rdata,
            
            // hi/lo control
            output  reg                 hilo_en,
            output  wire                hilo_we,
            output  wire    [0:0]       hilo_addr,
            output  wire    [31:0]      hilo_wdata,
            input   wire    [31:0]      hilo_rdata,
            
            // cop0 control
            output  reg                 cop0_en,
            output  wire                cop0_we,
            output  wire    [4:0]       cop0_addr,
            output  wire    [31:0]      cop0_wdata,
            input   wire    [31:0]      cop0_rdata
        );
    
    // register control
    wire                reg_en;
    wire                reg_we;
    wire    [7:0]       reg_addr;
    wire    [31:0]      reg_wdata;
    reg     [31:0]      reg_rdata;
    reg                 reg_ack;
    
    
    // -----------------------------
    //  Debug control
    // -----------------------------
    
    // dbgctl
    always @ ( posedge clk ) begin
        if ( reset ) begin
            dbg_enable    <= 1'b0;
            dbg_break_req <= 1'b0;
        end
        else begin
            // dbg_enable
            if ( dbg_break ) begin
                dbg_enable <= 1'b1;
            end
            else begin
                if ( wb_stb_i & wb_we_i & wb_sel_i[0] & (wb_adr_i == `DBG_ADR_DBG_CTL) ) begin
                    if ( wb_sel_i[0] ) dbg_enable <= dbg_enable & wb_dat_i[0];
                end
            end
            
            // dbg_break_req
            if ( wb_stb_i & wb_we_i & wb_sel_i[0] & (wb_adr_i == `DBG_ADR_DBG_CTL) ) begin
                dbg_break_req <= wb_dat_i[1];
            end
        end
    end
    
    
    // dbg_addr
    reg     [31:0]      dbg_addr;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            dbg_addr <= {32{1'b0}};
        end
        else begin
            if ( wb_stb_i & wb_we_i & (wb_adr_i == `DBG_ADR_DBG_ADDR) ) begin
                if ( wb_sel_i[0] ) dbg_addr[7:2]   <= wb_dat_i[7:2];
                if ( wb_sel_i[1] ) dbg_addr[15:8]  <= wb_dat_i[15:8];
                if ( wb_sel_i[2] ) dbg_addr[23:16] <= wb_dat_i[23:16];
                if ( wb_sel_i[3] ) dbg_addr[31:24] <= wb_dat_i[31:24];
            end
        end
    end
    
    // register control
    assign reg_en    = wb_stb_i & (wb_adr_i == `DBG_ADR_REG_DATA);
    assign reg_we    = wb_we_i;
    assign reg_addr  = dbg_addr[9:2];
    assign reg_wdata = wb_dat_i;
    
    
    // i-bus control
    wire                ibus_ack;
    generate
    if ( USE_IBUS_HOOK ) begin
        assign ibus_en        = 1'b1;
        assign ibus_we        = 1'b0;
        assign ibus_sel       = wb_sel_i;
        assign ibus_addr      = dbg_addr[31:2];
        assign ibus_wdata     = wb_dat_i;
        assign ibus_valid     = wb_stb_i & (wb_adr_i == `DBG_ADR_IBUS_DATA);
        
        reg             ibus_reg_ack;
        always @( posedge clk ) begin
            if ( reset ) begin
                ibus_reg_ack <= 1'b0;
            end
            else begin
                if ( dbus_ready ) begin
                    ibus_reg_ack <= ibus_en & !ibus_we;
                end
            end
        end
        assign ibus_ack = ibus_ready & (ibus_reg_ack | ibus_we);
    end
    else begin
        assign ibus_en    = 1'b0;
        assign ibus_we    = 1'b0;
        assign ibus_sel   = 4'b1111;
        assign ibus_addr  = 0;
        assign ibus_wdata = 0;
        assign ibus_valid = 1'b0;
    end
    endgenerate


    // d-bus control
    wire    [31:0]      dbus_wb_dat;
    wire                dbus_wb_ack;
    generate
    if ( USE_DBUS_HOOK ) begin
        jelly_wishbone_to_jbus
                #(
                    .ADDR_WIDTH         (30),
                    .DATA_SIZE          (2),    // 0:8bit, 1:16bit, 2:32bit ...
                    .PIPELINE           (1)
                )
            i_wishbone_to_jbus_data
                (
                    .reset              (reset),
                    .clk                (clk),
                    
                    .s_wb_adr_i         (dbg_addr[31:2]),
                    .s_wb_dat_i         (wb_dat_i),
                    .s_wb_dat_o         (dbus_wb_dat),
                    .s_wb_we_i          (wb_we_i),
                    .s_wb_sel_i         (wb_sel_i),
                    .s_wb_stb_i         (wb_stb_i & (wb_adr_i == `DBG_ADR_DBUS_DATA)),
                    .s_wb_ack_o         (dbus_wb_ack),
                    
                    .m_jbus_en          (dbus_en),
                    .m_jbus_addr        (dbus_addr),
                    .m_jbus_wdata       (dbus_wdata),
                    .m_jbus_rdata       (dbus_rdata),
                    .m_jbus_we          (dbus_we),
                    .m_jbus_sel         (dbus_sel),
                    .m_jbus_valid       (dbus_valid),
                    .m_jbus_ready       (dbus_ready)
                );
        /*
        assign dbus_interlock = 1'b0;
        assign dbus_en        = wb_stb_i & (wb_adr_i == `DBG_ADR_DBUS_DATA);
        assign dbus_we        = wb_we_i;
        assign dbus_sel       = wb_sel_i;
        assign dbus_addr      = dbg_addr;
        assign dbus_wdata     = wb_dat_i;

        reg             dbus_reg_ack;
        always @( posedge clk ) begin
            if ( reset ) begin
                dbus_reg_ack <= 1'b0;
            end
            else begin
                if ( !dbus_busy ) begin
                    dbus_reg_ack <= dbus_en & !dbus_we;
                end
            end
        end
        assign dbus_ack = !dbus_busy & (dbus_reg_ack | dbus_we);
        */
    end
    else begin
        assign dbus_en        = 1'b0;
        assign dbus_addr      = 0;
        assign dbus_wdata     = 0;
        assign dbus_sel       = 4'b0000;
        assign dbus_we        = 1'b0;
        assign dbus_valid     = 1'b0;
        
        assign dbus_wb_ack    = wb_stb_i & (wb_adr_i == `DBG_ADR_DBUS_DATA);
    end
    endgenerate
    
    
    
    // read
    always @* begin
        casex ( wb_adr_i )
        `DBG_ADR_DBG_CTL:   // DBG_CTL
            begin
                wb_dat_o = {{30{1'b0}}, dbg_break_req, dbg_enable};
                wb_ack_o = 1'b1;
            end
        
        `DBG_ADR_DBG_ADDR:  // DBG_ADDR
            begin
                wb_dat_o = dbg_addr;
                wb_ack_o = 1'b1;
            end
        
        `DBG_ADR_REG_DATA:  // REG_DATA
            begin
                wb_dat_o = reg_rdata;
                wb_ack_o = reg_ack;
            end
        
        `DBG_ADR_DBUS_DATA: // DBUS_DATA
            begin
                wb_dat_o = dbus_wb_dat;
                wb_ack_o = dbus_wb_ack;
            end
        
        `DBG_ADR_IBUS_DATA: // IBUS_DATA
            begin
                wb_dat_o = ibus_rdata;
                wb_ack_o = ibus_ack;
            end
        
        default:
            begin
                wb_dat_o = {32{1'b0}};
                wb_ack_o = 1'b1;
            end
        endcase
    end
    
    
    
    // -----------------------------
    //  Register access
    // -----------------------------
    
    // hi/lo control
    assign hilo_we    = reg_we;
    assign hilo_addr  = reg_addr[0];
    assign hilo_wdata = reg_wdata;
    
    // gpr control
    assign gpr_we     = reg_we;
    assign gpr_addr   = reg_addr[4:0];
    assign gpr_wdata  = reg_wdata;
        
    // cop0 control
    assign cop0_we    = reg_we;
    assign cop0_addr  = reg_addr[4:0];
    assign cop0_wdata = reg_wdata;
    
    // address decode
    always @* begin
        hilo_en = 1'b0;
        gpr_en  = 1'b0;
        cop0_en = 1'b0;
        casex ( reg_addr[7:0] )     
        8'b0001_000x:           // HI, LO
            begin
                hilo_en   = reg_en;
                reg_rdata = hilo_rdata;
            end
        
        8'b001x_xxxx:           // GPR
            begin
                gpr_en    = reg_en;
                reg_rdata = gpr_rdata;
            end
        
        8'b010x_xxxx:           // COP0
            begin
                cop0_en   = reg_en;
                reg_rdata = cop0_rdata;
            end
        
        default:
            begin
                reg_rdata = {32{1'b0}};
            end
        endcase
    end
    
    // reg_ack (1 cycle wait)
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_ack <= 1'b0;
        end
        else begin
            reg_ack <= ~reg_ack & reg_en;
        end
    end
    
endmodule



`default_nettype wire



// end of file

