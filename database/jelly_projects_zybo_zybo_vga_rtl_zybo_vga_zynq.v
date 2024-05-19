// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License



`timescale 1ns / 1ps
`default_nettype none


module zybo_vga_zynq
        (
            input   wire            in_clk125,
            
            output  wire            vga_hsync,
            output  wire            vga_vsync,
            output  wire    [4:0]   vga_r,
            output  wire    [5:0]   vga_g,
            output  wire    [4:0]   vga_b,
            
            input   wire    [3:0]   push_sw,
            input   wire    [3:0]   dip_sw,
            output  wire    [3:0]   led,
            
            
            inout   wire    [14:0]  DDR_addr,
            inout   wire    [2:0]   DDR_ba,
            inout   wire            DDR_cas_n,
            inout   wire            DDR_ck_n,
            inout   wire            DDR_ck_p,
            inout   wire            DDR_cke,
            inout   wire            DDR_cs_n,
            inout   wire    [3:0]   DDR_dm,
            inout   wire    [31:0]  DDR_dq,
            inout   wire    [3:0]   DDR_dqs_n,
            inout   wire    [3:0]   DDR_dqs_p,
            inout   wire            DDR_odt,
            inout   wire            DDR_ras_n,
            inout   wire            DDR_reset_n,
            inout   wire            DDR_we_n,
            inout   wire            FIXED_IO_ddr_vrn,
            inout   wire            FIXED_IO_ddr_vrp,
            inout   wire    [53:0]  FIXED_IO_mio,
            inout   wire            FIXED_IO_ps_clk,
            inout   wire            FIXED_IO_ps_porb,
            inout   wire            FIXED_IO_ps_srstb
        );
    
    
    // -----------------------------
    //  Zynq PS
    // -----------------------------
    
    design_1
        i_design_1
            (
                .DDR_addr           (DDR_addr),
                .DDR_ba             (DDR_ba),
                .DDR_cas_n          (DDR_cas_n),
                .DDR_ck_n           (DDR_ck_n),
                .DDR_ck_p           (DDR_ck_p),
                .DDR_cke            (DDR_cke),
                .DDR_cs_n           (DDR_cs_n),
                .DDR_dm             (DDR_dm),
                .DDR_dq             (DDR_dq),
                .DDR_dqs_n          (DDR_dqs_n),
                .DDR_dqs_p          (DDR_dqs_p),
                .DDR_odt            (DDR_odt),
                .DDR_ras_n          (DDR_ras_n),
                .DDR_reset_n        (DDR_reset_n),
                .DDR_we_n           (DDR_we_n),
                .FIXED_IO_ddr_vrn   (FIXED_IO_ddr_vrn),
                .FIXED_IO_ddr_vrp   (FIXED_IO_ddr_vrp),
                .FIXED_IO_mio       (FIXED_IO_mio),
                .FIXED_IO_ps_clk    (FIXED_IO_ps_clk),
                .FIXED_IO_ps_porb   (FIXED_IO_ps_porb),
                .FIXED_IO_ps_srstb  (FIXED_IO_ps_srstb)
            );
    
    
    
    
    // -----------------------------
    //  reset & clock
    // -----------------------------
    
    
    wire    reset;
    wire    clk;
    
    assign reset = 1'b0;    // ボタンがもったいないのでリセット付けない
    
    clk_wiz_0 
        i_clk_wiz_0
            (
                .clk_in1    (in_clk125),
                .clk_out1   (clk)
            );
    
    
    
    // -----------------------------
    //  VGA
    // -----------------------------
    
    localparam  HDISP = 640;    // Horizontal Active Video
    localparam  HFP   = 16;     // Horizontal Front Porch
    localparam  HPW   = 96;     // Horizontal Sync Pulse
    localparam  HBP   = 48;     // HorizontalBack Porch
    localparam  VDISP = 480;    // Vertical Active Video
    localparam  VFP   = 11;     // Vertical Front Porch
    localparam  VPW   = 2;      // Vertical Sync Pulse
    localparam  VBP   = 31;     // Vertical Back Porch
    
    localparam  HTOTAL      = HPW + HBP + HDISP + HFP;
    localparam  HDISP_START = HPW + HBP;
    localparam  HDISP_END   = HDISP_START + HDISP;
    
    localparam  VTOTAL      = VPW + VBP + VDISP + VFP;
    localparam  VDISP_START = VPW + VBP;
    localparam  VDISP_END   = VDISP_START + VDISP;
    
    reg     [9:0]   h_counter;
    reg     [8:0]   v_counter;
    
    reg             out_hsync;
    reg             out_vsync;
    reg     [4:0]   out_r;
    reg     [5:0]   out_g;
    reg     [4:0]   out_b;
    
    always @(posedge clk) begin
        if ( reset ) begin
            h_counter <= 0;
            v_counter <= 0;
            
            out_hsync <= 0;
            out_vsync <= 0;
            out_r     <= 0;
            out_g     <= 0;
            out_b     <= 0;
        end
        else begin
            // H-V カウンタ
            h_counter <= h_counter + 1;
            if ( h_counter >= HTOTAL-1 ) begin
                h_counter <= 0;
                v_counter <= v_counter + 1;
                if ( v_counter >= VTOTAL-1 ) begin
                    v_counter <= 0;
                end
            end
            
            out_hsync <= ~(h_counter < HPW);
            out_vsync <= ~(v_counter < VPW);
            
            if ( h_counter >= HDISP_START && h_counter < HDISP_END
                    && v_counter >= VDISP_START && v_counter < VDISP_END ) begin
                out_r <= (h_counter[4:0] == 0) ? 5'h1f : 0;
                out_b <= (v_counter[4:0] == 0) ? 5'h1f : 0;
                out_g <= h_counter + v_counter;
            end
            else begin
                out_r <= 0;
                out_g <= 0;
                out_b <= 0;
            end
        end
    end
    
    assign vga_hsync = out_hsync;
    assign vga_vsync = out_vsync;
    assign vga_r     = out_r;
    assign vga_g     = out_g;
    assign vga_b     = out_b;
    
    assign led = dip_sw;
    
endmodule


`default_nettype wire


// endof file
