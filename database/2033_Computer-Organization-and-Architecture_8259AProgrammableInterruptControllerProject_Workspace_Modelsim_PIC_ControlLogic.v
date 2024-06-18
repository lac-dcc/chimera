// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module ControlLogic(
    input INTA,                             // Input: Interrupt acknowledge from CPU.
    input INT_request,                      // Input: Interrupt request from priority resolver.

    input read_priority_ACK,                // Input: Acknowledge to deactivate the read_priority flag.

    input [2:0] interrupt_index,            // Input: ID of the interrupt to be handled (comes from ISR).
    input send_vector_ISR_ACK,              // Input: Acknowledge to deactivate the send_vector_ISR flag.

    input read_cmd_to_ctrl_logic,           // Input: Sent from read/write logic to read status of ISR or IRR.
    input [7:0] OCW3,                       // Input: Will be used to know which register to read its status. 
    input write_flag,                       // Input: to indicate that there are writing operation. 
    input [7:0]ICW3,                        // Input: Used in cascade mode.
    input read_cmd_imr_to_ctrl_logic,       // Input: Read command to control logic to active IMR to read its state.
    input [7:0] ICW1,                       // Input: Used to determine if operating in cascade mode or single mode.
    input cascade_flag,                     // Input: In case of slave, it will be sent from cascade controller in case that it's the desired slave.
    input SP,                               // Input: to determined the pic is master or slave.
    input cascade_signal_ACK,               // Input: Acknowledge for cascade_signal from cascade controller to reset the signal.
    input EOI,                              // Input: End of Interrupt signal.

    output reg INT = 0,                         // Output: Interrupt request will be sent to CPU.

    output reg read_IRR,                    // Output: Signal to read IRR status (sent to IRR).
    output reg read_priority,               // Output: Set after the first INTA pulse (sent to IRR and ISR).
    
    output reg freezing,                    // Output: Set between two INTA pulse.
    output reg INT_request_ACK=1'b0,        // Output: Acknowledge for INT_request flag.

    output reg read_IMR,                    // Output: Signal to read IMR status (sent to IMR).

    output reg send_vector_ISR,             // Output: Flag to allow ISR to send its Vector.
    output reg read_ISR,                    // Output: Signal to read ISR status ( will be sent to ISR).
    output reg pulse_ACK,                   // Output: Acknowledge will be sent to ISR.
    output reg second_ACK=0,                // Output: Determine that second INTA came (sent to ISR).
    
    output reg EOI_to_cascade,              // Output: Signal to cascade controller to reset cascade lines(in case of cascading mode and master).
    output reg cascade_signal,              // Output: Signal to cascade controller to start working (Master mode).
    output reg [2:0] desired_slave,         // Output: Slave ID that will be sent to cascade controller (Master mode).
    output reg cascade_flag_ACK=1'b0        // Output: Acknowledge for cascade flag (slave mode).
);
   // Configurations for read_ISR and read_IRR flags
    localparam read_from_ISR =2'b11;        // Local parameter representing read from ISR mode
    localparam read_from_IRR =2'b01;        // Local parameter representing read from IRR mode
    reg [1:0] read_register;
    // Determine which register to read from LS 3 bits    
    always @(OCW3)begin
        read_register=OCW3[1:0];
    end
    
    // Do configurations when recieving signal from read/write logic
    always @(posedge read_cmd_to_ctrl_logic) begin
        // Decide what flag to set based on OCW3 signal 
        case(read_register)
            read_from_ISR: begin
                read_ISR<=1'b1; // set read from ISR flag
                read_IRR<=1'b0; // reset read from IRR flag 
            end
            read_from_IRR: begin
                read_IRR<=1'b1; // set read from IRR flag
                read_ISR<=1'b0; // reset read from ISR flag
            end
            default: begin
                read_IRR<=1'b0; // reset read from IRR flag
                read_ISR<=1'b0; // reset read from ISR flag
            end
        endcase 
    end
    
    // Deactive flags to stop reading the IRR and ISR Registers
    always @(negedge read_cmd_to_ctrl_logic) begin
        read_ISR<=1'b0;
        read_IRR<=1'b0;
    end

    // Block to handle reading from IMR register when recieving signal from read/write logic
    always @(read_cmd_imr_to_ctrl_logic)
    begin
        // Activate read from IMR
        if(read_cmd_imr_to_ctrl_logic)
        begin
            read_IMR <= 1'b1;
        end
        // Deactivate read from IMR
        else
        begin
            read_IMR <= 1'b0;
        end
    end

    // Configurations for freezing and read_priority flags
    localparam first_INTA=1'b0;         // Local parameter representing first INTA
    localparam second_INTA=1'b1;        // Local parameter representing second INTA
    reg counter=0; //  Counter to determine first and second INTA
    // Do logic based on first or second acknowledge from CPU
    always@(negedge INTA)begin
        // if it's the first INTA set read_priority and freezing flags
        if(counter==first_INTA)begin
            read_priority=1'b1;
            freezing=1'b1;
            counter=counter+1;
            second_ACK=0;
        end
        // if it't the second INTA reset read_priority and freezing flags
        else if(counter==second_INTA)begin
            read_priority=1'b0;
            freezing=1'b0;
            counter=1'b0;
            second_ACK=1;
        end
    end

    // Handling INT request which will be sent to Processor
    // if there is any reading or writing operations we can't send any interrupt
    always@(posedge INT_request)begin
        // Set INT to cpu only if cpu isn't writing on PIC and ther's no reading status from any register
        if(write_flag == 1'b0)
        begin
            INT <= 1'b1;
        end
        INT_request_ACK = ~INT_request_ACK; // Send acknowledge for INT_request flag
    end

    // At end of interrupt send flag to cascade controller to set cascade lines to 3'bzzz to be ready for next interrupt
    // and reset INT flag.
    always @(posedge EOI)begin
        EOI_to_cascade=EOI;
        INT=0;
    end
    
    // Handling sending vector on data buffer for CPU
    localparam MASTER=1'b1;     // Local parameter representing current PIC is master
    localparam SLAVE=1'b0;      // Local parameter representing current PIC is slave
    always@(posedge second_ACK) // Start configurations on the secont INTA
    begin
        // Check bit no. 1 from ICW1 to determine if single or cascade mode 
        // In case of single mode: send flag to ISR to send vector of current interrupt to data buffer
        if(ICW1[1])begin
            send_vector_ISR=1;
            cascade_signal=0;
            read_ISR=0;
            read_IRR=0;
            read_IMR=0;
        end
        // In case of cascade mode: we must first check if the current PIC is master or slave
        // based on the SP signal sent from cascade controller.
        // In case of current pic is master: Check if the interrupt index is for slave or not
        // if it's for slave send flag to cascade controller with the slave ID to handle it
        else begin
            if(SP==MASTER)begin
                if(ICW3[interrupt_index])begin
                send_vector_ISR=0;
                cascade_signal=1;
                desired_slave=interrupt_index;
            end
            // if it's not for slave then send flag to ISR to send vector of current interrupt to data buffer
            else begin
                send_vector_ISR=1;
                cascade_signal=0;
                read_ISR=0;
                read_IRR=0;
                read_IMR=0;
            end
            end
            // In case of current pic is slave
            // must check if there's a flag from cascade controller that the current slave should send it's vector
            else if(SP==SLAVE)begin
                // There's coming flag from cascade controller then send the vector
                if(cascade_flag) begin
                    send_vector_ISR=1;
                    read_ISR=0;
                    read_IRR=0;
                    read_IMR=0;
                    cascade_flag_ACK=~cascade_flag_ACK; // send ACK for cascade_flag 
                end
                // There's not coming flag from cascade controller then dont send the vector (There's another slave will send)
                else begin
                    send_vector_ISR=0;
                end
            end       
            end
    end
    // reset flag sent to cascade controller when recieving acknowledge
    always @(cascade_signal_ACK)begin
        cascade_signal=1'b0;
    end
    // reset flag sent to ISR when recieving acknowledge
    always @(negedge read_cmd_to_ctrl_logic)begin
      if(second_ACK == 1) begin
        send_vector_ISR=1'b0;
        
      end
    end

    // reset read_priority flag when recieving acknowledge
    always@(read_priority_ACK)
    begin
        read_priority = 1'b0; 
    end

endmodule
