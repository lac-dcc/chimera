// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module InterruptRequestRegister (
    input [7:0] IR0_to_IR7,            // Input: Interrupt requests from IR0 to IR7.
    input [7:0] bitToMask,             // Input: Masking bits from IMR for corresponding IRs.
    input readPriority,                // Input: Read priority signal from control logic.
    input readIRR,                     // Input: Signal to output IRR values to data buffer.
    input [2:0] resetIRR,              // Input: Signal from priority resolver to reset serviced interrupts.
    input [7:0] ICW1,                  // Input: Initialization Command Word 1 with LTIM bit.

    output reg [7:0] risedBits = 8'b0, // Output: Rised bits indicating valid interrupts.
    output reg [7:0] dataBuffer,       // Output: Buffer for interrupts reset by resetIRR.
    output reg readPriorityAck = 1'b0 // Output: Acknowledge signal for readPriority.
);

    // Internal register to hold the current state of interrupts
    reg [7:0] interruptState;

    // Determine operating mode based on ICW1's LTIM bit
    reg levelTriggered;
    
    // Logic to handle valid interrupts and reset based on readPriority and resetIRR signals
    // For edge-triggered interrupts
    always @(posedge IR0_to_IR7, bitToMask) begin
	levelTriggered = ICW1[3];
        if (!levelTriggered) begin
            // Combine interrupt requests with mask bits to find valid interrupts
            // Valid interrupts have a '0' in bitToMask corresponding to '1' in IR signals
            interruptState = IR0_to_IR7 & ~bitToMask;
        end
    end

    // For level-triggered interrupts
    always @(IR0_to_IR7, bitToMask) begin
	levelTriggered = ICW1[3];
        if (levelTriggered) begin
            // Combine interrupt requests with mask bits to find valid interrupts
            // Valid interrupts have a '0' in bitToMask corresponding to '1' in IR signals
            interruptState = IR0_to_IR7 & ~bitToMask;
        end
    end

    // Logic to handle resetting interrupts based on readPriority and resetIRR signals
    always @(posedge readPriority) begin
        // Reset corresponding interrupts in IRR based on priority resolution and resetIRR value
        if (resetIRR != 0) begin
            interruptState = interruptState & ~(1 << resetIRR);
        end else begin
            interruptState[0] = 0; // Reset IR0 when resetIRR is '0'
        end
        // Toggle readPriorityAck to indicate acknowledgment
        readPriorityAck <= ~readPriorityAck;
    end

    // Storing interrupts in dataBuffer when readIRR is asserted
    always @* begin
        if (readIRR) begin
            dataBuffer = interruptState;
        end else begin
            dataBuffer = 8'bZ; // Output high-impedance state when readIRR is inactive
        end
    end

    // Output the detected active interrupts in risedBits
    always @(*) begin
        risedBits = interruptState;
    end

endmodule
