`timescale 1ns / 1ps

/*

UART Code

    (Based on UART code from fpga4fun.com - see below for original copyright notice)

    Pipeline-based UART

    The original baudrate generator was not accurate for high baud rates (12Mbaud, for example)
    so it now has a cruder one that does the trick.

Instanciation Template

    uart_out #(.ClockFrequency(ClockFrequency), .BaudRate(UartBaudRate) ) out(
            .clock(clock),
            .reset(reset),

            .pipe_in( pipe_in ),

            .uart_tx(async_tx_out_pin) );

Instanciation Template - Non Pipeline

    uart_out_np #(.ClockFrequency(ClockFrequency), .BaudRate(UartBaudRate) ) out(
            .clock(clock),
            .reset(reset),

            .out_data(async_in_data),
            .out_valid(async_in_valid),
            .out_ready(async_in_ready),

            .uart_tx(async_tx_out_pin) );

Utilization

    ECP5 - 37 LUTs

Testing

    Confirmed in iCE40 @ 1Mbaud

    Confirmed in Xilinx 7 @ 1Mbaud

    Confirmed in MachXO3 @ 1Mbaud

    Confirmed in ECP5 @ 1Mbaud

*/

`include "../../pipe/rtl/pipe_defs.v"

module uart_out  #( parameter PipeSpec = `PS_DATA( 8 ), parameter ClockFrequency = 12000000, parameter BaudRate = 9600 ) (
        input clock,
        input reset,

        inout [`P_w(PipeSpec)-1:0] pipe_in,

        output pin_tx
    );

    wire [`P_Data_w(PipeSpec)-1:0] in_data;
    wire                     in_valid;
    wire                     in_ready;

    p_unpack_data        #( .PipeSpec( PipeSpec ) ) in_unpack_d ( pipe_in, in_data);
    p_unpack_valid_ready #( .PipeSpec( PipeSpec ) ) in_unpack_vr( pipe_in, in_valid, in_ready );

    // start and stop signals are ignored - packetization has to be escaped
    uart_out_np #( .ClockFrequency( ClockFrequency ), .BaudRate( BaudRate ) )  u_o_np (
            clock, reset,

            in_data, in_valid, in_ready,

            pin_tx
        );

endmodule

module uart_out_np #( parameter ClockFrequency = 12000000, parameter BaudRate = 9600 )(
        input clock,
        input reset,

        input [7:0] out_data,
        input       out_valid,
        output      out_ready,

        output uart_tx
    );

    // Assert out_valid for (at least) one clock cycle to start transmission of out_data
    // out_data is latched so that it doesn't have to stay valid while it is being sent

    generate
        if( ClockFrequency < BaudRate * 8 && ( ClockFrequency % BaudRate != 0 ) ) ASSERTION_ERROR PARAMETER_OUT_OF_RANGE("Frequency incompatible with requested BaudRate rate");
    endgenerate

    `ifdef SIMULATION
        wire BitTick = 1'b1;  // output one bit per clock cycle
    `else
        wire BitTick;
        uart_out_baudrate_gen #( ClockFrequency, BaudRate ) tickgen( .clock( clock ), .enable( ~out_ready ), .tick( BitTick ) );
    `endif

    reg [3:0] uart_state = 0;
    wire uart_ready = (uart_state==0);
    assign out_ready = uart_ready;

    reg [7:0] uart_shift = 0;
    always @(posedge clock)
    begin
        if ( reset ) begin
            uart_state <= 0;
        end else begin
            if( uart_ready & out_valid )
                uart_shift <= out_data;
            else
                if(uart_state[3] & BitTick)
                    uart_shift <= (uart_shift >> 1);

            case(uart_state)
                4'b0000: if(out_valid) uart_state <= 4'b0100;
                4'b0100: if(BitTick) uart_state <= 4'b1000;  // start bit
                4'b1000: if(BitTick) uart_state <= 4'b1001;  // bit 0
                4'b1001: if(BitTick) uart_state <= 4'b1010;  // bit 1
                4'b1010: if(BitTick) uart_state <= 4'b1011;  // bit 2
                4'b1011: if(BitTick) uart_state <= 4'b1100;  // bit 3
                4'b1100: if(BitTick) uart_state <= 4'b1101;  // bit 4
                4'b1101: if(BitTick) uart_state <= 4'b1110;  // bit 5
                4'b1110: if(BitTick) uart_state <= 4'b1111;  // bit 6
                4'b1111: if(BitTick) uart_state <= 4'b0010;  // bit 7
                4'b0010: if(BitTick) uart_state <= 4'b0000;  // stop1  -  state<=4'b0011 for stop2
                4'b0011: if(BitTick) uart_state <= 4'b0000;  // stop2
                default: if(BitTick) uart_state <= 4'b0000;
            endcase
        end
    end

    assign uart_tx = (uart_state<4) | (uart_state[3] & uart_shift[0]);  // put together the start, data and stop bits

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

module uart_out_baudrate_gen #( parameter ClockFrequency = 12000000, parameter BaudRate = 9600,  parameter Oversampling = 1 )(
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

////////////////////////////////////////////////////////
