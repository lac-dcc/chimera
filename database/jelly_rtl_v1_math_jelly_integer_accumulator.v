// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// アキュムレータ
module jelly_integer_accumulator
        #(
            parameter                           SIGEND            = 0,
            parameter                           ACCUMULATOR_WIDTH = 64,
            parameter                           DATA_WIDTH        = ACCUMULATOR_WIDTH,
            parameter                           UNIT_WIDTH        = 32,
            parameter   [ACCUMULATOR_WIDTH-1:0] INIT_VALUE        = {ACCUMULATOR_WIDTH{1'bx}}
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire                                set,
            input   wire                                add,
            output  wire                                busy,
            
            input   wire    [DATA_WIDTH-1:0]            data,
            
            output  wire    [ACCUMULATOR_WIDTH-1:0]     accumulator
        );
    
    localparam  UNIT_NUM  = (ACCUMULATOR_WIDTH + UNIT_WIDTH - 1) / UNIT_WIDTH;
    
    wire    signed  [UNIT_NUM*UNIT_WIDTH-1:0]   s_data  = $signed(data);
    wire            [UNIT_NUM*UNIT_WIDTH-1:0]   u_data  = SIGEND ? s_data : data;
    wire            [UNIT_NUM*UNIT_WIDTH-1:0]   in_data = (set || add) ? u_data : {ACCUMULATOR_WIDTH{1'b0}};
    
    integer                             i;
    reg     [UNIT_NUM-1:0]              reg_carry;
    reg     [UNIT_NUM*UNIT_WIDTH-1:0]   reg_accumulator;
    
    always @(posedge clk) begin
        if ( reset ) begin
            for ( i = 0; i < UNIT_NUM; i = i+1 ) begin
                reg_carry      [i]                          <= 1'b0;
                reg_accumulator[i*UNIT_WIDTH +: UNIT_WIDTH] <= (INIT_VALUE >> (i*UNIT_WIDTH));
            end
        end
        else if ( cke ) begin
            if ( set ) begin
                for ( i = 0; i < UNIT_NUM; i = i+1 ) begin
                    reg_carry      [i]                          <= 1'b0;
                    reg_accumulator[i*UNIT_WIDTH +: UNIT_WIDTH] <= in_data[i*UNIT_WIDTH +: UNIT_WIDTH];
                end
            end
            else begin
                {reg_carry[0], reg_accumulator[0*UNIT_WIDTH +: UNIT_WIDTH]} <= reg_accumulator[0*UNIT_WIDTH +: UNIT_WIDTH] + in_data[0*UNIT_WIDTH +: UNIT_WIDTH];
                for ( i = 1; i < UNIT_NUM; i = i+1 ) begin
                    {reg_carry[i], reg_accumulator[i*UNIT_WIDTH +: UNIT_WIDTH]} <= reg_accumulator[i*UNIT_WIDTH +: UNIT_WIDTH] + in_data[i*UNIT_WIDTH +: UNIT_WIDTH] + reg_carry[i-1];
                end
            end
        end
    end
    
    integer     j;
    reg         sig_busy;
    always @* begin
        sig_busy = 1'b0;
        for ( j = 0; j < UNIT_NUM-1; j = j+1 ) begin
            sig_busy = (sig_busy | reg_carry[j]);
        end
    end
    
    assign busy        = sig_busy;
    assign accumulator = reg_accumulator;
    
endmodule


`default_nettype wire


// end of file
