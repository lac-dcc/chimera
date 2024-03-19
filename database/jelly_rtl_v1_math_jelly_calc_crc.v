
// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   reciprocal
//
//                                 Copyright (C) 2008-2022 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// CRC
module jelly_calc_crc
        #(
            parameter   DATA_WIDTH      = 8,
            parameter   CRC_WIDTH       = 32,
            parameter   REPRESENTATIONS = 32'hEDB88320
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,

            input   wire                        in_update,
            input   wire    [DATA_WIDTH-1:0]    in_data,
            input   wire                        in_valid,
            
            input   wire    [CRC_WIDTH-1:0]     out_crc
        );
    
    localparam TABLE_SIZE = (1 << DATA_WIDTH);

    reg     [CRC_WIDTH-1:0]     crc_table[0:TABLE_SIZE-1];

    integer                     i, j;
    reg     [CRC_WIDTH-1:0]     c;

    initial begin
        for ( i = 0; i < TABLE_SIZE; i = i+1 ) begin
            c = i;
            for ( j = 0; j < DATA_WIDTH; j = j+1 ) begin
                c = (c & 1) ? (REPRESENTATIONS ^ (c >> 1)) : (c >> 1);
            end
        end
        crc_table[i] = c;
    end

    reg     [CRC_WIDTH-1:0]     reg_crc;
    reg     [CRC_WIDTH-1:0]     tmp_crc;
    reg     [DATA_WIDTH-1:0]    tmp_index;

    always @(posedge clk) begin
        if ( reset ) begin
            reg_crc <= {CRC_WIDTH{1'b1}};
        end
        else if ( cke ) begin
            if ( in_valid ) begin
                tmp_crc    = in_update ? reg_crc : {CRC_WIDTH{1'b1}};
                tmp_index  = tmp_crc ^ in_data;
                reg_crc   <= crc_table[tmp_index] ^ (tmp_crc >> DATA_WIDTH);
            end
        end
    end

    assign out_crc = ~reg_crc;
    
endmodule


`default_nettype wire


// end of file
