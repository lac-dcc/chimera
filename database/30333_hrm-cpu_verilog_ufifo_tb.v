// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`default_nettype none

module ufifo_tb;
    // generic signals
    reg        clk     = 0;
    reg        i_rst   = 0;

    // Simulate clock
    always #1 clk = ~clk;

    // Instanciate DUT
    // ---------------------------------------- //
    // INBOX (FIFO)
    //
    reg               INBOX_i_wr = 0;
    reg  signed [7:0] INBOX_i_data = 0;
    reg               INBOX_i_rd = 0;
    reg               INBOX_i_rst = 0;
    wire signed [7:0] INBOX_o_data;
    wire              INBOX_empty_n;
    wire              INBOX_full;
    // dump ports
    wire        [4:0] INBOX_i_dmp_pos;
    wire        [7:0] INBOX_o_dmp_data; 
    wire              INBOX_o_dmp_valid; 

    ufifo #(.LGFLEN(4'd5), .RXFIFO(1)) INBOX (
        // write port (push)
        .i_wr(INBOX_i_wr),
        .i_data(INBOX_i_data),
        // read port (pop)
        .i_rd(INBOX_i_rd),
        .o_data(INBOX_o_data),
        // flags
        .o_empty_n( INBOX_empty_n ), // not empty
        .o_err( INBOX_full ), // overflow aka full, CPU output pin
        // .o_status(),
        // dump ports
        .i_dmp_pos(INBOX_i_dmp_pos),     // dump position in queue
        .o_dmp_data(INBOX_o_dmp_data),   // value at dump position
        .o_dmp_valid(INBOX_o_dmp_valid), // i_dmp_pos is valid 
        // clk, rst
        .i_rst(INBOX_i_rst),
        .i_clk(clk)
    );    
    // ---------------------------------------- //

    integer i;

    integer x,y;

    // Start simulation
    initial begin

        $dumpfile(  "ufifo_tb.vcd");
        $dumpvars(0, ufifo_tb);

        // push some values
        for (i = 0; i<8; i=i+1) begin
            #2  INBOX_i_data = i;
            #2  INBOX_i_wr = 1;
            #2  INBOX_i_wr = 0;
        end

        // pop some values
        for (i = 0; i<4; i=i+1) begin
            #2  INBOX_i_rd = 1;
            #2  INBOX_i_rd = 0;
        end

        // push some values
        for (i = 0; i<20; i=i+1) begin
            #2  INBOX_i_data = i;
            #2  INBOX_i_wr = 1;
            #2  INBOX_i_wr = 0;
        end

        #2  INBOX_i_rd = 1;
        #2  INBOX_i_rd = 0;

        for (y = 0; y<480; y=y+1) begin
            for (x = 0; x<640; x=x+1) begin
                #2 ;
            end
        end

        #1000 $finish;
    end

    reg         show_digit_i2;
    reg [9:0]   px_x0, px_y0;
    reg [9:0]   px_x1, px_y1;
    reg [9:0]   px_x2, px_y2;
    reg [1:0]   digit_sel_i2;

    always @( posedge clk) begin
        px_y0 <= y;
        px_x0 <= x;
        { px_x1, px_y1 } <= { px_x0, px_y0 };
        { px_x2, px_y2 } <= { px_x2, px_y2 };
        show_digit_i2 <= show_digit_i1;
    end

    // instantiate font ROM
    wire [10:0] rom_addr;
    wire        font_bit2;
    font font0 (
        .i_clk(clk),
        .i_addr(rom_addr),
        .i_bit(~bit_addr),
        .o_data(font_bit2)
    );
    assign rom_addr = {char_addr, row_addr};

    //-------------------------------------------
    // Inbox region on  screen
    //-------------------------------------------
    wire        inbox_on1; // do we show Inbox?
    wire [7:0]  char_addr_i;
    wire [2:0]  row_addr_i;
    wire [2:0]  bit_addr_i;

    assign inbox_on1 = ( px_y1[9:3] == 1 ) || ( px_y1[9:3] == 2 ) ;   // line 1 or line 2
    assign row_addr_i = px_y1[2:0];
    assign bit_addr_i = px_x1[2:0];

    wire [1:0]  digit_sel_i;
    assign digit_sel_i = px_x1[4:3];

    // we get the data at that position in the Inbox FIFO

    assign INBOX_i_dmp_pos=px_x0[9:5] - 5'd 2 + ( ( px_y0[9:3] == 2 ) ? 5'd 16 : 5'd 0 ) ; // if 2nd line, we add 16, we use px_y0 here!

    wire show_digit_i1 = inbox_on1 &&                       // we're on an "inbox" line on screen
        ( digit_sel_i == 2'd1 || digit_sel_i == 2'd2 ) &&   // we're on a meaningful digit
        INBOX_o_dmp_valid &&                                // there's valid data at that position in INBOX
        ( px_x1[9:3] >= 8 ) ;                               // it's a valid position we want to show

    hex_to_ascii_digit hex_to_ascii_inbox(
        .data( INBOX_o_dmp_data ),
        .sel( digit_sel_i ),
        .o_ascii_code( char_addr_i )
    );

    //-------------------------------------------

    //-------------------------------------------
    // mux for font ROM addresses (on clock cycle 1)
    //-------------------------------------------
    reg [7:0] char_addr;
    reg [2:0] row_addr;
    reg [2:0] bit_addr;

    always @*
    begin
        if (inbox_on1)
            begin
                char_addr = char_addr_i;
                row_addr = row_addr_i;
                bit_addr = bit_addr_i;
            end
        else
            begin
                char_addr = 0;
                row_addr = 0;
                bit_addr = 0;
            end
    end

    //-------------------------------------------
    // mux for rgb  (on clock cycle 2) 
    //-------------------------------------------
    reg [2:0] text_rgb;
    always @*
    begin
        text_rgb = 3'b110;  // background, yellow
        if (show_digit_i2)
            begin
                if (font_bit2)
                    text_rgb = 3'b001;
            end
        // else
        //     begin
        //     if (font_bit2)
        //         text_rgb = 3'b001;
        //     end
    end      

endmodule

module hex_to_ascii_digit(data, sel, o_ascii_code);
    // module ports
    input  wire [7:0] data;
    input  wire [1:0] sel;
    output reg [7:0] o_ascii_code;


    reg [3:0] hex_digit;
    always @(*)
    case (sel)
        2'd1: hex_digit = data[7:4];
        2'd2: hex_digit = data[3:0];
        default: hex_digit = 4'h x; // don't care...
    endcase

    reg [7:0] ascii_code;
    always @(*)
    case (hex_digit)
        4'h0: ascii_code = 8'h30;
        4'h1: ascii_code = 8'h31;
        4'h2: ascii_code = 8'h32;
        4'h3: ascii_code = 8'h33;
        4'h4: ascii_code = 8'h34;
        4'h5: ascii_code = 8'h35;
        4'h6: ascii_code = 8'h36;
        4'h7: ascii_code = 8'h37;
        4'h8: ascii_code = 8'h38;
        4'h9: ascii_code = 8'h39;
        4'hA: ascii_code = 8'h41;
        4'hB: ascii_code = 8'h42;
        4'hC: ascii_code = 8'h43;
        4'hD: ascii_code = 8'h44;
        4'hE: ascii_code = 8'h45;
        4'hF: ascii_code = 8'h46;
        default: ascii_code = 8'h xx; // don't care...
    endcase

    always @(*)
    case (sel)
        2'd1: o_ascii_code = ascii_code;
        2'd2: o_ascii_code = ascii_code;
        default: o_ascii_code = 8'h xx; // don't care...
    endcase

endmodule
