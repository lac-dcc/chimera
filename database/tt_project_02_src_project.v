// This program was cloned from: https://github.com/macros77/tt_project_02
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_macros77_subneg (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire reset = ! rst_n;
    
    wire enable = ui_in[0];
    wire ext_mem_latch_CLK = ui_in[1];
    wire ext_mem_WE = ui_in[2];
    
    reg [4:0] state;
    reg [7:0] PC;
    reg [7:0] addr_A;
    reg [7:0] addr_B;
    reg [7:0] addr_C;
    reg [7:0] val_A;
    reg [7:0] val_B;

    assign uo_out[7:4] = state[3:0];

    // Memory address latch
    reg mem_latch_CLK;
    assign uo_out[0] = (enable) ? mem_latch_CLK: ext_mem_latch_CLK; 
       
    // SRAM output
    reg mem_OE;
    assign uo_out[1] = (enable) ? mem_OE : 1;  

    // SRAM write
    reg mem_WE;
    assign uo_out[2] = (enable) ? mem_WE : ext_mem_WE; 

    // Output latch
    reg out_latch_CLK;
    assign uo_out[3] = (enable) ? out_latch_CLK: 0;    

    // Data bus direction
    assign uio_oe = (mem_OE && enable) ? 8'b11111111 : 8'b00000000;
    
    reg [7:0] data_bus;
    assign uio_out = data_bus;
    
    always@(posedge clk) begin

      if (reset || !enable) begin
        PC <= 0;
        state <= 0;
        mem_latch_CLK <= 0;
        out_latch_CLK <= 0;
        mem_WE <= 1;
        mem_OE <= 1;          
      end
                        
      if (enable) begin

          case (state)

            // addr_A            
            0: begin                 
                mem_WE <= 1;
                mem_OE <= 1;
                mem_latch_CLK <= 0;
                out_latch_CLK <= 0;
                data_bus <= PC;
                state <= state + 1;
            end 
            1: begin
                mem_latch_CLK <= 1;
                state <= state + 1;
            end 
            2: begin
                mem_OE <= 0;
                state <= state + 1;
            end                            
            3: begin
              addr_A <= uio_in;
              state <= state + 1;              
            end

            // addr_B            
            4: begin   
                mem_WE <= 1;
                mem_OE <= 1;
                mem_latch_CLK <= 0;
                data_bus <= PC+1;
                state <= state + 1;
            end 
            5: begin
                mem_latch_CLK <= 1;
                state <= state + 1;
            end 
            6: begin
                mem_OE <= 0;
                state <= state + 1;
            end                            
            7: begin
              addr_B <= uio_in;
              state <= state + 1;              
            end         

            // addr_C            
            8: begin   
                mem_WE <= 1;
                mem_OE <= 1;
                mem_latch_CLK <= 0;
                data_bus <= PC+2;
                state <= state + 1;
            end 
            9: begin
                mem_latch_CLK <= 1;
                state <= state + 1;
            end 
            10: begin
                mem_OE <= 0;
                state <= state + 1;
            end                            
            11: begin
              addr_C <= uio_in;
              state <= state + 1;             
            end     

            // val_A            
            12: begin   
                mem_WE <= 1;
                mem_OE <= 1;
                mem_latch_CLK <= 0;
                data_bus <= addr_A;
                state <= state + 1;
            end 
            13: begin
                mem_latch_CLK <= 1;
                state <= state + 1;
            end 
            14: begin
                mem_OE <= 0;
                state <= state + 1;
            end                            
            15: begin
              val_A <= uio_in;
              state <= state + 1;             
            end            

            // val_B           
            16: begin   
                mem_WE <= 1;
                mem_OE <= 1;
                mem_latch_CLK <= 0;
                data_bus <= addr_B;
                state <= state + 1;
            end 
            17: begin
                mem_latch_CLK <= 1;
                state <= state + 1;
            end 
            18: begin
                mem_OE <= 0;
                state <= state + 1;
            end                            
            19: begin
              val_B <= uio_in;
              state <= state + 1;              
            end      

            // SUBNEG logic                
            20: begin
                mem_WE <= 1;
                mem_OE <= 1;
                mem_latch_CLK <= 0;
                data_bus <= addr_B;
                state <= state + 1;
            end
            21: begin
                mem_latch_CLK <= 1;       
                state <= state + 1;
            end
            22: begin
                data_bus <= val_B - val_A;
                state <= state + 1;
            end            
            23: begin
                if (val_A>val_B) PC <= addr_C;
                else PC <= PC + 3;
                if (addr_B != 255) mem_WE <= 0;   
                else out_latch_CLK <= 1;
                state <= state + 1;               
            end              
            24: begin
                state <= 0;
            end
              
          endcase

        end

    end    

endmodule
