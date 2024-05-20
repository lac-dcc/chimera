// This program was cloned from: https://github.com/BrosnanYuen/tt07-Neuromorphic-ASIC-with-96-Neurons
// License: Apache License 2.0

`default_nettype none

module single_neuron #(parameter MEMORY = 8)(
    input CLK,
    input RST,
    input CONTROL,
    input  SEQ_IN,
    output SEQ_OUT
    );
    
    reg SEQ_OUT_REG = 0;
    
    reg [$clog2(2*MEMORY)-1:0] COUNTER = 0;
    reg WRITE_STATE = 0;
    reg READ_STATE = 0;
    
    reg [MEMORY-1:0] IN_BUF = 0;
    reg [(2*MEMORY)-1:0] TARGET = 0;
    
    reg [MEMORY-1:0] OUT_BUF = 0;
    
     always@(posedge CLK)
      begin
         if(RST)  begin
            WRITE_STATE <= 1'b1;
            READ_STATE <= 1'b0;
            COUNTER <= 0;
            SEQ_OUT_REG <= 1'b0;
         end else  if (READ_STATE) begin
            SEQ_OUT_REG <= OUT_BUF[MEMORY-1];
            OUT_BUF <= OUT_BUF << 1;
            
            COUNTER <= COUNTER + 1;
            if (COUNTER == (MEMORY-1) ) begin
                READ_STATE <= 1'b0;

            end
            
            IN_BUF <= IN_BUF << 1;
            
         end else if (WRITE_STATE) begin
            TARGET <= TARGET << 1;
            TARGET[0] <= CONTROL;
            COUNTER <= COUNTER + 1;
            if (COUNTER == ((2*MEMORY)-1) ) begin
                WRITE_STATE <= 1'b0;
            end
            SEQ_OUT_REG <= 1'b0;
        end else  begin
        
            if (IN_BUF == TARGET[(2*MEMORY)-1:MEMORY]) begin
                READ_STATE <= 1'b1;
                COUNTER <= 0;
                OUT_BUF <= TARGET[MEMORY-1:0];
            end
        
            IN_BUF <= IN_BUF << 1;
            
            IN_BUF[0] <= SEQ_IN;
            SEQ_OUT_REG <= 1'b0;
            
        end

    
      end
    
    
    assign SEQ_OUT = SEQ_OUT_REG;
endmodule
