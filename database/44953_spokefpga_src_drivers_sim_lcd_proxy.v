// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0


`timescale 1ns / 100ps

/*

Hackaday 2019 Badge LCD Proxy

Overview

    LCD Proxy

    Proxy responds the LCD signals as a cartoon version of the real one might.

    Most commands are ignored.

    Pixel data is available on the output for verification.

Invocation

    Usually you'll invoke the platform-wrapped version

    lcd #(
        ) l(
            .clock( clock ),
            .reset( reset ),

            .lcd_db(lcd_db),
            .lcd_rd(lcd_rd),
            .lcd_wr(lcd_wr),
            .lcd_rs(lcd_rs),
            .lcd_cs(lcd_cs),
            .lcd_id(lcd_id),
            .lcd_rst(lcd_rst),
            .lcd_fmark(lcd_fmark),
            .lcd_blen(lcd_blen)

            .lcd_out_x( x ),
            .lcd_out_y( y ),
            .lcd_out_p( p )
        );


*/

module lcd_proxy #(
        parameter Width = 480,
        parameter Height = 320,
        parameter CoordinateWidth = 9,
        parameter DataWidth = 18,
        parameter PixelWidth = 16,
        parameter PixelRedWidth = 5,
        parameter PixelGreenWidth = 6,
        parameter PixelBlueWidth = 5
    ) (
        input clock,
        input reset,

        //LCD interface
        input [DataWidth-1:0]  lcd_db,
        input                  lcd_rd,
        input                  lcd_wr,
        input                  lcd_rs,
        input                  lcd_cs,
        input                  lcd_rst,
        input                  lcd_blen,

        output                 lcd_fmark,
        output                 lcd_id,

        // Debug output
        output [DataWidth-1:0] lcd_out_data,
        output                 lcd_out_dc,
        output                 lcd_out_valid,

        output                 lcd_out_error,

        // Debug Access Port
        input [CoordinateWidth-1:0] lcd_out_x,
        input [CoordinateWidth-1:0] lcd_out_y,
        output[PixelWidth-1:0]      lcd_out_p,

        output [7:0] debug
    );

    localparam LCD_COMMAND = 0;
    localparam LCD_DATA = 1;

    localparam LCD_COMMAND_CODE_START      = 8'H11;
    localparam LCD_COMMAND_CODE_SET_COLUMN_ADDRESS = 8'H2A;
    localparam LCD_COMMAND_CODE_SET_PAGE_ADDRESS   = 8'H2B;
    localparam LCD_COMMAND_CODE_WRITE_MEMORY_START = 8'H2C;

    // we watch for this, then have a LONG snooze
    localparam LCD_COMMAND_START = 8'H11;

    localparam LCD_STATE_IDLE                     = 0,
               LCD_STATE_COMMAND                  = 1,
               LCD_STATE_SET_COLUMN_ADDRESS_X0_M  = 2,
               LCD_STATE_SET_COLUMN_ADDRESS_X0_L  = 3,
               LCD_STATE_SET_COLUMN_ADDRESS_X1_M  = 4,
               LCD_STATE_SET_COLUMN_ADDRESS_X1_L  = 5,
               LCD_STATE_SET_COLUMN_ADDRESS_Y0_M  = 6,
               LCD_STATE_SET_COLUMN_ADDRESS_Y0_L  = 7,
               LCD_STATE_SET_COLUMN_ADDRESS_Y1_M  = 8,
               LCD_STATE_SET_COLUMN_ADDRESS_Y1_L  = 9,
               LCD_STATE_WRITE_MEMORY_DATA        = 10;

    reg [3:0] lcd_proxy_state;

    reg [PixelWidth-1:0] buffer[0 : Height * Width -1];
    // reg [PixelWidth-1:0] buffer[Height-1:0][Width-1:0];

    reg lcd_proxy_wr_prev;

    reg [DataWidth-1:0] lcd_proxy_out_data;
    reg                 lcd_proxy_out_dc;
    reg                 lcd_proxy_out_valid;

    reg lcd_proxy_fmark;
    reg lcd_proxy_id;

    reg lcd_proxy_out_error;

    wire lcd_proxy_write_operation = ~lcd_proxy_wr_prev && lcd_wr;
    wire lcd_proxy_write_data_operation = lcd_proxy_write_operation && ( lcd_rs == LCD_DATA);

    reg [CoordinateWidth-1:0] rect_x0;
    reg [CoordinateWidth-1:0] rect_y0;
    reg [CoordinateWidth-1:0] rect_x1;
    reg [CoordinateWidth-1:0] rect_y1;

    reg [CoordinateWidth-1:0] lcd_proxy_x;
    reg [CoordinateWidth-1:0] lcd_proxy_y;

    always @( posedge clock ) begin
        if ( reset ) begin
            lcd_proxy_wr_prev <= 0;
            lcd_proxy_state <= LCD_STATE_IDLE;
            lcd_proxy_fmark <= 0;
            lcd_proxy_id <= 0;
            lcd_proxy_out_error <= 0;
            rect_x0 <= -1;
            rect_y0 <= -1;
            rect_x1 <= -1;
            rect_y1 <= -1;
            lcd_proxy_x <= 0;
            lcd_proxy_y <= 0;
        end else begin
            lcd_proxy_wr_prev <= lcd_wr;
            case ( lcd_proxy_state )
                LCD_STATE_IDLE: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( ~lcd_cs && ( lcd_rs == LCD_COMMAND ) && ( lcd_db == LCD_COMMAND_CODE_START ) )  begin
                                lcd_proxy_state <= LCD_STATE_COMMAND;
                            end
                        end
                    end
                LCD_STATE_COMMAND: begin
                        lcd_proxy_out_error <= 0;
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_COMMAND )  begin
                                case ( lcd_db )
                                    LCD_COMMAND_CODE_SET_COLUMN_ADDRESS: begin
                                            lcd_proxy_state <= LCD_STATE_SET_COLUMN_ADDRESS_X0_M;
                                        end
                                    LCD_COMMAND_CODE_SET_PAGE_ADDRESS: begin
                                            lcd_proxy_state <= LCD_STATE_SET_COLUMN_ADDRESS_Y0_M;
                                        end
                                    LCD_COMMAND_CODE_WRITE_MEMORY_START: begin
                                            lcd_proxy_state <= LCD_STATE_WRITE_MEMORY_DATA;
                                            lcd_proxy_x <= rect_x0;
                                            lcd_proxy_y <= rect_y0;
                                        end
                                endcase
                            end
                        end
                    end
                LCD_STATE_SET_COLUMN_ADDRESS_X0_M: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_DATA ) begin
                                rect_x0[CoordinateWidth-1:8] = lcd_db;
                                lcd_proxy_state <= LCD_STATE_SET_COLUMN_ADDRESS_X0_L;
                            end else begin
                                lcd_proxy_state <= LCD_STATE_COMMAND;
                                lcd_proxy_out_error <= 1;
                            end
                        end
                    end
                LCD_STATE_SET_COLUMN_ADDRESS_X0_L: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_DATA ) begin
                                rect_x0[7:0] = lcd_db;
                                lcd_proxy_state <= LCD_STATE_SET_COLUMN_ADDRESS_X1_M;
                            end else begin
                                lcd_proxy_state <= LCD_STATE_COMMAND;
                                lcd_proxy_out_error <= 1;
                            end
                        end
                    end
                LCD_STATE_SET_COLUMN_ADDRESS_X1_M: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_DATA ) begin
                                rect_x1[CoordinateWidth-1:8] = lcd_db;
                                lcd_proxy_state <= LCD_STATE_SET_COLUMN_ADDRESS_X1_L;
                            end else begin
                                lcd_proxy_state <= LCD_STATE_COMMAND;
                                lcd_proxy_out_error <= 1;
                            end
                        end
                    end
                LCD_STATE_SET_COLUMN_ADDRESS_X1_L: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_DATA ) begin
                                rect_x1[7:0] = lcd_db;
                            end else begin
                                lcd_proxy_out_error <= 1;
                            end
                            lcd_proxy_state <= LCD_STATE_COMMAND;
                        end
                    end
                LCD_STATE_SET_COLUMN_ADDRESS_Y0_M: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_DATA ) begin
                                rect_y0[CoordinateWidth-1:8] = lcd_db;
                                lcd_proxy_state <= LCD_STATE_SET_COLUMN_ADDRESS_Y0_L;
                            end else begin
                                lcd_proxy_state <= LCD_STATE_COMMAND;
                                lcd_proxy_out_error <= 1;
                            end
                        end
                    end
                LCD_STATE_SET_COLUMN_ADDRESS_Y0_L: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_DATA ) begin
                                rect_y0[7:0] = lcd_db;
                                lcd_proxy_state <= LCD_STATE_SET_COLUMN_ADDRESS_Y1_M;
                            end else begin
                                lcd_proxy_state <= LCD_STATE_COMMAND;
                                lcd_proxy_out_error <= 1;
                            end
                        end
                    end
                LCD_STATE_SET_COLUMN_ADDRESS_Y1_M: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_DATA ) begin
                                rect_y1[CoordinateWidth-1:8] = lcd_db;
                                lcd_proxy_state <= LCD_STATE_SET_COLUMN_ADDRESS_Y1_L;
                            end else begin
                                lcd_proxy_state <= LCD_STATE_COMMAND;
                                lcd_proxy_out_error <= 1;
                            end
                        end
                    end
                LCD_STATE_SET_COLUMN_ADDRESS_Y1_L: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_DATA ) begin
                                rect_y1[7:0] = lcd_db;
                            end else begin
                                lcd_proxy_out_error <= 1;
                            end
                            lcd_proxy_state <= LCD_STATE_COMMAND;
                        end
                    end
                LCD_STATE_WRITE_MEMORY_DATA: begin
                        if ( lcd_proxy_write_operation ) begin
                            if ( lcd_rs == LCD_DATA ) begin
                                // if ( ( lcd_proxy_x >= rect_x0 ) && ( lcd_proxy_x <= rect_x1 ) &&
                                //     ( lcd_proxy_y >= rect_y0 ) && ( lcd_proxy_y <= rect_y1 ) ) begin
                                    buffer[ lcd_proxy_y * Width + lcd_proxy_x ] <= lcd_db;
                                    //$display( "        Proxy Write [%3d,%3d] <= %x", lcd_proxy_x,  lcd_proxy_y, lcd_db );
                                //end
                                lcd_proxy_x <= lcd_proxy_x + 1;
                                if ( lcd_proxy_x == rect_x1 ) begin
                                    lcd_proxy_x <= rect_x0;
                                    lcd_proxy_y <= lcd_proxy_y + 1;
                                    if ( lcd_proxy_y == rect_y1 ) begin
                                        lcd_proxy_state <= LCD_STATE_COMMAND;
                                    end
                                end
                            end else begin
                                lcd_proxy_state <= LCD_STATE_COMMAND;
                                lcd_proxy_out_error <= 1;
                            end
                        end
                    end
            endcase
        end
    end

    assign lcd_out_data = lcd_proxy_out_data;
    assign lcd_out_dc = lcd_proxy_out_dc;
    assign lcd_out_valid = lcd_proxy_out_valid;

    assign lcd_out_error = lcd_proxy_out_error;

    //
    // Command & Data Echo
    //

    always @( posedge clock ) begin
        if ( reset ) begin
            lcd_proxy_out_valid <= 0;
            lcd_proxy_out_dc <= 0;
            lcd_proxy_out_data <= 0;
        end else begin
            if ( ~lcd_proxy_wr_prev && lcd_wr  ) begin
                lcd_proxy_out_dc <= lcd_rs;
                lcd_proxy_out_data <= lcd_db;
                lcd_proxy_out_valid <= 1;
            end else begin
                lcd_proxy_out_valid <= 0;
                lcd_proxy_out_dc <= 0;
                lcd_proxy_out_data <= 0;
            end
        end
    end

    //
    // Pixel Reader (combinatorial for easy sim read out)
    //

    initial begin
        for ( lcd_proxy_y = 0; lcd_proxy_y < Height; lcd_proxy_y = lcd_proxy_y + 1 )
            for ( lcd_proxy_x = 0; lcd_proxy_x < Width; lcd_proxy_x = lcd_proxy_x + 1 )
                buffer[ lcd_proxy_y * Width + lcd_proxy_x ] = 0;

    end

    reg [PixelWidth-1:0] lcd_proxy_out_p;
    // ... added the lcd_out_valid term because lcd_out_y and lcd_out_x == 0 didn't trigger it.
    always @(lcd_out_valid or lcd_out_y or lcd_out_x) begin
        lcd_proxy_out_p = ( lcd_blen) ? ( buffer[ lcd_out_y * Width + lcd_out_x ] ) : 0;
    end
    assign lcd_out_p = lcd_proxy_out_p;

endmodule

