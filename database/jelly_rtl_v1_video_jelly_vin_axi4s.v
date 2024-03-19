// ---------------------------------------------------------------------------
//  Jelly  -- The FPGA processing system
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  Video Input
module jelly_vin_axi4s
        #(
            parameter   WIDTH = 24
        )
        (
            input   wire                reset,
            input   wire                clk,
            
            // input timing
            input   wire                in_vsync,
            input   wire                in_hsync,
            input   wire                in_de,
            input   wire    [WIDTH-1:0] in_data,
            input   wire    [3:0]       in_ctl,
            
            // slave AXI4-Stream (input)
            output  wire    [0:0]       m_axi4s_tuser,
            output  wire                m_axi4s_tlast,
            output  wire    [WIDTH-1:0] m_axi4s_tdata,
            output  wire                m_axi4s_tvalid
        );
    
    reg                 st0_vsync;
    reg                 st0_de;
    reg     [WIDTH-1:0] st0_data;
    
    reg                 st1_tuser;
    reg                 st1_tlast;
    reg     [WIDTH-1:0] st1_tdata;
    reg                 st1_tvalid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_vsync  <= in_vsync;
            st0_de     <= 1'b0;
            st0_data   <= {WIDTH{1'bx}};
            
            st1_tuser  <= 1'bx;
            st1_tlast  <= 1'bx;
            st1_tdata  <= {WIDTH{1'bx}};
            st1_tvalid <= 1'b0;
        end
        else begin
            st0_vsync  <= in_vsync;
            st0_de     <= in_de;
            st0_data   <= in_data;
            
            // frame start
            if ( st0_vsync != in_vsync ) begin
                st1_tuser <= 1'b1;
            end
            else if ( st1_tvalid ) begin
                st1_tuser <= 1'b0;
            end
            
            st1_tlast  <= (st0_de && !in_de);
            st1_tdata  <= st0_data;
            st1_tvalid <= st0_de;
        end
    end
    
    assign m_axi4s_tuser  = st1_tuser;
    assign m_axi4s_tlast  = st1_tlast;
    assign m_axi4s_tdata  = st1_tdata;
    assign m_axi4s_tvalid = st1_tvalid;
    
endmodule


`default_nettype wire


// end of file
