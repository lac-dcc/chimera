// This program was cloned from: https://github.com/theuppercaseguy/GIKI-Tapeout
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 10:16:51 PM
// Design Name: 
// Module Name: transmitter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Transmitter(
    input clk, rst_n, Transmit,
    input [7:0] data,
    output reg TxD
    );
    
    reg [3:0] bit_counter =0; //counter for counting 10 bits, start data stop
    reg [12:0] baudrate_counter =0; //9600 = clock rate / bits per sec = 50mhz/9600 = 5208(13 bits) or 100mhz/9600=10,416=13bts
    reg [9:0] shift_right_reg =0 ; //10 bits seria;lly transmitted trhough uart port
    reg state =0, next_state=0; //idle, trasmit states
    reg shift; //shift signal to start shifting bits in the uart
    reg load; //load signal to start loading the data into the shiftright reg, and add start and stop bits as well
    reg clear; //reset the bit_counter for the uart transmission
    
    always@(posedge clk or negedge rst_n)
    begin
        if(rst_n == 1'b0 )
        begin
            state <= 1'b0; //idle state
//            next_state <= 1'b0;
            bit_counter <=4'b0000; //counter for bit transmittsion is reset to 0
            baudrate_counter <=13'b0000000000000;
            shift_right_reg <=10'b0000000000;
        end
        else
        begin
            baudrate_counter <= baudrate_counter + 1;
            if(baudrate_counter == 5208) //need to change for a 50mhz clock
            begin
                state <= next_state; //state changes from idel to transmission state
                baudrate_counter <= 13'b0000000000000;
                if(load == 1'b1)//if load is asserted
                begin
                    shift_right_reg <= {1'b1,{data}, 1'b0}; //stop bit, data, startbit: the data is loaded into the register
                end
                if(clear == 1'b1)
                begin
                    bit_counter <= 4'b0000;
                end
                if(shift ==1'b1)
                begin
                    shift_right_reg <= shift_right_reg >> 1; //start shifting from lsb, bit by bit, 10 bits
                    bit_counter<= bit_counter + 1;
                end
            end
        end
    end
    
    always@(posedge clk)
    begin
        load <= 1'b0;
        shift <= 1'b0;
        clear <= 1'b0;
        TxD <= 1'b1; //when asserted, no transmission in progress
        
        case (state) //idle state
        0: begin
            if(Transmit) //if transmitt is asserted, 
            begin
                next_state <= 1'b1; //trasnmission state
                load <=1'b1; //start loading the bits
                shift <=1'b0; // no shift at this point
                clear <=1'b0; // avoid clearing of any counter
            end
            else begin //if trasnmitt button is not asserted or pressed
                next_state <= 1'b0; //stays in idle mode
                TxD <= 1'b1; // no transmission
                load <=1'b0;
            end
        end
        1: begin //transmission state
           if(bit_counter == 9) // all 10(0-9) bits are transmitted
           begin
            next_state <=0; // switch from transmission mode to idle mode, beacause all the 10 bits are trassnmitted
            clear <= 1'b1; //clear all the counters
           end
           else begin // not transmitted all the 10 bits, still transmitting
            next_state <=1'b1; // statys in transmission state
            TxD <= shift_right_reg[0]; // transmit the lsb
            shift<=1'b1; // new bit arrives athe th LSB, continue shifting
           end
        end
        default: next_state <=1'b0;
        endcase
    end
    
        
endmodule
