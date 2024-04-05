`timescale 1ns / 1ps

/*

UART Code

    (Based on UART code from fpga4fun.com - see below for original copyright notice)

    Pipeline-based UART

    The original baudrate generator was not accurate for high baud rates (12Mbaud, for example)
    so it now has a cruder one that does the trick.

Instanciation Template

    uart_in #(.ClockFrequency(ClockFrequency), .BaudRate(UartBaudRate), .Oversampling( 8 ) ) in(
            .clock(clock),
            .reset(reset),

            .pipe_out( pipe_out ),

            .uart_rx(async_rx_in_pin)
    );

Instanciation Template - Non Pipe

    uart_in_np #(.ClockFrequency(ClockFrequency), .BaudRate(UartBaudRate), .Oversampling( 8 ) ) in(
            .clock(clock),
            .reset(reset),

            .in_data(async_in_data),
            .in_valid(async_in_valid),
            .in_ready(async_in_ready),

            .uart_rx(async_rx_in_pin)
    );

Utilization

    ECP5 - 24 LUTs

Testing

    Confirmed in iCE40 @ 1Mbaud

    Confirmed in Xilinx 7 @ 1Mbaud

    Confirmed in MachXO3 @ 1Mbaud

    Confirmed in ECP5 @ 1Mbaud

*/

`include "../../pipe/rtl/pipe_defs.v"

module uart_in  #( parameter PipeSpec = `PS_DATA( 8 ), parameter ClockFrequency = 12000000, parameter BaudRate = 9600 ) (
        input clock,
        input reset,

        inout [`P_m(PipeSpec):0] pipe_out,

        input pin_rx
    );

    wire [`P_Data_w(PipeSpec)-1:0] out_data;
    wire                     out_valid;
    wire                     out_ready;

    uart_in_np #( .ClockFrequency( ClockFrequency ), .BaudRate( BaudRate ) )  u_i_np (
            .clock( clock ),
            .reset( reset ),

            .in_data( out_data ),
            .in_valid( out_valid ),
            .in_ready( out_ready ),

            .uart_rx( pin_rx )
        );

    p_pack_data        #( .PipeSpec( PipeSpec ) ) out_pack_d ( out_data,             pipe_out );
    p_pack_valid_ready #( .PipeSpec( PipeSpec ) ) out_pack_vr( out_valid, out_ready, pipe_out );

endmodule


