//testbench for debugging UART program loader

`timescale 1ns / 100 ps

module mfp_uart_testbench;

    reg         uart_clock;
    reg         clock;
    reg         reset_n;
    reg         uart_rx;
    wire [7:0]  byte_data;
    wire        byte_ready;

    wire        in_progress;
    wire        format_error;
    wire        checksum_error;
    wire [ 7:0] error_location;

    wire [31:0] write_address;
    wire [ 7:0] write_byte;
    wire        write_enable;
        
    wire [31:0] HADDR;
    wire [ 2:0] HBURST;
    wire        HMASTLOCK;
    wire [ 3:0] HPROT;
    wire [ 2:0] HSIZE;
    wire [ 1:0] HTRANS;
    wire [31:0] HWDATA;
    wire        HWRITE;

    reg  [ 1:0] HTRANS_old;

    //-----------------------------------------------------

    mfp_uart_receiver 
    # (
        .clock_cycles_in_symbol(20)
    )
    rcvr
    (
        .clock      (   clock       ),
        .reset_n    (   reset_n     ),
        .rx         (   uart_rx     ),
        .byte_data  (   byte_data   ),
        .byte_ready (   byte_ready  )
    );

    mfp_srec_parser mfp_srec_parser
    (
        .clock          ( clock          ),
        .reset_n        ( reset_n        ),

        .char_data      ( byte_data      ),
        .char_ready     ( byte_ready     ),

        .in_progress    ( in_progress    ),
        .format_error   ( format_error   ),
        .checksum_error ( checksum_error ),
        .error_location ( error_location ),

        .write_address  ( write_address  ),
        .write_byte     ( write_byte     ),
        .write_enable   ( write_enable   )
    );

    mfp_srec_parser_to_ahb_lite_bridge
    mfp_srec_parser_to_ahb_lite_bridge
    (
        .clock          ( clock          ),
        .reset_n        ( reset_n        ),
        .big_endian     ( 0              ), //ignored

        .write_address  ( write_address  ),
        .write_byte     ( write_byte     ),
        .write_enable   ( write_enable   ),

        .HADDR          ( HADDR          ),
        .HBURST         ( HBURST         ),
        .HMASTLOCK      ( HMASTLOCK      ),
        .HPROT          ( HPROT          ),
        .HSIZE          ( HSIZE          ),
        .HTRANS         ( HTRANS         ),
        .HWDATA         ( HWDATA         ),
        .HWRITE         ( HWRITE         )
    );

    //-----------------------------------------------------

    initial begin
        clock = 0;
        forever # 5 clock = ~clock;
    end

    initial begin
        reset_n     <= 1;
        repeat (10)  @(posedge clock);
        reset_n     <= 0;
        repeat (20)  @(posedge clock);
        reset_n     <= 1;
    end

    initial begin
        uart_clock = 0;
        forever # 100 uart_clock = ~uart_clock;
    end

    //-----------------------------------------------------

    initial begin
        //init
        @(negedge reset_n);
        uart_rx = 1;
        @(posedge reset_n);

        //action
        repeat (300)  @(posedge clock);

        uartTransmit;

        repeat (20)  @(posedge clock);
        $stop;
    end

    //-----------------------------------------------------

    integer cycle; initial cycle = 0;


    always @ (posedge clock)
    begin
        cycle = cycle + 1;
        HTRANS_old <= HTRANS;

        if(write_enable) begin
             $display ("%5d write_address %h write_byte %h",
                     cycle, write_address,   write_byte);
        end

        if(HTRANS_old != 0) begin
            $display ("%5d HTRANS %b HSIZE %b HADDR %h HWDATA %h",
                    cycle, HTRANS,   HSIZE,   HADDR,   HWDATA);
        end
    end

    //-----------------------------------------------------

    task uartTransmit;

        parameter dataSize  = 200;
        integer i;
        integer file, char;
        begin
            file = $fopen("program.rec", "rb");
                        
            for (i = 0; i < dataSize; i = i + 1) begin
                char = $fgetc(file);

                @(posedge uart_clock);   uart_rx = 0;            //start bit
                @(posedge uart_clock);   uart_rx = char[0];
                @(posedge uart_clock);   uart_rx = char[1];
                @(posedge uart_clock);   uart_rx = char[2];
                @(posedge uart_clock);   uart_rx = char[3];
                @(posedge uart_clock);   uart_rx = char[4];
                @(posedge uart_clock);   uart_rx = char[5];
                @(posedge uart_clock);   uart_rx = char[6];
                @(posedge uart_clock);   uart_rx = char[7];
                @(posedge uart_clock);   uart_rx = 1;            //stop bit
            end

            uart_rx = 1;
        end
    endtask

endmodule

