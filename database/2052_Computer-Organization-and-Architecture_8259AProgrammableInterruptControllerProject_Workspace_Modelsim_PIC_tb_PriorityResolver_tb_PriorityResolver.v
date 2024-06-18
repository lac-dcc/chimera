// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module PriorityResolver(
  input wire freezing,
  input wire [7:0] IRR_reg, //connected to ISR to get its reg values.
  input wire [7:0] ISR_reg, //connected to ISR to get its reg values.
  input wire [2:0] resetedISR_index, //the number of ISR that'd've been reset.
  input wire [7:0] OCW2, //connected to the OCW2 reg to know the mode.
  input wire INT_requestAck, //the ack to reset the INT_request.
  output reg [2:0] serviced_interrupt_index, //connected to ISR (index to set) or to IRR (index to reset) the corresponding bit.
  output reg [2:0] zeroLevelPriorityBit = 3'b000, //Which bit have the highest bit priority, changes in rotation modes.
  output reg INT_request = 1'b0 //connected to the control logic to fire a new interrupt, Control logic will consider it's change only.
);
  
  reg [7:0] interrupt_indexes; //Register to store valid interrupt indexes.
  reg [1:0] currentMode; //Register to store the current mode active according to OCW2.
  wire [2:0] modesFromOCW2; //wire that holds the values of (D7,D6,D5) of OCW2. 
  reg resolveFlag = 1'b0; //Flag to start resolving the current priority.
  integer i; //counter for loops
  /*
   * Assign wires
   */
   assign modesFromOCW2 = OCW2[7:5];
   
  /*
   * localparam for the OCW2 modes (in this order: D7,D6,D5)
   */
  //For Fully Nested mode
  localparam NON_SPECIFIC_EOI                 = 3'b001;
  localparam SPECIFIC_EOI                     = 3'b011;
  //For Automatic Rotation mode
  localparam ROTATE_ON_NON_SPECIFIC_EOI       = 3'b101;
  localparam ROTATE_ON_AUTO_EOI_set           = 3'b100; //TODO??
  localparam ROTATE_ON_AUTO_EOI_clear         = 3'b000; //TODO??
  //For Specific rotation (out of scope)
  localparam ROTATE_ON_SPECIFIC_EOI           = 3'b111; 
  localparam SET_PRIORITY                     = 3'b110;
  //No operation ??
  localparam NO_OPERATION                     = 3'b010; //TODO??
  
  /*
   * Values of each mode
   */
   localparam FULLY_NESTED_MODE  = 2'b00;
   localparam AUTO_ROTATION_MODE = 2'b01;
   
  /*
   * Set the mode according to the value of OCW2.
   */
   always @(modesFromOCW2) begin
     case (modesFromOCW2)
      //Fully nested mode
      NON_SPECIFIC_EOI: currentMode <= FULLY_NESTED_MODE;
      SPECIFIC_EOI:     currentMode <= FULLY_NESTED_MODE;
      //Automatic Rotation mode
      ROTATE_ON_NON_SPECIFIC_EOI: currentMode <= AUTO_ROTATION_MODE;
      ROTATE_ON_AUTO_EOI_set:     currentMode <= AUTO_ROTATION_MODE;
      ROTATE_ON_AUTO_EOI_clear:   currentMode <= AUTO_ROTATION_MODE;
   endcase
   resolveFlag <= ~resolveFlag;
   end
   
  
  /*
   * If any changes happened in the IRR reg, if the priority was in freezing,
   * then ignore the changes in IRR and use the prev value of interrupt_indexes
   * Otherwise save the new IRR in the interrupt_indexes and start resolving.
   */
  always @(IRR_reg, resetedISR_index) begin
    //save the values of IRR or not according to freezing flag.
    if(freezing) begin
      interrupt_indexes = interrupt_indexes; //Store valid interrupts and freeze it.
    end else begin
      interrupt_indexes = IRR_reg; //Get the new values from the IRR.
      //Start resolving priority.
      //We treat the change of the value as a pulse.
      resolveFlag <= ~resolveFlag;
    end 
  end
  
  /*
   * Resolving block according to the mode.
   */
   always @(resolveFlag) begin
     //Do the resolving according to the mode.
     case (currentMode)
       FULLY_NESTED_MODE: begin
         zeroLevelPriorityBit <= 3'b000; //Bit zero have the level zero
     end  
       
       AUTO_ROTATION_MODE: begin
         zeroLevelPriorityBit <= resetedISR_index + 1; //Priority is same as before, until EOI occurred
         //change will happen at: always @(ISR_reg) part.
       end
    endcase
    /*
     * Loop starting from the IRR_reg bit with highest priority to the bit
     * with the lowest priority, get the highest priority bit.
     * assign the value to serviced_interrupt_index.
     * 
     * when the serviced_interrupt_index is changed, it must be compared with 
     * ISR_reg bits to determine whether to fire a flag or not. 
     * this part is found at: always @(serviced_interrupt_index) part.
     */
    for(i = 0; i < 8; i = i + 1) begin
      //As IRR_reg is only have position from 0 to 7, so we need 3 bits.
      //The mask ( & 3'b111) is used to get the least 3 bits after addition.
      if(IRR_reg[(zeroLevelPriorityBit + i) & 3'b111]) begin
        // Assign the active numbered IRR bit with highest priority.
        serviced_interrupt_index <=  zeroLevelPriorityBit + i;
        // Exit the loop once the interrupt is found.
        i = 8;
        //break; 
      end
    end
   end
  
  /*
   * In any negedge change in ISR_reg, we need to change zeroLevelPriorityBit to the new value
   * for the automatic rotation mode.
   */
   always @(
            negedge ISR_reg[0],
            negedge ISR_reg[1],
            negedge ISR_reg[2],
            negedge ISR_reg[3],
            negedge ISR_reg[4],
            negedge ISR_reg[5],
            negedge ISR_reg[6],
            negedge ISR_reg[7]
            ) begin
     if(currentMode == AUTO_ROTATION_MODE) begin
      zeroLevelPriorityBit <= resetedISR_index + 1;
      //Start resolving priority.
      //We treat the change of the value as a pulse.
      resolveFlag <= ~resolveFlag;
     end
   end
  
  /*
   * When serviced_interrupt_index changes, we need to check whether it
   * has a higher priority than the current bits in ISR_register not.
   * 
   * If true then we will fire an INT flag to the control logic,
   * Else do nothing.
   */
   always @(serviced_interrupt_index) begin
     // Loop for ISR bits starting from the highest priority.
     // -If we reached a value of 1 first in the ISR_reg, break the loop, this means no INT is fired.
     // -If we reached that(zeroLevelPriorityBit + i) & 3'b111] equals serviced_interrupt_index 1st, INT is fired and break the loop.
     for(i = 0; i < 8; i = i + 1) begin
       //As ISR_reg is only have position from 0 to 7, so we need 3 bits.
       //The mask ( & 3'b111) is used to get the least 3 bits after addition.
       if(ISR_reg[(zeroLevelPriorityBit + i) & 3'b111]) begin
         i = 8;
         //break;
       end
       else if(serviced_interrupt_index == ((zeroLevelPriorityBit + i) & 3'b111)) begin
         INT_request = 1;      
         i = 8;
         //break;
       end
     end 
   end
  
  /*
   * Reset the INT_request after receiving the INT_requestAck.
   * Do that for any change in the INT_requestAck.
   *
   */
  always @(INT_requestAck) begin
         INT_request = 0;
  end

endmodule