module uart_in_np #( parameter ClockFrequency = 12000000, parameter BaudRate = 9600,  parameter Oversampling = 8 )(
        input clock,
        input reset,

        output reg [7:0] in_data = 0,  // data received, valid only (for one clock cycle) when in_ready is asserted
        output reg       in_valid = 0,
        input            in_ready,

        // We also detect if a gap occurs in the received stream of characters
        // That can be useful if multiple characters are sent in burst
        //  so that multiple characters can be treated as a "packet"
        output uart_idle,  // asserted when no data has been received for a while
        output reg uart_endofpacket = 0,  // asserted for one clock cycle when a packet has been detected (i.e. uart_idle is going high)

        input uart_rx
    );

    reg [7:0] in_data_build;

    // we oversample the uart_rx line at a fixed rate to capture each uart_rx data bit at the "right" time
    // 8 times oversampling by default, use 16 for higher quality reception

    generate
        if( ClockFrequency < BaudRate * Oversampling ) ASSERTION_ERROR PARAMETER_OUT_OF_RANGE("Frequency too low for current BaudRate rate and oversampling");
        if( Oversampling < 8 || ((Oversampling & (Oversampling-1))!=0)) ASSERTION_ERROR PARAMETER_OUT_OF_RANGE("Invalid oversampling value");
    endgenerate

    ////////////////////////////////
    reg [3:0] uart_state = 0;

    `ifdef SIMULATION
        wire uart_bit = uart_rx;
        wire sampleNow = 1'b1;  // receive one bit per clock cycle
    `else
        wire OversamplingTick;
        uart_in_baudrate_gen #(ClockFrequency, BaudRate, Oversampling) tickgen(.clock(clock), .enable(1'b1), .tick(OversamplingTick));

        // synchronize uart_rx to our clock domain
        reg [1:0] uart_sync = 2'b11;
        always @(posedge clock)
            if(OversamplingTick)
                uart_sync <= {uart_sync[0], uart_rx};

        // and filter it
        reg [1:0] Filter_cnt = 2'b11;
        reg uart_bit = 1'b1;

        always @(posedge clock)
            if(OversamplingTick) begin
                if(uart_sync[1]==1'b1 && Filter_cnt!=2'b11)
                    Filter_cnt <= Filter_cnt + 1'd1;
                else
                    if(uart_sync[1]==1'b0 && Filter_cnt!=2'b00)
                        Filter_cnt <= Filter_cnt - 1'd1;

                if(Filter_cnt==2'b11)
                    uart_bit <= 1'b1;
                else
                    if(Filter_cnt==2'b00)
                        uart_bit <= 1'b0;
            end

        // and decide when is the good time to sample the uart_rx line
        function integer log2(input integer v); begin
            log2=0;
            while(v>>log2) log2=log2+1;
        end endfunction

        localparam l2o = log2(Oversampling);

        reg [l2o-2:0] OversamplingCnt = 0;

        always @(posedge clock)
            if(OversamplingTick)
                OversamplingCnt <= (uart_state==0) ? 1'd0 : OversamplingCnt + 1'd1;

        wire sampleNow = OversamplingTick && (OversamplingCnt==Oversampling/2-1);
    `endif

    // now we can accumulate the uart_rx bits in a shift-register
    always @(posedge clock)
        if ( reset ) begin
            uart_state <= 0;
        end else begin
            case(uart_state)
                4'b0000: if(~uart_bit) uart_state <= `ifdef SIMULATION 4'b1000 `else 4'b0001 `endif;  // start bit found?
                4'b0001: if(sampleNow) uart_state <= 4'b1000;  // sync start bit to sampleNow
                4'b1000: if(sampleNow) uart_state <= 4'b1001;  // bit 0
                4'b1001: if(sampleNow) uart_state <= 4'b1010;  // bit 1
                4'b1010: if(sampleNow) uart_state <= 4'b1011;  // bit 2
                4'b1011: if(sampleNow) uart_state <= 4'b1100;  // bit 3
                4'b1100: if(sampleNow) uart_state <= 4'b1101;  // bit 4
                4'b1101: if(sampleNow) uart_state <= 4'b1110;  // bit 5
                4'b1110: if(sampleNow) uart_state <= 4'b1111;  // bit 6
                4'b1111: if(sampleNow) uart_state <= 4'b0010;  // bit 7
                4'b0010: if(sampleNow) uart_state <= 4'b0000;  // stop bit
                default: uart_state <= 4'b0000;
            endcase
        end

    always @(posedge clock)
        if(sampleNow && uart_state[3])
            in_data_build <= {uart_bit, in_data_build[7:1]};

    //reg in_data_error = 0;
    always @(posedge clock) begin
        if ( sampleNow && uart_state==4'b0010 && uart_bit ) begin
            in_valid <= 1;
            in_data <= in_data_build;
        end else begin
            if ( in_ready ) begin
                in_valid <= 0;
                in_data <= 0;
            end
        end


        //in_data_error <= (sampleNow && uart_state==4'b0010 && ~uart_bit);  // error if a stop bit is not received
    end

    `ifdef SIMULATION
        assign uart_idle = 0;
    `else
        reg [l2o+1:0] GapCnt = 0;
        always @(posedge clock)
            if (uart_state!=0)
                GapCnt<=0;
            else
                if(OversamplingTick & ~GapCnt[log2(Oversampling)+1])
                    GapCnt <= GapCnt + 1'h1;
        assign uart_idle = GapCnt[l2o+1];
        always @(posedge clock)
            uart_endofpacket <= OversamplingTick & ~GapCnt[l2o+1] & &GapCnt[l2o:0];
    `endif

endmodule


////////////////////////////////////////////////////////
// dummy module used to be able to raise an assertion in Verilog
//module ASSERTION_ERROR();
//endmodule

/////////////////////////////////////////////////////////
// This is an alternative implementation.  It is designed to be 100% accurate
// on very fast baud rates (where the baud rate is not a million miles from the
// clock frequency).  It's just a count-down register, but the reload adds so that errors
// accumulate and are righted - necessary for when things get really oversampled.

module uart_in_baudrate_gen #( parameter ClockFrequency = 12000000, parameter BaudRate = 9600,  parameter Oversampling = 1 )(
        input clock, enable,
        output tick  // generate a tick at the specified baud rate * oversampling
    );

    // A quicky for an int log2
    function integer log2(input integer v); begin
        log2=0;
        while(v>>log2)
            log2=log2+1;
        end
    endfunction

    localparam Count = (ClockFrequency/BaudRate); // for the oversampling = 1.  Um... I don't know for what.
    localparam CountWidth = log2(Count) + 2; // don't want to accidentally fill it with a load!

    reg [CountWidth-1:0] Counter = 0;

    always @(posedge clock)
        if( !enable )
            Counter <= Count - Oversampling - Oversampling - 1;
        else if ( Counter[CountWidth-1] )
            Counter <= Counter + Count - Oversampling;
        else
            Counter <= Counter - Oversampling;

    assign tick = Counter[CountWidth-1];
endmodule

// I'm keeping this around in case I want to t.a.l.k   s.l.o.w.
// Selecting between them should be automatic - anytime there's a clock counter in the code above larger than - say 10 bits,
// we probably ought to be using the original baud rate generator.

// Take a look here for an explanation
// https://www.fpga4fun.com/SerialInterface2.html
/*
module uart_baudrate_gen_Orig(
        input clock, enable,
        output tick  // generate a tick at the specified baud rate * oversampling
    );

    parameter ClockFrequency = 25000000;
    parameter BaudRate = 115200;
    parameter Oversampling = 1;

    // A quicky for an int log2
    function integer log2(input integer v); begin
        log2=0;
        while(v>>log2)
            log2=log2+1;
        end
    endfunction

    localparam AccWidth = log2(ClockFrequency/BaudRate)+8;  // +/- 2% max timing error over a byte
    reg [AccWidth:0] Acc = 0;
    localparam ShiftLimiter = log2(BaudRate*Oversampling >> (31-AccWidth));  // this makes sure Inc calculation doesn't overflow
    localparam Inc = ((BaudRate*Oversampling << (AccWidth-ShiftLimiter))+(ClockFrequency>>(ShiftLimiter+1)))/(ClockFrequency>>ShiftLimiter);

    localparam ActualCounter = (1<<AccWidth);
    localparam ActualDivider = ActualCounter/Inc;
    localparam ActualErrorCounts = Inc*ActualDivider-ActualCounter;
    localparam ActualErrorPercentage = 100 * ActualErrorCounts / ActualCounter;

    always @(posedge clock)
        if(enable)
            Acc <= Acc[AccWidth-1:0] + Inc[AccWidth:0];
        else
            Acc <= Inc[AccWidth:0];

    assign tick = Acc[AccWidth];
endmodule
*/
////////////////////////////////////////////////////////
// RS-232 RX and TX module
// (c) fpga4fun.com & KNJN LLC - 2003 to 2016

// The RS-232 settings are fixed
// TX: 8-bit data, 2 stop, no-parity
// RX: 8-bit data, 1 stop, no-parity (the receiver can accept more stop bits of course)

//`define SIMULATION   // in this mode, TX outputs one bit per clock cycle
                       // and RX receives one bit per clock cycle (for fast simulations)

// DW - I changed the baud rate generator to one more likely to be accurate for fast clock rates
// DW - Formatting... it was too compact to read easily
// DW - finding the SEND is slightly longer than the RECEIVE (fixed)
// DW - switch the xmit to 1 stop bit
// DW - split into in and out - separate files

////////////////////////////////////////////////////////
