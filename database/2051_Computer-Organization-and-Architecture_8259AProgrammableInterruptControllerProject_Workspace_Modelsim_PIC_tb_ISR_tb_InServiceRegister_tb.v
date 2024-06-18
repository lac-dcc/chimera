// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module InServiceRegister_tb;

    // Inputs
    reg [2:0] toSet;                    // Signals indicating which interrupts to service (IR0-IR7)
    reg readPriority;                   // Signal to read values from toSet
    reg readIsr;                        // Signal to output value of isrReg to IsrRegValue
    reg sendVector;                     // Signal to output vectorTable value to dataBuffer
    reg [2:0] zeroLevelIndex;           // Signals indicating IRx with highest priority
    reg [7:0] ICW2, ICW4, OCW2;         // Initialization Command Words and Operation Command Word
    reg secondACK;                      // Second acknowledge signal
    reg changeInOCW2;                   // Signal indicating change in OCW2

    // Outputs
    wire [2:0] INTIndex;                // Signals indicating which interrupts to service (IR0-IR7)
    wire [7:0] dataBuffer, isrRegValue; // Value of isrReg to dataBuffer and PriorityResolver
    wire [2:0] resetedIndex;            // Signal indicating end of interrupt mode
    wire sendVectorAck;                 // Signal to acknowledge sendVector
    wire readPriorityAck;               // Signal to acknowledge readPriority


    // Instantiate the module
    InServiceRegister isr_inst (
        .toSet(toSet),
        .readPriority(readPriority),
        .readIsr(readIsr),
        .sendVector(sendVector),
        .zeroLevelIndex(zeroLevelIndex),
        .ICW2(ICW2),
        .ICW4(ICW4),
        .secondACK(secondACK),
        .changeInOCW2(changeInOCW2),
        .OCW2(OCW2),
        .INTIndex(INTIndex),
        .dataBuffer(dataBuffer),
        .isrRegValue(isrRegValue),
        .resetedIndex(resetedIndex),
        .sendVectorAck(sendVectorAck),
        .readPriorityAck(readPriorityAck)
    );

    integer num_random_test_cases = 10;
    integer i;

    // Stimulus
    initial begin
        /**
          * Set initial values for specific test cases: this test case to check the Automatic EOI in with the zeroLevelIndex
          * at the first level (IR0) and the reseted bit at index 3 in the isrReg
          */ 
        i = 0;
        toSet = 3'b11; 
        readPriority = 1'b1;
        readIsr = 1'b1;
        sendVector = 1'b0;
        secondACK = 1'b1;
        changeInOCW2 = 1'b0;
        zeroLevelIndex = 3'b0; 
        ICW2 = 8'b11101101; 
        ICW4 = 8'b11101110; 
        OCW2 = 8'b11101001; 
        #10; // Add a delay to observe the behavior of the module

        /**
          * Set initial values for specific test cases: this test case to check the Automatic EOI in with the zeroLevelIndex
          * after the reseted bit index in the isrReg to check for the circular iteration is work or not.
          */ 
        i = 1;
        toSet = 3'b11; 
        readPriority = 1'b1;
        readIsr = 1'b1;
        sendVector = 1'b0;
        secondACK = 1'b1;
        changeInOCW2 = 1'b0;
        zeroLevelIndex = 3'b100; 
        ICW2 = 8'b11101101; 
        ICW4 = 8'b11101110; 
        OCW2 = 8'b11101001; 
        #10; // Add a delay to observe the behavior of the module

        /**
         * to test if the isrReg is 0 and the control logic ask to send the vector of the serviced IR, in this case
         * we should send the vector of the IR7
         */
        i = 2;
        toSet = 3'b11; 
        readPriority = 1'b1;
        readIsr = 1'b0;
        sendVector = 1'b1;
        secondACK = 1'b1;
        changeInOCW2 = 1'b1;
        zeroLevelIndex = 3'b111; 
        ICW2 = 8'b11101101; 
        ICW4 = 8'b11101110; 
        OCW2 = 8'b11101001; 
        #10; // Add a delay to observe the behavior of the module

        // Randomize input values for remaining test cases
        for (i = 3; i < num_random_test_cases; i = i + 1) begin
            // Adjust the numeric literals to remove redundant leading zeros
            toSet = $urandom_range(0, 7); // Random value for toSet
            readPriority = $urandom_range(0, 1);
            zeroLevelIndex = $urandom_range(0, 7); // Random value for zeroLevelIndex
            ICW2 = $urandom; // Random value for ICW2
            ICW4 = $urandom; // Random value for ICW4
            secondACK = $urandom_range(0, 1); // Random value for secondACK
            changeInOCW2 = $urandom_range(0, 1); // Random value for changeInOCW2
            OCW2 = $urandom; // Random value for OCW2

            // Ensure readIsr and sendVector are not asserted together
            readIsr = $urandom_range(0, 1); // Random value for readIsr
            sendVector = (~readIsr) & $urandom_range(0, 1);

            // Observe the behavior with these randomized inputs
            #10; // Add a delay to observe the behavior of the module
        end

        $finish; // End simulation
    end

endmodule