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



module jelly_cpu_muldiv
        #(
            parameter                           DATA_WIDTH = 32,
            parameter                           MUL_CYCLE  = 0
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire                        op_mul,
            input   wire                        op_div,
            input   wire                        op_mthi,
            input   wire                        op_mtlo,
            input   wire                        op_signed,
            
            input   wire    [DATA_WIDTH-1:0]    in_data0,
            input   wire    [DATA_WIDTH-1:0]    in_data1,
            
            output  wire    [DATA_WIDTH-1:0]    out_hi,
            output  wire    [DATA_WIDTH-1:0]    out_lo,
            
            output  wire                        busy
        );
    
    generate
    if ( MUL_CYCLE== 0 ) begin
        // MUL
        reg signed  [DATA_WIDTH:0]          mul_in_data0;
        reg signed  [DATA_WIDTH:0]          mul_in_data1;
        wire signed [(DATA_WIDTH*2)-1:0]    mul_out_data;
        
        always @ ( posedge clk ) begin
            if ( op_mul ) begin
                mul_in_data0[DATA_WIDTH]     <= op_signed ? in_data0[DATA_WIDTH-1] : 1'b0;
                mul_in_data1[DATA_WIDTH]     <= op_signed ? in_data1[DATA_WIDTH-1] : 1'b0;
                mul_in_data0[DATA_WIDTH-1:0] <= in_data0;
                mul_in_data1[DATA_WIDTH-1:0] <= in_data1;
            end
        end
        assign mul_out_data = mul_in_data0 * mul_in_data1;
        

        // DIV
        wire                            div_out_en;
        wire    [DATA_WIDTH-1:0]        div_out_remainder;
        wire    [DATA_WIDTH-1:0]        div_out_quotient;
        jelly_cpu_divider
            i_cpu_divider
                (
                    .reset              (reset),
                    .clk                (clk),
                    
                    .op_div             (op_div),
                    .op_signed          (op_signed),
                    .op_set_remainder   (op_mthi),
                    .op_set_quotient    (op_mtlo),
                    
                    .in_data0           (in_data0),
                    .in_data1           (in_data1),
                    
                    .out_en             (div_out_en),
                    .out_remainder      (div_out_remainder),
                    .out_quotient       (div_out_quotient),
                    
                    .busy               (busy)
                );
        
        
        // switch
        reg                             reg_mul_hi;
        reg                             reg_mul_lo;
        always @ ( posedge clk ) begin
            if ( reset ) begin
                reg_mul_hi <= 1'b0;
                reg_mul_lo <= 1'b0;
            end
            else begin
                if ( op_mul ) begin
                    reg_mul_hi <= 1'b1;
                    reg_mul_lo <= 1'b1;
                end
                else begin
                    if ( op_div | op_mthi ) begin
                        reg_mul_hi <= 1'b0;
                    end
                    if ( op_div | op_mtlo ) begin
                        reg_mul_lo <= 1'b0;
                    end             
                end
            end
        end
        
        assign out_hi = reg_mul_hi ? mul_out_data[63:32] : div_out_remainder;
        assign out_lo = reg_mul_lo ? mul_out_data[31:0]  : div_out_quotient;
    end
    else begin
        
        // MULT
        wire                            mul_out_en;
        wire    [DATA_WIDTH-1:0]        mul_out_hi;
        wire    [DATA_WIDTH-1:0]        mul_out_lo;
        wire                            mul_out_busy;
        jelly_cpu_multiplier
                #(
                    .DATA_WIDTH         (DATA_WIDTH),
                    .CYCLE              (MUL_CYCLE)
                )
            i_cpu_multiplier
                (
                    .reset              (reset),
                    .clk                (clk),
                    
                    .op_mul             (op_mul),
                    .op_signed          (op_signed),

                    .in_data0           (in_data0),
                    .in_data1           (in_data1),

                    .out_en             (mul_out_en),
                    .out_hi             (mul_out_hi),
                    .out_lo             (mul_out_lo),

                    .busy               (mul_out_busy)
                );
        
        // DIV
        wire                            div_out_en;
        wire    [DATA_WIDTH-1:0]        div_out_remainder;
        wire    [DATA_WIDTH-1:0]        div_out_quotient;
        wire                            div_out_busy;
        jelly_cpu_divider
            i_cpu_divider
                (
                    .reset              (reset),
                    .clk                (clk),
                    
                    .op_div             (op_div),
                    .op_signed          (op_signed),
                    .op_set_remainder   (1'b0),
                    .op_set_quotient    (1'b0),
                    
                    .in_data0           (in_data0),
                    .in_data1           (in_data1),
                    
                    .out_en             (div_out_en),
                    .out_remainder      (div_out_remainder),
                    .out_quotient       (div_out_quotient),
                    
                    .busy               (div_out_busy)
                );
        
        // register
        reg                         reg_busy;
        reg     [DATA_WIDTH-1:0]    reg_hi;
        reg     [DATA_WIDTH-1:0]    reg_lo;
        always @ ( posedge clk ) begin
            if ( reset ) begin
                reg_busy <= 1'b0;
                reg_hi   <= {DATA_WIDTH{1'bx}};
                reg_lo   <= {DATA_WIDTH{1'bx}};
            end
            else begin
                // busy
                if ( !reg_busy ) begin
                    reg_busy <= (op_mul & !mul_out_en) | (op_div & !div_out_en);
                end
                else if ( mul_out_en | div_out_en ) begin
                    reg_busy <= 1'b0;
                end
                    
                // hi
                if ( op_mthi ) begin
                    reg_hi <= in_data0;
                end
                else if ( mul_out_en ) begin
                    reg_hi <= mul_out_hi;
                end
                else if ( div_out_en ) begin
                    reg_hi <= div_out_remainder;
                end
                    
                // lo
                if ( op_mtlo ) begin
                    reg_lo <= in_data0;
                end
                else if ( mul_out_en ) begin
                    reg_lo <= mul_out_lo;
                end
                else if ( div_out_en ) begin
                    reg_lo <= div_out_quotient;
                end
            end
        end
        
        assign out_hi = reg_hi;
        assign out_lo = reg_lo;
        assign busy   = reg_busy;   // mul_out_busy | div_out_busy;
    end
    endgenerate
    
endmodule



`default_nettype wire



// end of file

