// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    MIPS like CPU core
//
//                                  Copyright (C) 2008-2010 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



`define SHIFT_FUNC_SLL      2'b00
`define SHIFT_FUNC_SRL      2'b01
`define SHIFT_FUNC_SRA      2'b11


module jelly_cpu_shifter
        #(
            parameter                           SA_WIDTH   = 5,
            parameter                           DATA_WIDTH = (1 << SA_WIDTH)
        )
        (
            input   wire    [1:0]               op_func,
            
            input   wire    [DATA_WIDTH-1:0]    in_data,
            input   wire    [SA_WIDTH-1:0]      in_sa,
            
            output  wire    [DATA_WIDTH-1:0]    out_data
        );
    
    // shifter
    wire    [DATA_WIDTH-1:0]    data_extend;
    assign data_extend = op_func[1] ? {DATA_WIDTH{in_data[DATA_WIDTH-1]}} : {DATA_WIDTH{1'b0}};
    assign out_data    = op_func[0] ? ({data_extend, in_data} >> in_sa) : (in_data << in_sa);
    
endmodule



`default_nettype wire



// end of file
