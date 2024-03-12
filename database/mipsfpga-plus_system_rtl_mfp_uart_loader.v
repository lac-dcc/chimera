
module mfp_uart_loader
(
    input             HCLK,
    input             HRESETn,
    output     [31:0] loader_HADDR,
    output     [ 2:0] loader_HBURST,
    output            loader_HMASTLOCK,
    output     [ 3:0] loader_HPROT,
    output     [ 2:0] loader_HSIZE,
    output     [ 1:0] loader_HTRANS,
    output     [31:0] loader_HWDATA,
    output            loader_HWRITE,

    input             UART_RX,

    output            loader_Busy
);

    wire [7:0] char_data;
    wire       char_ready;

    mfp_uart_receiver mfp_uart_receiver
    (
        .clock      ( HCLK       ),
        .reset_n    ( HRESETn    ),
        .rx         ( UART_RX    ),
        .byte_data  ( char_data  ),
        .byte_ready ( char_ready )
    );

    wire        format_error;
    wire        checksum_error;
    wire [ 7:0] error_location;

    wire [31:0] write_address;
    wire [ 7:0] write_byte;
    wire        write_enable;

    mfp_srec_parser mfp_srec_parser
    (
        .clock           ( HCLK             ),
        .reset_n         ( HRESETn          ),

        .char_data       ( char_data        ),
        .char_ready      ( char_ready       ), 

        .in_progress     ( loader_Busy      ),
        .format_error    ( format_error     ),
        .checksum_error  ( checksum_error   ),
        .error_location  ( error_location   ),

        .write_address   ( write_address    ),
        .write_byte      ( write_byte       ),
        .write_enable    ( write_enable     )
    );

    mfp_srec_parser_to_ahb_lite_bridge ahb_lite_bridge
    (
        .clock          ( HCLK             ),
        .reset_n        ( HRESETn          ),
    
        .write_address  ( write_address    ),
        .write_byte     ( write_byte       ),
        .write_enable   ( write_enable     ), 
    
        .HADDR          ( loader_HADDR     ),
        .HBURST         ( loader_HBURST    ),
        .HMASTLOCK      ( loader_HMASTLOCK ),
        .HPROT          ( loader_HPROT     ),
        .HSIZE          ( loader_HSIZE     ),
        .HTRANS         ( loader_HTRANS    ),
        .HWDATA         ( loader_HWDATA    ),
        .HWRITE         ( loader_HWRITE    )
    );

endmodule
