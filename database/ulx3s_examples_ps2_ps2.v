// This is input-only for the time being
module ps2_intf
  (
   input            CLK,
   input            nRESET,
                 
   // PS/2 interface (could be bi-dir)
   input            PS2_CLK,
   input            PS2_DATA,
   
   // Byte-wide data interface - only valid for one clock
   // so must be latched externally if required
   output reg [7:0] DATA,
   output reg       VALID,
   output reg       ERROR
   );
   
   reg [7:0]        clk_filter;
   reg              ps2_clk_in;
   reg              ps2_dat_in;
   reg              clk_edge; // Goes high when a clock falling edge is detected
   reg [3:0]        bit_count;
   reg [8:0]        shiftreg;
   reg              parity;


   always @(posedge CLK, negedge nRESET)
     begin
        if (!nRESET)
          begin
             ps2_clk_in <= 1'b1;
             ps2_dat_in <= 1'b1;
             clk_filter <= 8'hff;
             clk_edge   <= 1'b0;
             end
        else
          begin
            // Register inputs (and filter clock)
             ps2_dat_in <= PS2_DATA;
             clk_filter <= { PS2_CLK, clk_filter[7:1] };
             clk_edge   <= 1'b0;

             if (clk_filter == 8'hff)
               // Filtered clock is high
               ps2_clk_in <= 1'b1;
             else if (clk_filter == 8'h00)
               begin
                  // Filter clock is low, check for edge
                  if (ps2_clk_in)
                    clk_edge <= 1'b1;
                  ps2_clk_in <= 1'b0;
               end
          end        
     end

    // Shift in keyboard data
   always @(posedge CLK, negedge nRESET)
     begin
        if (!nRESET)
          begin
             bit_count <= 0;
             shiftreg  <= 0;
             DATA      <= 0;             
             parity    <= 1'b0;
             VALID     <= 1'b0;
             ERROR     <= 1'b0;
          end
        else
          begin
             // Clear flags
             VALID <= 1'b0;
             ERROR <= 1'b0;

             if (clk_edge)
               // We have a new bit from the keyboard for processing
               if (bit_count == 0)
                 begin
                    // Idle state, check for start bit (0) only and don't
                    // start counting bits until we get it
                    
                    parity <= 1'b0;
                    if (!ps2_dat_in)                                        
                      bit_count <= bit_count + 1; // This is a start bit
                 end
               else
                 begin                 
                    // Running.  8-bit data comes in LSb first followed by
                    // a single stop bit (1)
                    if (bit_count < 10)
                      begin
                         // Shift in data and parity (9 bits)
                         bit_count <= bit_count + 1;
                         shiftreg  <= { ps2_dat_in,  shiftreg[8:1] };
                         parity    <= parity ^ ps2_dat_in;
                      end
                    else if (ps2_dat_in)
                      begin
                         // Valid stop bit received
                         bit_count <= 0;        // back to idle
                         if (parity)
                           begin
                              // Parity correct, submit data to host
                              DATA  <= shiftreg[7:0];
                              VALID <= 1'b1;
                           end
                         else
                           ERROR <= 1'b1;
                      end
                    else
                      begin
                         // Invalid stop bit
                         bit_count <= 0;        // back to idle
                         ERROR     <= 1'b1;
                      end
                 end
          end
     end
endmodule

