// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// shift register lookup table
module jelly_data_shift_register_lut
        #(
            parameter   SEL_WIDTH  = 5,
            parameter   NUM        = (1 << SEL_WIDTH),
            parameter   DATA_WIDTH = 8,
            parameter   DEVICE     = "RTL"
        )
        (
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [SEL_WIDTH-1:0]     sel,
            input   wire    [DATA_WIDTH-1:0]    in_data,
            output  wire    [DATA_WIDTH-1:0]    out_data
        );
    
    genvar      i;
    
    generate
`ifndef VERILATOR
    if ( SEL_WIDTH <= 5
            && (DEVICE == "SPARTAN6"
             || DEVICE == "VIRTEX6"
             || DEVICE == "7SERIES"
             || DEVICE == "ULTRASCALE"
             || DEVICE == "ULTRASCALE_PLUS_ES1"
             || DEVICE == "ULTRASCALE_PLUS_ES2") ) begin : xilinx_srlc32e
        
        for ( i = 0; i < DATA_WIDTH; i = i+1 ) begin : loop_shift
            // XILINX
            wire    [4:0]   a = sel;
            SRLC32E
                    #(
                        .INIT   (32'h00000000)
                    )
                i_srlc32e
                    (
                        .Q      (out_data[i]),
                        .Q31    (),
                        .A      (a),
                        .CE     (cke),
                        .CLK    (clk),
                        .D      (in_data[i])
                    );
        end
    end
`else
    if (0) begin end 
`endif
    else begin : blk_rtl
        // RTL
        reg     [NUM*DATA_WIDTH-1:0]    reg_data;
        always @(posedge clk) begin
            if ( cke ) begin
                reg_data <= {reg_data, in_data};
            end
        end
        
        assign out_data = reg_data[sel*DATA_WIDTH +: DATA_WIDTH];
    end
    endgenerate
    
    
endmodule



`default_nettype wire


// end of file
