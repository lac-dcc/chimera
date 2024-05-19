// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_extbus
        #(
            parameter                           ACCESS_CYCLE  = 1,

            parameter                           WB_ADR_WIDTH  = 18,
            parameter                           WB_DAT_WIDTH  = 32,
            parameter                           WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8)
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // extbus
            output  reg                         extbus_cs_n,
            output  reg                         extbus_we_n,
            output  reg                         extbus_oe_n,
            output  reg     [WB_SEL_WIDTH-1:0]  extbus_bls_n,
            output  reg     [WB_ADR_WIDTH-1:0]  extbus_a,
            inout   wire    [WB_DAT_WIDTH-1:0]  extbus_d,
            
            // wishbone
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            output  reg     [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o
        );
/*
    reg                         extbus_cs_n;
    reg                         extbus_we_n;
    reg                         extbus_oe_n;
    reg     [WB_SEL_WIDTH-1:0]  extbus_bls_n;
    reg     [WB_ADR_WIDTH-1:0]  extbus_a;
    */
    reg     [WB_DAT_WIDTH-1:0]  extbus_wdata;
    
//  reg     [WB_DAT_WIDTH-1:0]  s_wb_dat_o;
    
    reg                         st_idle;
    reg     [ACCESS_CYCLE-1:0]  st_access;
    reg                         st_end;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            st_idle     <= 1'b1;
            st_access   <= {ACCESS_CYCLE{1'b0}};
            st_end      <= 1'b0;
            
            extbus_cs_n  <= 1'b1;
            extbus_we_n  <= 1'b1;
            extbus_oe_n  <= 1'b1;
            extbus_bls_n <= {WB_SEL_WIDTH{1'b1}};
            extbus_a     <= {WB_ADR_WIDTH{1'b0}};
            extbus_wdata <= {WB_DAT_WIDTH{1'b0}};
        end
        else begin
            // state
            if ( s_wb_stb_i ) begin
                st_idle   <= st_end;
                st_access <= {st_access, st_idle};
                st_end    <= st_access[ACCESS_CYCLE-1];
            end
                        
            // extbus_cs_n
            if ( st_idle & s_wb_stb_i ) begin
                extbus_cs_n <= 1'b0;
            end
            else if ( st_access[ACCESS_CYCLE-1] ) begin
                extbus_cs_n <= 1'b1;
            end
            
            // extbus_we_n
            if ( st_idle & s_wb_stb_i & s_wb_we_i ) begin
                extbus_we_n <= 1'b0;
            end
            else if ( st_access[ACCESS_CYCLE-1] ) begin
                extbus_we_n <= 1'b1;
            end
            
            // extbus_oe_n
            if ( st_idle & s_wb_stb_i & ~s_wb_we_i ) begin
                extbus_oe_n <= 1'b0;
            end
            else if ( st_access[ACCESS_CYCLE-1] ) begin
                extbus_oe_n <= 1'b1;
            end
            
            // extbus_bls_n
            extbus_bls_n <= ~s_wb_sel_i;
            
            // extbus_a
            extbus_a <= s_wb_adr_i;
            
            // extbus_wdata
            extbus_wdata <= s_wb_dat_i;
            
            // s_wb_dat_o
            s_wb_dat_o <= extbus_d;
        end
    end
    
    assign extbus_d = ~extbus_we_n ? extbus_wdata : {WB_DAT_WIDTH{1'bz}};
    
    assign s_wb_ack_o = st_end;

    
    /*
    reg                         busy;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            busy  <= 1'b0;
        end
        else begin
            if ( s_wb_stb_i & ~s_wb_ack_o ) begin
                busy  <= 1'b1;
            end
            else begin
                busy  <= 1'b0;
            end
        end
    end
    
    assign extbus_cs_n  = ~s_wb_stb_i;
    assign extbus_we_n  = ~(s_wb_stb_i &  s_wb_we_i & ~busy);
    assign extbus_oe_n  = ~(s_wb_stb_i & ~s_wb_we_i);
    assign extbus_bls_n = ~s_wb_sel_i;
    assign extbus_a     = s_wb_adr_i;
    assign extbus_d     = ~extbus_we_n ? s_wb_dat_i : {WB_DAT_WIDTH{1'bz}};

    assign s_wb_dat_o    = extbus_d;
    assign s_wb_ack_o    = ~(s_wb_stb_i & ~busy);
    */
    
endmodule


`default_nettype wire


// end of file
