// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/**
 * @file PIC_TopModule.v
 * @brief contains the 8259 PIC top module implementation
 */

 /**
  * @inputs: 
  *     - INTA: Connected to the control logic from the CPU, indicating interrupt acknowledge.
  *     - RD, WR, A0, CS: Inputs to the read/write logic.
  *     - CAS, SP: Inputs for cascade control.
  *     - IR0_to_IR7: Inputs representing interrupt request lines from external devices.
  *
  * @outputs:
  *     - INT: Output to the control logic indicating interrupt request to the CPU.
  *     - sys_DataLine: Bi-directional data bus (D0 - D7).
  *
  *
  * @submodules:
  *     - DataBusBuffer               @ref @file DataBusBuffer.v
  *     - ReadWriteLogic              @ref @file ReadWriteLogic.v
  *     - CascadeController           @ref @file CascadeController.v
  *     - InterruptMaskRegister       @ref @file InterruptMaskRegister.v
  *     - InterruptRequestRegister    @ref @file InterruptRequestRegister.v
  *     - PriorityResolver            @ref @file PriorityResolver.v
  *     - InServiceRegister           @ref @file InServiceRegister.v
  *     - ControlLogic                @ref @file ControlLogic.v
  */

module PIC_TopModule
  (
  input wire INTA, //Conected to Control logic from CPU
  output wire INT, //Conected to Control logic to CPU 
  inout wire [7:0] sys_DataLine, //D0 - D7
  input wire RD, // Read / Write Logic
  input wire WR, // Read / Write Logic
  input wire A0, // input to Read / Write Logic
  input wire CS, // 8 bit data input to read / write logic
  inout wire [2:0] CAS, // cascade controller
  input wire SP,  // enable and decide cascade mode
  input wire [7:0] IR0_to_IR7
  );
  
  
  
  wire [7:0] internalDATABus;  // connecting data to all blocks
  
  wire [7:0] ICW1;					// Output : Initialization Command Word 1 (8 bits).				
  wire [7:0] ICW2;					// Output : Initialization Command Word 2 (8 bits).
  wire [7:0] ICW3;					// Output : Initialization Command Word 3 (8 bits).
  wire [7:0] ICW4;					// Output : Initialization Command Word 4 (8 bits).
  wire [7:0] OCW1;					// Output : Operation Command Word 1 (8 bits).
  wire [7:0] OCW2;					// Output : Operation Command Word 2 (8 bits).
  wire [7:0] OCW3;					// Output : Operation Command Word 3 (8 bits). 
  
  
  wire rd;  // from Read flag logic to data bus buffer
  wire wr;  // from write flag logic to data bus buffer
  
  
  //Making an instance of Databus buffer
  DataBusBuffer dataBusBuffer (
    .data_inside(internalDATABus),
    .data_outside(sys_DataLine),
    .rd(rd),
    .wr(wr)
  ); 
  
  // Making an instanec of readWrirelLogic
  ReadWriteLogic readWriteLogic(
    .Read(RD),  // from cpu
    .write(WR), // from cpu
    .A0(A0), // from cpu
    .CS(CS), // from cpu
    .dataBuffer(internalDATABus), // from data bus
    .write_flag(wr), // to data bus buffer
    .ICW1(ICW1), // to the ocw icw 24 bit bus 
    .ICW2(ICW2), // to the ocw icw 24 bit bus 
    .ICW3(ICW3), // to the ocw icw 24 bit bus 
    .ICW4(ICW4), // to the ocw icw 24 bit bus 
    .OCW1(OCW1), // to the ocw icw 24 bit bus 
    .OCW2(OCW2), // to the ocw icw 24 bit bus 
    .OCW3(OCW3), // to the ocw icw 24 bit bus 
    .read_cmd_to_ctrl_logic(read_cmd_to_ctrl_logic),  // to control logic
    .OCW2_change(OCW2_change), // to isr
    .read_cmd_imr_to_ctrl_logic(read_cmd_imr_to_ctrl_logic), // to control logic
    .read_flag(rd), // to data bus buffer
    .OCW2_change_ACK(OCW2_change_ACK) //from isr
    );
    
    wire [2:0] desired_slave;
  // Instantiation of the CascadeController module for master
  CascadeController cascadeController (
    .CAS(CAS), //done
    .SP(SP), //done 
    .ICW3(ICW3), // done
    .control_signal(cascade_signal), // from control logic
    .desired_slave(desired_slave),  // from control logic
    .flag_ACK(cascade_flag_ACK), // from control logic
    .flag(cascade_flag),  // to control logic
    .control_signal_ack(control_signal_ack), // from control logic
    .SP_to_control(SP_to_control), // to control logic
    .EOI(EOI_to_cascade) // from control logic
  );
  
  wire[7:0] IMR_reg;
  // Instantiate Interrupt Mask Register 
  InterruptMaskRegister IMR_inst(
    .OCW1(OCW1),    // OCW1 commands to know which bits are masked, connected to the R/D logic.
    .readIMR(read_IMR),  //done    // To put the IMR_reg into the internal data lines, connected to the control logic.
    .IMR_reg(IMR_reg),  // done  // IMR (status) register, connected to IRR.
    .dataBuffer(internalDATABus)  // Internal data bus that is connected to the data buffer.
  );
  
  wire[2:0] serviced_interrupt_index;
  wire[7:0] risedBits;
  // Instantiate the InterruptRequestRegister module
  InterruptRequestRegister irr_inst (
    .IR0_to_IR7(IR0_to_IR7),  //done comes from outside the module
    .bitToMask(IMR_reg),    // comes from imr
    .readPriority(readPriority), // done from control logic
    .readIRR(readIRR),  // done from control logic
    .resetIRR(serviced_interrupt_index), //comes from priority resolver
    .ICW1(ICW1), //done comes from read write logic
    .risedBits(risedBits), // to priority resolver
    .dataBuffer(internalDATABus), // done
    .readPriorityAck(read_priority_ACK) // done  // come from control logic
  );
    
    wire[7:0] isrRegValue;
    wire[2:0] resetedIndex;
    wire[2:0] zeroLevelPriorityBit;
  // Instantiate the InterruptRequestRegister module
  PriorityResolver pr_inst(
    .freezing(freezing),   ////done comes from read write logic
    .IRR_reg(risedBits),  // comes from irr 
    .ISR_reg(isrRegValue),  // from isr 
    .OCW2(OCW2),  ////done comes from read write logic
    .resetedISR_index(resetedIndex), // from isr
    .INT_requestAck(INT_request_ACK), // Done from control logic
    .serviced_interrupt_index(serviced_interrupt_index), // goes to irr and isr
    .zeroLevelPriorityBit(zeroLevelPriorityBit), // to isr
    .INT_request(INT_request) // to control logic
  );
  
  wire[2:0] INTIndex;
   // Instantiate the module
  InServiceRegister isr_inst (
    .toSet(serviced_interrupt_index), // from priority resolver and goes to irr as well
    .readPriority(read_priority), // from control and goes to irr aswell
    .readIsr(read_ISR), // from control
    .sendVector(send_vector_ISR),  // from control
    .zeroLevelIndex(zeroLevelPriorityBit),  //from priority resolver
    .ICW2(ICW2), // done from read write logic
    .ICW4(ICW4),  // done from read write logic
    .secondACK(second_ACK), //from control
    .changeInOCW2(OCW2_change), //from read write logic //TODO: PLEASE CHECK OCW AND OCW3
    .OCW2(OCW2),  // done from read write logic
    .INTIndex(INTIndex), // TO CONTROL LOGIC
    .dataBuffer(internalDATABus), //Done
    .isrRegValue(isrRegValue),  //done
    .resetedIndex(resetedIndex),  // done 
    .sendVectorAck(sendVectorAck), // to control logic
    .EOI(EOI), // done to conctol logic
    .changeInOCW2Ack(OCW2_change_ACK) // from read write
    );
      
  // Instantiate the ControlLogic module
  ControlLogic control_logic_inst (
    .INTA(INTA),  // from cpu
    .INT_request(INT_request),   // from priority
    .read_priority_ACK(read_priority_ACK),  /// to IRR  
    .interrupt_index(INTIndex), // FROM ISR
    .send_vector_ISR_ACK(sendVectorAck), // from ISR
    .read_cmd_to_ctrl_logic(read_cmd_to_ctrl_logic),  // from read write
    .OCW3(OCW3),  // done from read write logic 
    .write_flag(wr), //TODO: CHECK IF CANCELED
    .ICW3(ICW3),  // done from read write logic 
    .read_cmd_imr_to_ctrl_logic(read_cmd_imr_to_ctrl_logic), //from read write logic
    .ICW1(ICW1),  // done from read write logic   
    .cascade_flag(cascade_flag),  // from cascade controller
    .SP(SP_to_control),  // from cascade controller
    .cascade_signal_ACK(control_signal_ack), // to cascasde controller
    .EOI(EOI), // come from isr
    .INT(INT),// to cpu
    .read_IRR(read_IRR),  //to irr
    .read_priority(read_priority),  //to irr  AND ISR
    .freezing(freezing), // to priority
    .INT_request_ACK(INT_request_ACK), // to priority
    .read_IMR(read_IMR), // to imr
    .send_vector_ISR(send_vector_ISR), // to isr
    .read_ISR(read_ISR), // to isr
    .pulse_ACK(pulse_ACK), // TODO: CHECK USAGE
    .second_ACK(second_ACK),//to isr
    .EOI_to_cascade(EOI_to_cascade), // to cascade controller
    .cascade_signal(cascade_signal), // to cascade controller
    .desired_slave(desired_slave),// to cascade controller
    .cascade_flag_ACK(cascade_flag_ACK)// to cascade controller
  );
    
endmodule
