// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// register
module jelly_register_wishbone
        #(
            parameter   DATA_WIDTH    = 32,
            parameter   INITIAL_VALUE = 0,
            parameter   WB_DAT_WIDTH  = DATA_WIDTH,
            parameter   WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8)
        )
        (
            // system
            input   wire                        clk,
            input   wire                        reset,
            
            input   wire    [WB_DAT_WIDTH-1:0]  readonly_mask,
            
            // wishbone
            output  wire    [WB_DAT_WIDTH-1:0]  wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  wb_dat_i,
            input   wire                        wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  wb_sel_i,
            input   wire                        wb_stb_i,
            output  wire                        wb_ack_o,
            
            // data port
            input   wire    [WB_DAT_WIDTH-1:0]  data_we,
            input   wire    [WB_DAT_WIDTH-1:0]  data_in,
            output  wire    [WB_DAT_WIDTH-1:0]  data_out
        );
    
    // register
    reg     [DATA_WIDTH-1:0]    reg_data;
    
    reg     [DATA_WIDTH-1:0]    reg_data_next;
    
    
    // register
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_data <= INITIAL_VALUE;
        end
        else begin
            reg_data <= reg_data_next;
        end
    end
    
    
    integer                     i, j;
    always @* begin
        reg_data_next = reg_data;
        
        // wishbone
        for ( i = 0; i < WB_SEL_WIDTH; i = i + 1 ) begin
            if ( wb_stb_i & wb_we_i & wb_sel_i[i] ) begin
                for ( j = 0; j < 8; j = j + 1 ) begin
                    if ( !readonly_mask[i*8+j] & (i*8+j < DATA_WIDTH) ) begin
                        reg_data_next[i*8+j] = wb_dat_i[i*8+j];
                    end
                end
            end
        end
        
        // data
        for ( i = 0; i < DATA_WIDTH; i = i + 1 ) begin
            if ( data_we[i] ) begin
                reg_data_next[i] = data_in[i];
            end
        end
    end
    
    assign wb_dat_o = wb_stb_i ? reg_data_next : {WB_DAT_WIDTH{1'b0}};
    assign wb_ack_o = wb_stb_i;
    
endmodule


`default_nettype wire


// end of file
