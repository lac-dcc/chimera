// This program was cloned from: https://github.com/valar1234/MIPS
// License: GNU Lesser General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/11 22:02:43
// Design Name: 
// Module Name: allocate
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


module allocate(
input wire          clk,
input wire          rst,
input wire [31:0]   CPU_addr,
input wire [31:0]   main_mem_dout,
output reg [12:0]   main_mem_addr,
output reg [8:0]    cache_data_addr,
output wire [31:0]   cache_data_din,
output reg          cache_data_we,
input wire          start,
output reg          done
    );
    
    reg [1:0]       current_state, next_state;
    reg [2:0]       counter;
    wire [5:0]      CPU_addr_index;
    
    assign CPU_addr_index = CPU_addr[10:5];
    
    localparam  IDLE = 2'd0, TRANSFER = 2'd1, DONE = 2'd2;
    
    assign cache_data_din = main_mem_dout;
    /* first stage */
    always @(posedge clk)
    begin
        if( rst )
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
    
    /* second stage */
    always @(*)
    begin
        next_state = IDLE;
        case( current_state )
        IDLE:   begin
                    if( start )
                        next_state =  TRANSFER;
                    else
                        next_state = IDLE;
                end
        TRANSFER:   begin
                        if( counter == 3'b111)
                            next_state = DONE;
                        else
                            next_state = TRANSFER;
                    end
        DONE: next_state = IDLE;
        default: next_state = IDLE;
        endcase
    end
    
    /* third stage */
    always @(posedge clk)
    begin
        if( rst )
        begin
            counter <= 0;
            done <= 0;
            cache_data_addr <= 0;
            cache_data_we <= 0;
            main_mem_addr <= 0;
        end
        else
        begin
            case( current_state )
            IDLE:   begin
                        counter <= 0;
                        done <= 0;
                        cache_data_addr <= 0;
                        cache_data_we <= 0;
                        main_mem_addr <= (CPU_addr[31:5] << 3);
                    end
            TRANSFER:   begin
                            counter <= counter + 1;
                            main_mem_addr <= (CPU_addr[31:5] << 3) + counter + 1;
                            cache_data_we <= 1;
                            cache_data_addr <= (CPU_addr_index << 3) + counter;
                        end
            DONE:     begin
                        cache_data_we <= 0;  
                        done <= 1'b1;
                     end
            endcase
        end
    end
    
endmodule
