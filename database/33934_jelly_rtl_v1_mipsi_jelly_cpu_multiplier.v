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



// Multiplier
module jelly_cpu_multiplier
        #(
            parameter                           DATA_WIDTH = 32,
            parameter                           CYCLE      = 33
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire                        op_mul,
            input   wire                        op_signed,
            
            input   wire    [DATA_WIDTH-1:0]    in_data0,
            input   wire    [DATA_WIDTH-1:0]    in_data1,
            
            output  wire                        out_en,
            output  wire    [DATA_WIDTH-1:0]    out_hi,
            output  wire    [DATA_WIDTH-1:0]    out_lo,
            
            output  wire                        busy
        );
    
    
    
    wire    signed  [DATA_WIDTH:0]          signed_data0;
    wire    signed  [DATA_WIDTH:0]          signed_data1;
    
    assign signed_data0[DATA_WIDTH]     = op_signed ? in_data0[DATA_WIDTH-1] : op_signed;
    assign signed_data0[DATA_WIDTH-1:0] = in_data0[DATA_WIDTH-1:0];
    assign signed_data1[DATA_WIDTH]     = op_signed ? in_data1[DATA_WIDTH-1] : op_signed;
    assign signed_data1[DATA_WIDTH-1:0] = in_data1[DATA_WIDTH-1:0];
    
    
    generate
    genvar      i;
    if ( CYCLE ==0 ) begin
        // multiplier
        assign {out_hi, out_lo} = signed_data0 * signed_data1;
        assign out_en           = op_mul;
        assign busy             = 1'b0;
    end
    else if ( CYCLE < 2 ) begin
        // pipelined multiplier
        reg     [(DATA_WIDTH*2)-1:0]    reg_out_data    [0:CYCLE-1];
        integer                         j;
        always @ ( posedge clk ) begin
            reg_out_data[0] <= signed_data0 * signed_data1;
            for ( j = 1; j < CYCLE; j = j + 1 ) begin
                reg_out_data[j] <= reg_out_data[j-1];
            end
        end
        assign {out_hi, out_lo} = reg_out_data[CYCLE-1];
        
        // busy control
        reg                         reg_out_en;
        reg     [CYCLE-1:0]         reg_busy;
        wire    [CYCLE-1:0]         next_busy;
        assign next_busy = (reg_busy >> 1);
        always @ ( posedge clk ) begin
            if ( reset ) begin
                reg_busy   <= {CYCLE{1'b0}};
                reg_out_en <= 1'b0;
            end
            else begin
                if ( op_mul ) begin
                    reg_busy <= {CYCLE{1'b1}};
                end
                else begin
                    reg_busy <= next_busy;
                end
                
                reg_out_en <= reg_busy[0] & !next_busy[0];
            end
        end
        assign out_en = reg_out_en;
        assign busy   = reg_busy[0];
    end
    else begin
        // adder multiplier
        reg                                     reg_busy;
        reg                                     reg_negative;
        reg     [DATA_WIDTH-1:0]                reg_in_data0;
        reg     [(DATA_WIDTH*2)-1:0]            reg_in_data1;
        reg     [(DATA_WIDTH*2)-1:0]            reg_out_data;
        
        always @ ( posedge clk ) begin
            if ( reset ) begin
                reg_busy     <= 1'b0;
                reg_negative <= 1'bx;
                reg_in_data0 <= {(DATA_WIDTH){1'bx}};
                reg_in_data1 <= {(DATA_WIDTH*2){1'bx}};
                reg_out_data <= {(DATA_WIDTH*2){1'bx}};
            end
            else begin
                if ( !reg_busy ) begin
                    if ( op_mul ) begin
                        // start
                        reg_busy                                <= 1'b1;
                        reg_negative                            <= op_signed & (in_data0[DATA_WIDTH-1] ^ in_data1[DATA_WIDTH-1]);
                        reg_in_data0                            <= op_signed & in_data0[DATA_WIDTH-1] ? -signed_data0 : signed_data0;
                        reg_in_data1[DATA_WIDTH-1:0]            <= op_signed & in_data1[DATA_WIDTH-1] ? -signed_data1 : signed_data1;
                        reg_in_data1[DATA_WIDTH*2-1:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        reg_out_data                            <= {(DATA_WIDTH*2){1'b0}};
                    end
                    else begin
                        // idle
                        reg_busy     <= reg_busy;
                        reg_negative <= 1'bx;
                        reg_in_data0 <= {DATA_WIDTH{1'bx}};
                        reg_in_data1 <= {(DATA_WIDTH*2){1'bx}};
                        reg_out_data <= {(DATA_WIDTH*2){1'bx}};
                    end
                end
                else begin
                    if ( reg_in_data0[DATA_WIDTH-1:0] == 0 ) begin
                        reg_busy   <= 1'b0;
                    end
                    reg_negative <= reg_negative;
                    reg_in_data0 <= (reg_in_data0 >> 1);
                    reg_in_data1 <= (reg_in_data1 << 1);
                    if ( reg_in_data0[0] ) begin
                        reg_out_data <= reg_out_data + reg_in_data1;
                    end
                end
            end
        end
        
        assign out_en           = reg_busy & (reg_in_data0[DATA_WIDTH-1:0] == 0);
        assign {out_hi, out_lo} = reg_negative ? -reg_out_data : reg_out_data;
        assign busy             = reg_busy;
    end
    endgenerate
    
endmodule



`default_nettype wire



// end of file

