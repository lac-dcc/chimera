// This program was cloned from: https://github.com/Revenantx86/uart
// License: MIT License

module uart_rx 
# 
(
    parameter D_W = 8,                       // Data width
    parameter B_TICK = 16                    // Number of ticks
)
(
    // UART Essential Pins
    input   wire          rst,                // Reset 
    input   wire          clk,                // System CLK input
    input   wire          baud_clk,           // Baud Generator CLK input
    input   wire          rx_data,            // RX - Input

    output  reg           baud_en,            // Enable Baud
    output  reg [D_W-1:0] out_data,           // Forwarded to FIFO
    
    /*
     * Status WIP
     */
    //output wire            overrun_error,     // 
    //output wire            busy,              // 
    //output wire            frame_error,       // 

    /*
     * FIFO Interface
     */
    input   wire          ff_full,            // FIFO Full -> Trigger ***
    output  reg           ff_wr_en            // Enable FIFO
);

reg [$clog2(B_TICK)-1:0]  t_counter;          // Counting Ticks
reg [$clog2(D_W)-1:0]     bit_received;       // Number of bits Received


//  --- State Encoding ---  // 

enum {IDLE,START,DATA,STOP}     STATE;        // States for receive machine
enum {FF_IDLE,FF_DATA,FF_STOP}  FF_STATE;     // States for fifo transmit

/*                
 * RX State Machines 
 */               
always @(posedge clk or posedge rst) begin
    //    
    if(rst) begin
        STATE <= IDLE;
        FF_STATE <= FF_IDLE;
        //
        t_counter <= 0;
        bit_received <= 0;
        out_data <= 0;
        baud_en <= 0;
        ff_wr_en <= 0;
    end
    //
    else begin
        case(STATE) 
            //    
            IDLE:                           // Wait for input
            begin
                if(rx_data == 0) begin      // Wait for the data low
                    STATE <= START;         // Change starting state
                    t_counter <= 0;         // Init counter
                    baud_en <= 1;           // Enable baud_clk generator
                end
                else begin
                    t_counter <= 0;         // Keep counter at zero
                end
            end
            //
            START:                                              // Start counting to the middle
            begin
                if(baud_clk) begin
                    if(t_counter == (((B_TICK)/2)-1) ) begin    // Half baud_clk cycle reached
                        STATE <= DATA;                          // Start data acquisition
                        t_counter <= 0;                         // Reset Tick counter
                        bit_received <= 0;                      // Number of bit recevied = 0 
                    end                        
                    else
                        t_counter <= t_counter + 1;             // Continue counting ticks
                end        
            end
            //
            DATA: begin
                if(baud_clk) begin
                    if(t_counter == (B_TICK-1) ) begin               // Sample at the middle of the data 
                        t_counter <= 0;                              // Reset baud_clk counter
                        out_data <= {rx_data,out_data[7:1]};         // Add received bit to MSB 
                        if(bit_received == (D_W-1))                  // If bit size reached
                            STATE <= STOP;                           // Stop data acquisition sequence
                        else
                            bit_received <= bit_received + 1;        // Increase number of bits received
                    end
                    else
                        t_counter <= t_counter + 1;                  // Continue counting ticks
                end
            end
            //
            STOP: 
            begin
                if(baud_clk) begin
                    if(t_counter == (B_TICK-1) )                    // If counter reached to end
                        STATE <= IDLE;                              // Return back to IDLE state
                    else
                        t_counter <= t_counter + 1;                 // Continue counting baud_clk for the stop bit to end
                end
            end
            //
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
            if(STATE == STOP && !ff_full)       // If rx completed receiving data && not full
                FF_STATE <= FF_DATA;            // Start FIFO
        end

        FF_DATA: begin
            ff_wr_en <= 1;                      // Enable FIFO write 
            FF_STATE <= FF_STOP;                // GO to stop State
        end
        
        FF_STOP: begin
            ff_wr_en <= 0;                      // Disable read
            if(STATE == IDLE)                   // If rx at idle, FIFO -> IDLE
                FF_STATE <= FF_IDLE;
        end
    endcase
end
endmodule