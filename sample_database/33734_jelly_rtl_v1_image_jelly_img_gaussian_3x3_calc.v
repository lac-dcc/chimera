// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_gaussian_3x3_calc
        #(
            parameter   USER_WIDTH     = 0,
            parameter   DATA_WIDTH     = 8,
            parameter   OUT_DATA_WIDTH = DATA_WIDTH,
            
            // local
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            enable,
            
            input   wire    [3*3*DATA_WIDTH-1:0]    in_data,
            
            output  wire    [OUT_DATA_WIDTH-1:0]    out_data
        );
    
    wire    [DATA_WIDTH+3:0]    in_data00 = in_data[(3*0+0)*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH+3:0]    in_data01 = in_data[(3*0+1)*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH+3:0]    in_data02 = in_data[(3*0+2)*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH+3:0]    in_data10 = in_data[(3*1+0)*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH+3:0]    in_data11 = in_data[(3*1+1)*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH+3:0]    in_data12 = in_data[(3*1+2)*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH+3:0]    in_data20 = in_data[(3*2+0)*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH+3:0]    in_data21 = in_data[(3*2+1)*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH+3:0]    in_data22 = in_data[(3*2+2)*DATA_WIDTH +: DATA_WIDTH];
    
    reg     [DATA_WIDTH+3:0]    st0_data0;
    reg     [DATA_WIDTH+3:0]    st0_data1;
    reg     [DATA_WIDTH+3:0]    st0_data2;
    reg     [DATA_WIDTH+3:0]    st0_data3;
    reg     [DATA_WIDTH+3:0]    st0_data;
    
    reg     [DATA_WIDTH+3:0]    st1_data0;
    reg     [DATA_WIDTH+3:0]    st1_data1;
    reg     [DATA_WIDTH+3:0]    st1_data;
    
    reg     [DATA_WIDTH+3:0]    st2_data0;
    reg     [DATA_WIDTH+3:0]    st2_data;
    
    reg     [DATA_WIDTH+3:0]    st3_data;
    
    always @(posedge clk) begin
        if ( cke ) begin
            // stage0
            st0_data0   <= (in_data00 + in_data22);
            st0_data1   <= (in_data20 + in_data02);
            st0_data2   <= (in_data01 + in_data21) << 1;
            st0_data3   <= (in_data10 + in_data12) << 1;
            st0_data    <= in_data11 << 2;
            
            // stage1
            st1_data0   <= st0_data0 + st0_data1;
            st1_data1   <= st0_data2 + st0_data3;
            st1_data    <= st0_data;
            
            // stage2
            st2_data0   <= st1_data0 + st1_data1;
            st2_data    <= st1_data;
            
            // stage3
            if ( enable ) begin
                st3_data <= st2_data + st2_data0;
            end
            else begin
                st3_data <= st2_data << 2;
            end
        end
    end
    
    assign out_data = (4 + DATA_WIDTH >= OUT_DATA_WIDTH) ? st3_data >> (4 + DATA_WIDTH - OUT_DATA_WIDTH) :
                                                           st3_data << (OUT_DATA_WIDTH - 4 - DATA_WIDTH);
    
endmodule


`default_nettype wire


// end of file
