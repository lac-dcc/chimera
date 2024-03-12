`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/11 22:41:11
// Design Name: 
// Module Name: writeback
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


module wback(
input wire          clk,
input wire          rst,
input wire [31:0]   CPU_addr,
output wire [31:0]  main_mem_din,
output reg          main_mem_we,
output reg [12:0]   main_mem_addr,
input wire [31:0]   cache_data_dout,
output reg [8:0]    cache_data_addr,
input wire          start,
output reg          done
    );
    
    reg [1:0]       current_state, next_state;
    reg [2:0]       counter;
    wire [5:0]      CPU_addr_index;
    
    assign CPU_addr_index = CPU_addr[10:5];
    
    assign main_mem_din = cache_data_dout;
    
    localparam  IDLE = 2'd0, TRANSFER = 2'd1, DONE = 2'd2;
    
    /* the first stage */
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
                        next_state = TRANSFER;
                    else
                        next_state = IDLE;
                end
        TRANSFER:   begin
                        if( counter == 3'b111)
                            next_state = DONE;
                        else
                            next_state = TRANSFER;
                    end
        DONE:   next_state = IDLE;
        default: next_state = IDLE;
        endcase
    end
    
    /* third stage */
    always @(posedge clk)
    begin
        if( rst )
        begin
            done <= 0;
            counter <= 0;
            main_mem_we <= 0;
            main_mem_addr <= 0;
            cache_data_addr <= 0;
        end
        else
        begin
            case( current_state )
            IDLE:   begin
                        done <= 0;
                        counter <= 0;
                        main_mem_we <= 0;
                        main_mem_addr <= 0;
                        cache_data_addr <= 0;
                    end
            TRANSFER:   begin
                            counter <= counter + 1;
                            cache_data_addr <= (CPU_addr_index << 3) + counter;
                            main_mem_we <= 1;
                            main_mem_addr <= (CPU_addr[31:5] << 3) + counter;
                        end
            DONE:   begin
                        main_mem_we <= 0;
                        done <= 1;
                    end
            endcase
        end
    end
    
endmodule
