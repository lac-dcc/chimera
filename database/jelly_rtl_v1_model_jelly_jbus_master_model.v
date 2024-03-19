// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps



module jelly_jbus_master_model
        #(
            parameter   ADR_WIDTH  = 12,
            parameter   DAT_SIZE   = 2,     // 2^n (0:8bit, 1:16bit, 2:32bit ...)
            parameter   DAT_WIDTH  = (8 << DAT_SIZE),
            parameter   SEL_WIDTH  = (1 << DAT_SIZE),
            parameter   TABLE_FILE = "",
            parameter   TABLE_SIZE = 256
        )
        (
            // system
            input   wire                        clk,
            input   wire                        reset,
            
            // wishbone
            output  wire    [ADR_WIDTH-1:0]     m_wb_adr_o,
            output  wire    [DAT_WIDTH-1:0]     m_wb_dat_o,
            input   wire    [DAT_WIDTH-1:0]     m_wb_dat_i,
            output  wire                        m_wb_we_o,
            output  wire    [SEL_WIDTH-1:0]     m_wb_sel_o,
            output  wire                        m_wb_stb_o,
            input   wire                        m_wb_ack_i
        );
    
    
    integer     index;
    initial begin
        index = 0;
    end
    
    localparam DAT_POS     = 0;
    localparam SEL_POS     = DAT_POS + DAT_WIDTH;
    localparam ADR_POS     = SEL_POS + SEL_WIDTH;
    localparam WE_POS      = ADR_POS + ADR_WIDTH;
    localparam STB_POS     = WE_POS  + 1;
    localparam END_POS     = STB_POS + 1;
    localparam TABLE_WIDTH = END_POS + 1;
    
    reg     [TABLE_WIDTH-1:0]   test_table  [0:TABLE_SIZE-1];
    initial begin
        $readmemb(TABLE_FILE, test_table);
    end
    
    wire    [TABLE_WIDTH-1:0]   test_pattern;
    assign test_pattern = test_table[index];
    wire    [DAT_WIDTH-1:0]     test_dat;
    assign test_dat = test_pattern[DAT_POS +: DAT_WIDTH];
    
    
    assign m_wb_stb_o = test_pattern[STB_POS];
    assign m_wb_we_o  = test_pattern[WE_POS];
    assign m_wb_adr_o = test_pattern[ADR_POS +: ADR_WIDTH];
    assign m_wb_sel_o = test_pattern[SEL_POS +: SEL_WIDTH];
    assign m_wb_dat_o = test_dat; //m_wb_we_o ? test_table[index][DAT_POS +: DAT_WIDTH] : {DAT_WIDTH{1'bx}};
    
    function cmp_data;
    input   [DAT_WIDTH-1:0] dat;
    input   [DAT_WIDTH-1:0] exp;
    integer                 i;
    begin
        cmp_data = 1'b1;
        for ( i = 0; i < DAT_WIDTH; i = i + 1 ) begin
            if ( exp[i] !== 1'bx && !(dat[i] == exp[i]) ) begin
                cmp_data = 1'b0;
            end
        end
    end
    endfunction
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            index <= 0;
        end
        else begin
            if ( !m_wb_stb_o | m_wb_ack_i ) begin
                if ( !test_table[index][END_POS] ) begin
                    index <= index + 1;
                end
            end
            if ( !m_wb_we_o & m_wb_stb_o & m_wb_ack_i ) begin
                if ( !cmp_data(m_wb_dat_i, test_table[index][DAT_POS +: DAT_WIDTH]) ) begin
                    $display("%t read error", $time);
                end
            end
        end
    end
    
    
endmodule


// end of file
