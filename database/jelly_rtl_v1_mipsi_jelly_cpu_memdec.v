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



// memory access decoder
module jelly_cpu_memdec
        (
            input   wire    [31:0]      in_rdata,
            input   wire    [1:0]       in_size,
            input   wire                in_unsigned,
            input   wire    [3:0]       in_mask,
            input   wire    [1:0]       in_shift,
            input   wire    [31:0]      in_rt_data,
            
            output  wire    [31:0]      out_rdata
        );
        
    reg     [31:0]      tmp_rdata;
    
    always @* begin
        tmp_rdata = in_rdata;
        
        // rotation
        case ( in_shift )
        2'b00: tmp_rdata = tmp_rdata[31:0];
        2'b01: tmp_rdata = {tmp_rdata[7:0], tmp_rdata[31:8]};
        2'b10: tmp_rdata = {tmp_rdata[15:0], tmp_rdata[31:16]};
        2'b11: tmp_rdata = {tmp_rdata[23:0], tmp_rdata[31:24]};
        endcase
        
        // mask
        if ( !in_mask[0] ) begin tmp_rdata[7:0]   = in_rt_data[7:0];   end
        if ( !in_mask[1] ) begin tmp_rdata[15:8]  = in_rt_data[15:8];  end
        if ( !in_mask[2] ) begin tmp_rdata[23:16] = in_rt_data[23:16]; end
        if ( !in_mask[3] ) begin tmp_rdata[31:24] = in_rt_data[31:24]; end
        
        if ( in_size == 2'b00 ) begin
            // byte
            tmp_rdata[31:8]  = in_unsigned ? {24{1'b0}} : {24{tmp_rdata[7]}};
        end
        else if ( in_size == 2'b01 ) begin
            // harf-word
            tmp_rdata[31:16] = in_unsigned ? {16{1'b0}} : {16{tmp_rdata[15]}};
        end
    end
        
    assign out_rdata = tmp_rdata;
        
endmodule



`default_nettype wire



// end of file
