// This program was cloned from: https://github.com/Revenantx86/uart
// License: MIT License

module uart_tx #
(
    parameter D_W       = 8,
    parameter B_TICK    = 16
) 
(
    /*
     * UART - Essential Pins - 
     */
    input  wire           rst,              // Reset
    input  wire           clk,              // System Clock Input
    input  wire           baud_clk,         // Baud Generator CLK Input
    input  wire [D_W-1:0] input_data,       // Data to be sent
    input  wire           tx_start,         // Data transmisson start flag from controll
    //
    output reg            baud_en,          // Baud generator enable flag
    output reg            tx_data,          // TX data bit output
    output reg            tx_done,          // Transmission done Flag
    /*
     * Status WIP
     */

    /*
     * FIFO Interface
     */
    output reg           ff_rd_en,         // FIFO read enable for loading
    input wire            ff_empty          //  FIFO Empty Flag
    //
);
//
reg [$clog2(B_TICK)-1:0] t_counter;         // Counting Ticks
reg [$clog2(D_W)-1:0] bit_shifted;          // Number of bits Received
//
// --- State Encodings --- //
enum {IDLE,START,DATA,STOP} STATE;          // State for TX Logic 
enum {FF_IDLE,FF_LOAD,FF_STOP} FF_STATE;    // State for FIFO
//
/*                
 * TX State Machines 
 */ 
always @ (posedge clk or posedge rst) begin
    // Reset registers and state
    if(rst)begin
        STATE <= IDLE;
        FF_STATE <= FF_IDLE;
        //
        t_counter <= 0;
        bit_shifted <= 0;
        tx_data <= 1; // Default state of tx bit
        baud_en <= 0;
        tx_done <= 0;
        ff_rd_en <= 0;
    end
    
    // State Machine begin //
    else 
    begin
        case(STATE) 
            //
            IDLE: 
            begin
                if(tx_start) begin
                    STATE <= START;         // If send data initalized, state -> Start
                    t_counter <= 0;         // Reset the counter for counting bit sent
                    baud_en <= 1;           // Enable baud clock for counting ticks
                end
            end
            //
            START: 
            begin
                tx_data <= 0;
                if(baud_clk) begin
                    if(t_counter == (B_TICK-1)) begin
                        t_counter <= 0;
                        STATE <= DATA;
                    end
                    else 
                        t_counter <= t_counter + 1;
                end
            end
            //
            DATA:
            begin
                tx_data <= input_data[bit_shifted];
                if (baud_clk) begin
                    if(t_counter == (B_TICK-1)) begin
                        bit_shifted <= bit_shifted + 1;
                        t_counter <= 0;
                        if(bit_shifted == 7) begin
                            STATE <= STOP;
                        end
                    end
                    else 
                        t_counter <= t_counter + 1;
                end
            end
            //
            STOP:
            begin
                if(baud_clk) begin
                    if(t_counter == (B_TICK - 1)) begin
                        tx_done <= 1;
                        tx_data <= 1;
                        STATE <= IDLE;
                    end
                    else 
                        t_counter <= t_counter +1;
                end
            end
        endcase
    end
end

/*                
 * FIFO State Machine
 */    
always @(posedge clk) begin
    //
    case(FF_STATE)
        FF_IDLE: begin
            if(STATE == IDLE && !ff_empty && tx_start)       // If rx completed receiving data && not full
                FF_STATE <= FF_LOAD;            // Start FIFO
        end

        FF_LOAD: begin
            ff_rd_en <= 1;                      // Enable FIFO write 
            FF_STATE <= FF_IDLE;                // GO to IDLE State
        end

    endcase
    //
end


endmodule