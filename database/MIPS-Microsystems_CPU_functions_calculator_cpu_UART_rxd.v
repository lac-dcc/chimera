// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

/*--------------------------------------------------------------------------------------------------
Title       : Receiving unit
Design      : MiniUart
Author      : Gao XiaoPeng
Description : The receiving unit reads data serially and output it in paraller(8-bits) along. The 
              clock frequency of receiving unit is 8 times faster than the baud of the sender to
              sample the serial input data.
--------------------------------------------------------------------------------------------------*/
`include    "head_uart.v"

module  rx_unit ( rxd, en_rx, d_out, rs, over_read, clk, rst ) ;
    input                           rxd ;           // RxD
    input                           en_rx ;         // 
    output  [7:0]                   d_out ;         // 
    output                          rs ;            // receive status
    input                           over_read ;     // read over byte
    input                           clk ;           // clock
    input                           rst ;           // reset

    //  variables
    reg     [7:0]                   byte ;          // receiver shift register
    reg     [2:0]                   fsm ;           // receive FSM
    reg     [2:0]                   cnt_sample ;    // sample counter
    reg     [2:0]                   cnt_bits ;      // bits counter
    reg                             rf_av ;         // register flag : byte available
    wire                            is_sample_point ;   // sample point flag

    parameter   IDLE = 'd0, START = 'd1, BIT_RECV = 'd2, STOP = 'd3, WAIT_IDLE = 'd4 ;

    //  CPU interface
    assign  d_out   = byte ;                        // data register
    assign  rs      = rf_av ;                       // receiver status
    
    //  receive FSM
    always  @( posedge clk or posedge rst )
        if ( rst )
            begin
                fsm <= IDLE ;
                cnt_sample <= 0 ;
                cnt_bits <= 0 ;
                byte <= 0 ;
            end
        else
            if ( en_rx )
                case ( fsm )
                    IDLE        :   begin
                                        if ( !rxd )                         // is start bit ?
                                            fsm <= START ;
                                        cnt_sample  <= 'b110 ;              // sample counter 
                                        cnt_bits    <= 'b111 ;              // 8 bits left 
                                    end
                    START       :   begin 
                                        if ( is_sample_point )              // time to sample RxD
                                            fsm <= (rxd) ? IDLE : BIT_RECV ;
                                        cnt_sample <= cnt_sample - 1 ;      // sample counter - 1
                                    end
                    BIT_RECV    :   begin
                                        if ( is_sample_point )              // time to sample RxD
                                            begin
                                                if ( cnt_bits==0 )          // all bits received
                                                    fsm <= STOP ;           // begin to detect stop bit
                                                cnt_bits <= cnt_bits - 1 ;  // left bits minus 1
                                                byte <= {rxd, byte[7:1]} ;  // shift a bit
                                            end
                                        cnt_sample <= cnt_sample - 1 ;
                                    end
                    STOP        :   begin 
                                        if ( is_sample_point )              // time to sample RxD
                                            if ( rxd )                      // if RxD is '0', it means
                                                fsm <= IDLE ;               // it's not stop bit. so, 
                                            else                            // must wait for line "idle".
                                                fsm <= WAIT_IDLE ;
                                        cnt_sample <= cnt_sample - 1 ;
                                    end
                    WAIT_IDLE   :   if ( rxd )                              // wait until RxD to be idle
                                        fsm <= IDLE ;
                    default     :   fsm <= IDLE ;
                endcase

    //  byte available flag
    reg                             clk_rf_av ;
    //  clock for rf_av
    always  @( posedge clk or posedge rst )
        if ( rst )
            clk_rf_av <= 1'b0 ;
        else
            clk_rf_av <= ( (fsm==STOP) && is_sample_point && rxd ) ? 1'b1 : 1'b0 ;
    //  byte avaialbe flag : set at clk_rf_av's posedge and clear by DSP
    always  @( posedge clk_rf_av or posedge rst or posedge over_read )
        if ( rst | over_read )
            rf_av <= 1'b0 ;
        else
            rf_av <= 1'b1 ;

    //  if sample point
    assign  is_sample_point = (cnt_sample==`HALF_BIT) ;
endmodule