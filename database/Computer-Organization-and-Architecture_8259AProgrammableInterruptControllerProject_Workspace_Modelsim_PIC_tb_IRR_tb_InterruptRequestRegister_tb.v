// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module InterruptRequestRegister_tb;

    // Inputs
    reg [7:0] IR0_to_IR7;      // Input: Interrupt requests from IR0 to IR7.
    reg [7:0] bitToMask;       // Input: Masking bits from IMR for corresponding IRs.
    reg readPriority;          // Input: Read priority signal from control logic.
    reg readIRR;               // Input: Signal to output IRR values to data buffer.
    reg [2:0] resetIRR;        // Input: Signal from priority resolver to reset serviced interrupts.
    reg [7:0] ICW1;            // Input: For Initialization Command Word 1

    
    // Outputs
    wire [7:0] risedBits;      // Output: Rised bits indicating valid interrupts.
    wire [7:0] dataBuffer;     // Output: Buffer for interrupts reset by resetIRR.
    wire readPriorityAck;       // Output: Acknowledge signal for readPriority
    

    // Instantiate the InterruptRequestRegister module
    InterruptRequestRegister irr_inst (
        .IR0_to_IR7(IR0_to_IR7),
        .bitToMask(bitToMask),    
        .readPriority(readPriority),
        .readIRR(readIRR),
        .resetIRR(resetIRR),
        .ICW1(ICW1),
        .risedBits(risedBits),
        .dataBuffer(dataBuffer),
        .readPriorityAck(readPriorityAck)
    );

    integer num_random_test_cases = 10;
    integer i;

    // Stimulus
    initial begin
        $dumpfile("irr_tb.vcd"); // Define output VCD file
        $dumpvars(0, InterruptRequestRegister_tb); // Dump variables for simulation

        // Test case 1: No interrupts, all masked
        i = 0;
        IR0_to_IR7 = $urandom; // Generate random value for IR0_to_IR7
        bitToMask = $urandom; // Generate random value for bitToMask
        readPriority = $urandom_range(0, 1); // Random value for readPriority
        readIRR = $urandom_range(0, 1); // Random value for readIRR
        resetIRR = $urandom_range(0, 7); // Random value for resetIRR
        ICW1 = $urandom; // Randomize ICW1
        #10;// Delay to observe the behavior

        // Test case 2: Simulate interrupts and mask conditions
        i = 1;
        IR0_to_IR7 = $urandom; // Generate random value for IR0_to_IR7
        bitToMask = $urandom; // Generate random value for bitToMask
        readPriority = $urandom_range(0, 1); // Random value for readPriority
        readIRR = $urandom_range(0, 1); // Random value for readIRR
        resetIRR = $urandom_range(0, 7); // Random value for resetIRR
        ICW1 = $urandom; // Randomize ICW1
        #10;// Delay to observe the behavior

        // Test case 3: Testing the behavior when readPriority is set and resetIRR is applied
        i = 2; // Set test case number
        IR0_to_IR7 = 8'b01101010; // Simulate specific interrupt requests
        bitToMask = 8'b10110100; // Mask certain interrupts
        readPriority = 1'b1; // Activate read priority
        readIRR = $urandom_range(0, 1); // Randomize readIRR
        resetIRR = 6; // Apply reset to a specific interrupt
        ICW1 = 8'b00001000; // Set LTIM bit to 1 or 0 according to requirements
        #5 readPriority = 1'b1; // Activate read priority
        #10; // Delay to observe the behavior

        for (i = 3; i < num_random_test_cases; i = i + 1) begin
            // Generate random values for inputs
            IR0_to_IR7 = $urandom; // Random value for IR0_to_IR7
            bitToMask = $urandom; // Random value for bitToMask
            readPriority = $urandom_range(0, 1); // Random value for readPriority
            readIRR = $urandom_range(0, 1); // Random value for readIRR
            resetIRR = $urandom_range(0, 7); // Random value for resetIRR
            ICW1 = $urandom; // Randomize ICW1
            #10; // Add delay for each test case
        end

        $finish; // End simulation
    end

endmodule

