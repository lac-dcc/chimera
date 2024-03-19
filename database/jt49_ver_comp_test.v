`timescale 100ns/1ns

module test;

reg        clk;
reg        rstn, bdir, bc1;
wire [7:0] da, ioa, iob;
reg  [7:0] din;

assign da = bdir ? din : 8'hzz;

genvar i;

generate
    for( i=0; i<8; i=i+1) begin
        pullup pullup_ioa( ioa[i] );
        pullup pullup_iob( iob[i] );
        pullup pullupda  ( da [i] );
    end
endgenerate


initial begin
    rstn = 0;
    bdir = 1;
    #100 rstn = 1;
end

reg cen;

initial begin
    clk = 0;
    cen = 0;
    forever #(2.85/2) clk=~clk; // 1.75MHz
end

always @(posedge clk) cen<=~cen;

integer cntwait=10, cntcmd=0;
reg [9:0] cmdmem[0:4095];
wire [9:0] nextcmd = cmdmem[cntcmd];

initial begin
    $readmemh("cmd.hex",cmdmem);
end

always @(posedge clk) begin
    if( cntwait>0 ) begin
        cntwait <= cntwait-1;
        bc1     <= 0;
        bdir    <= 0;
    end else begin
        casez( nextcmd[9:8] )
            2'b0?: begin
                bdir    <= 1;
                bc1     <= nextcmd[8];
                din     <= cmdmem[cntcmd][7:0];
                cntwait <= 8;
            end
            2'b10: begin
                bdir <= 0;
                bc1  <= 0;
                cntwait <= { nextcmd[7:0], 8'd0 };
            end
            2'b11: $finish;
        endcase
        cntcmd <= cntcmd+1;
        if( cntcmd==4095 ) $finish;
    end
end

jt49_bus uut( // note that input ports are not multiplexed
    .rst_n      ( rstn          ),
    .clk        ( clk           ),    // signal on positive edge
    .clk_en     ( cen           ) /* synthesis direct_enable = 1 */,
    // bus control pins of original chip
    .bdir       ( bdir          ),
    .bc1        ( bc1           ),
    .din        ( din           ),

    .sel        ( 1'b1          ), // if sel is low, the clock is divided by 2
    .dout       (               ),
    .sound      (               ),  // combined channel output
    .A          (               ),      // linearised channel output
    .B          (               ),
    .C          (               ),

    .IOA_in     ( 8'd0          ),
    .IOA_out    (               ),

    .IOB_in     ( 8'd0          ),
    .IOB_out    (               )
);

ay_model u_model
(
    // clock & reset
    .clk        ( clk       ),   // Simple clock, AY outputs sound at clk/8 rate.
                             // For example: at 1.75 MHz clock, sound rate will be 218.75 kHz
    ._rst       ( rstn      ),  // Negative asynchronous reset. When _rst=0, chip is under reset.
                             // The reset will set all AY registers to zero,
                             // initialize phases of tone and noise generators,
                             // and initialize the phase of internal clk->clk/8 divider.
    // bus & control
    .da         ( da        ),    // 8 bit I/O bus
    //
    .bdir       ( bdir      ),  // Asynchronous bus control signals. The AY captures cmdmem for the internal registers from 'da' bus
    .bc2        ( 1'b1      ),   // by driving enables on internal latches asynchronously by these signals.
    .bc1        ( bc1       ),   // Short help on using those signals:
                             //
                             // {bdir, bc2, bc1} | bus operation
                             // -----------------+---------------
                             //      either of   | Select register (number is da[3:0]) for subsequent read or write.
                             //     0    0    1  | Selection only succeedes when da[7:4]==0,
                             //     1    0    0  | a8=1 and _a9=0, otherwise AY gets 'unselected',
                             //     1    1    1  | i.e. it won't react on subsequent reads or writes.
                             // -----------------+---------------
                             //     1    1    0  | write the contents of the 'da' bus into the previously selected AY register
                             // -----------------+---------------
                             //     0    1    1  | read contents of the previously selected AY register to the 'da' bus
                             // -----------------+---------------
                             // any other values | ignore anything on the bus and do not change selected register (idle state)
                          
    .a8         ( 1'b1      ),    // additional selection signals, see above
    ._a9        ( 1'b0      ),   //

    // gpio
    .ioa        ( ioa       ),   // bidirectional GPIO pins.
    .iob        ( iob       ),   // Unlike it is in real AY, there are no pullups on these pins.
                             // If you need some, try using 'tri1' instead of 'wire'
                             // for the signals that connect here.

    // test pins
    .test1      (           ), // outputs the frequency that drives envelope state machine,
                             // its frequency is Fclk/(16*envelope_period).

    .test2      ( 1'b0      ), // put here 1'b0 for normal work. Otherwise
                             // AY won't do any register reads or writes, while
                             // the register selections will still work.

    // sound outputs (see comments above)
    .ch_a       (           ),  // Logical sound levels, from 0 to 15.
    .ch_b       (           ),  // You need an additional table lookup if you want real
    .ch_c       (           )   // sound levels.
                             // Because AY is an asynchronous design and because here we
                             // emulate the delays of internal latches where it is necessary,
                             // there are glitches on these pins.
);

initial begin
    $shm_open("test.shm");
    $shm_probe(test,"AS");
    $dumpon;
    #(10*16*256*256*128) 
    $display("WARNING: simulation too long");
    $finish;
end

endmodule