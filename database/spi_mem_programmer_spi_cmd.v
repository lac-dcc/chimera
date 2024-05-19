// This program was cloned from: https://github.com/sergachev/spi_mem_programmer
// License: MIT License

`timescale 1ns / 1ps

`define STATE_IDLE 0
`define STATE_TX 1
`define STATE_RX 2

module spi_cmd(
        // controls
        input clk,
        input reset,
        input trigger,
        output reg busy,
        input [8:0] data_in_count,
        input data_out_count,
        input [260 * 8 - 1 : 0] data_in, // max len is: 256B data + 1B cmd + 3B addr
        output reg [7:0] data_out,
        input quad_mode,
        
        // SPI memory
        inout [3:0] DQio,
        output reg S 
    );
    
    wire [2:0] n_bits_parallel = quad_mode ? 4 : 1;
    reg [11:0] bit_cntr;
    reg [3:0] DQ = 4'b1111;
    reg oe;
    reg [1:0] state;

    assign DQio[0] = oe ? DQ[0] : 1'bZ;
    assign DQio[1] = oe ? DQ[1] : 1'bZ;
    assign DQio[2] = oe ? DQ[2] : 1'bZ;
    assign DQio[3] = quad_mode ? (oe ? DQ[3] : 1'bZ) : 1'b1;
    // has to be held 1 as 'hold'
    //  during single IO operation, but in quad mode behaves as other IOs

    always @(posedge clk) begin
        if (reset) begin
            state <= `STATE_IDLE;
            oe <= 0;
            S <= 1;
            busy <= 1;
        end else begin
            case (state)
                `STATE_IDLE: begin
                    if (trigger && !busy) begin
                        state <= `STATE_TX;
                        busy <= 1;
                        bit_cntr <= data_in_count * 8 - 1;
                     end else begin
                        S <= 1;
                        busy <= 0;
                     end
                 end

                `STATE_TX: begin
                    S <= 0;
                    oe <= 1;
                    if(quad_mode) begin
                        DQ[0] <= data_in[bit_cntr - 3];
                        DQ[1] <= data_in[bit_cntr - 2];
                        DQ[2] <= data_in[bit_cntr - 1];
                        DQ[3] <= data_in[bit_cntr];
                    end else
                         DQ[0] <= data_in[bit_cntr];
                    
                    if (bit_cntr > n_bits_parallel - 1) begin
                        bit_cntr <= bit_cntr - n_bits_parallel;
                    end else begin
                        if (data_out_count > 0) begin
                            state <= `STATE_RX;
                            bit_cntr <= 7 + 1; // +1 because read happens on falling edge
                        end
                        else begin
                            state <= `STATE_IDLE;
                        end
                    end
                end

                `STATE_RX: begin
                    oe <= 0;
                    
                    if (bit_cntr > n_bits_parallel - 1) begin
                        bit_cntr <= bit_cntr - n_bits_parallel;
                    end else begin
                        S <= 1;
                        state <= `STATE_IDLE;
                    end
                end

                default: begin
                    state <= `STATE_IDLE;
                end
            endcase
        end
    end 
   
    always @(negedge clk) begin
        if (reset) begin
            data_out <= 0;
        end else begin
            if (state == `STATE_RX) begin
                if (quad_mode)
                    data_out <= {data_out[3:0], DQio[3], DQio[2], DQio[1], DQio[0]};
                else
                    data_out <= {data_out[6:0], DQio[1]};
            end
        end
    end

endmodule
