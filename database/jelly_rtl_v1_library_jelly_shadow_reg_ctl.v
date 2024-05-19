// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_shadow_reg_ctl
        #(
            parameter   INDEX_WIDTH = 1,
            parameter   INIT_INDEX  = {INDEX_WIDTH{1'b0}}
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            update_req,
            output  wire                            update_ack,
            output  wire    [INDEX_WIDTH-1:0]       index,
            
            input   wire                            core_reset,
            input   wire                            core_clk,
            input   wire                            core_acceptable,
            output  wire                            core_update
        );
    
    wire    [INDEX_WIDTH-1:0]   sig_index;
    
    (* ASYNC_REG = "true" *)    reg     [INDEX_WIDTH-1:0]   ff0_index;
    (* ASYNC_REG = "true" *)    reg     [INDEX_WIDTH-1:0]   ff1_index;
    (* ASYNC_REG = "true" *)    reg     [INDEX_WIDTH-1:0]   ff2_index;
    
    always @(posedge clk) begin
        if ( reset ) begin
            ff0_index <= INIT_INDEX;
            ff1_index <= INIT_INDEX;
            ff2_index <= INIT_INDEX;
        end
        else begin
            ff0_index <= sig_index;
            ff1_index <= ff0_index;
            ff2_index <= ff1_index;
        end
    end
    
    assign update_ack = (ff2_index[0] != ff1_index[0]);
    assign index      = ff1_index;
    
    
    
    (* ASYNC_REG = "true" *)    reg         ff0_update;
    (* ASYNC_REG = "true" *)    reg         ff1_update;
    always @(posedge core_clk) begin
        if ( core_reset ) begin
            ff0_update <= 1'b0;
            ff1_update <= 1'b0;
        end
        else begin
            ff0_update <= update_req;
            ff1_update <= ff0_update;
        end
    end
    
    reg     [INDEX_WIDTH-1:0]   reg_index;
    always @(posedge core_clk) begin
        if ( core_reset ) begin
            reg_index <= INIT_INDEX;
        end
        else begin
            if ( core_acceptable && ff1_update ) begin
                reg_index <= reg_index + 1'b1;
            end
        end
    end
    
    assign core_update = (core_reset || (core_acceptable && ff1_update));
    assign sig_index   = reg_index;
    
endmodule



`default_nettype wire


// end of file
