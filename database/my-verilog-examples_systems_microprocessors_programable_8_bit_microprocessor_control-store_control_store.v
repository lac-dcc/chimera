// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor control store
// Where the microcode is kept.
// 256 microwords (24-bits wide).

module control_store (
    input  [7:0]    microaddress,    // ADDRESS
    output [23:0]   microword        // WORD
);

// THE MICROWORD FIELDS
reg [3:0]     MICRO_AD_LOW;          // [3:0]
reg [7:4]     MICRO_AD_HIGH;         // [7:4]
reg           COUNT;                 // [8]
reg [12:9]    BOP;                   // [12:9]
wire [23:11]  control_bits;
reg              A_SOURCE;           // [13]
reg              B_SOURCE;           // [14]
reg [19:15]      ALU_FUNC;           // [19:15]
reg              CIN;                // [20]
reg [23:21]      ALU_DEST;           // [23:21]

assign control_bits = {ALU_DEST, CIN, ALU_FUNC, B_SOURCE, A_SOURCE};
assign microword = {control_bits, BOP, COUNT, MICRO_AD_HIGH, MICRO_AD_LOW};

always @ (microaddress) begin
    case (microaddress)

        // 8'h00 - RESET - WAIT FOR GO ************************************************************************
        8'h00: begin // START RESET - Flash 11 output
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD (DEFAULT)
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hB;        // OB
        end
        8'h0B: begin // LOAD TEMP REGSITERS WITH 1s - Just so the alu has a known value going into it
            ALU_DEST <= 3'b100;                                 // TB_TA
            CIN <= 1'b0;                                        // NO_CARRY
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'h0C: begin // COUNT - Flash 00 output
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD (DEFAULT)
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'h0D: begin // WAIT FOR GO_BAR - Output is F's  
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0100;                                     // G0_BAR
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD (DEFAULT)
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hD;        // OD (LOOP)
        end
        8'h0E: begin // GET OPCODE
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b1111;                                     // OPCODE (ALSO LOADS INPUT REG)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD (DEFAULT)
            MICRO_AD_HIGH <= 4'hF; MICRO_AD_LOW <= 4'h1;        // X1 - The opcode will be the high
        end

        // 8'h01 - OPCODE 0000 *********************************************************************************

        // 8'h11 - OPCODE 0001 *********************************************************************************

        // 8'h21 - OPCODE 0010 ********************************************************************************

        // 8'h31 - OPCODE 0011 - ADD **************************************************************************
        8'h31: begin // ADD AND WAIT FOR GO TO RELEASE - THEN RESET
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b01001;                               // A_PLUS_B
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_B, INPUT_A 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'h32: begin // WAIT FOR GO TO BE RELEASED
            ALU_DEST <= 3'b111;                                 // NONE (DEFAULT) 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X
            BOP <= 4'b1100;                                     // !GO_BAR
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h3; MICRO_AD_LOW <= 4'h2;        // 32 (LOOP)
        end
        8'h33: begin // GOTO RESET - FLASH 00
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hD;        // OD (TO RESET)
        end

        // 8'h41 - OPCODE 0100 *********************************************************************************

        // 8'h51 - OPCODE 0101 *********************************************************************************

        // 8'h61 - OPCODE 0110 *********************************************************************************

        // 8'h71 - OPCODE 0111 - SUBTRACT **********************************************************************
        8'h71: begin // SUBTRACT AND WAIT FOR GO TO RELEASE - THEN RESET
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b1;                                        // CARRY
            ALU_FUNC <= 5'b00110;                               // A_MINUS_B (MUST HAVE CARRY)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_B, INPUT_A 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'h72: begin // WAIT FOR GO TO BE RELEASED
            ALU_DEST <= 3'b111;                                 // NONE (DEFAULT) 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X
            BOP <= 4'b1100;                                     // !GO_BAR
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h7; MICRO_AD_LOW <= 4'h2;        // 72 (LOOP)
        end
        8'h73: begin // GOTO RESET - FLASH 00
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hD;        // OD (TO RESET)
        end

        // 8'h81 - OPCODE 1000 *********************************************************************************

        // 8'h91 - OPCODE 1001 *********************************************************************************

        // 8'hA1 - OPCODE 1010 *********************************************************************************

        // 8'hB1 - OPCODE 1011 *********************************************************************************

        // 8'hC1 - OPCODE 1100 - MULTIPLY **********************************************************************
        // THE CONCEPT IS TEMP_REGISTER_A WILL START WITH DATA_IN_B AND COUNT DOWN TO 0
        // AND TEMP_REGISTER_B WILL JUST ADD DATA_IN_A TO ITSELF UNTIL THE COUNT DOWN IS 0
        8'hC1: begin // LOAD 0 (CLEAR) TO TEMP_REGISTER_B
            ALU_DEST <= 3'b101;                                 // TB
            CIN <= 1'b0;                                        // NO_CARRY
            ALU_FUNC <= 5'b10011;                               // 0
            B_SOURCE <= 1'b0; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hC2: begin // CHECK IF REGISTER B = 0 WE ARE DONE - (1st LOAD F with B)
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY
            ALU_FUNC <= 5'b11010;                               // B
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_B, X  
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hC3: begin // CHECK IF REGISTER B = 0 WE ARE DONE (2nd CHECK OUTPUT F is ALL 0s (zp_bar))
                     // ALSO LOAD TEMP A WITH INPUT B
            ALU_DEST <= 3'b110;                                 // TA
            CIN <= 1'b0;                                        // NO_CARRY
            ALU_FUNC <= 5'b11010;                               // B
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_B, X
            BOP <= 4'b1101;                                     // !ZP (all O's from F)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'hC; MICRO_AD_LOW <= 4'h7;        // C7
        end
        8'hC4: begin // TEMP_REGISTER_A -1 => TEMP_REGISTER_A (WE NEED TO SET UP THE COUNTER WITH 1 LESS - TRUST ME)
            ALU_DEST <= 3'b010;                                 // F_TA 
            CIN <= 1'b0;                                        // NO_CARRY
            ALU_FUNC <= 5'b01111;                               // A_MINUS_1
            B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;                  // X, TEMP_A
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        // -------------------------------------------------------------------------------------
        // OK - LETS KEEP ADDING A FOR HOW MANY TIMES OF B  
                8'hC5: begin // REGISTER_A + TEMP_REGISTER_B => TEMP_REGISTER_B
                    ALU_DEST <= 3'b101;                                 // TB
                    CIN <= 1'b0;                                        // NO_CARRY
                    ALU_FUNC <= 5'b01001;                               // A_PLUS_B
                    B_SOURCE <= 1'b0; A_SOURCE<= 1'b1;                  // TEMP_B, INPUT_A
                    BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                    COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                    MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
                end
                8'hC6: begin // DECREMENT TEMP_REGISTER_A AND CHECK FOR 0 IN REGISTER_F
                    ALU_DEST <= 3'b010;                                 // F_TA 
                    CIN <= 1'b0;                                        // NO_CARRY
                    ALU_FUNC <= 5'b01111;                               // A_MINUS_1
                    B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;                  // X, TEMP_A 
                    BOP <= 4'b0101;                                     // ZP (all O's from F)
                    COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                    MICRO_AD_HIGH <= 4'hC; MICRO_AD_LOW <= 4'h5;        // C5
                end
        // --------------------------------------------------------------------------------------        
        8'hC7: begin // WAIT FOR GO TO BE RELEASED
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY
            ALU_FUNC <= 5'b11010;                               // B
            B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;                  // TEMP_B, X 
            BOP <= 4'b1100;                                     // !GO_BAR
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'hC; MICRO_AD_LOW <= 4'h7;        // C7 (LOOP)
        end
        8'hC8: begin // GOTO RESET - FLASH 00
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hD;        // OD (TO RESET)
        end

        // 8'hD1 - OPCODE 1101 *********************************************************************************

        // 8'hE1 - OPCODE 1110 - DIVIDE ************************************************************************
        8'hE1: begin // LOAD DIVIDEND INTO TEMP_REGISTER_A
            ALU_DEST <= 3'b110;                                 // TA 
            CIN <= 1'b0;                                        // NO_CARRY
            ALU_FUNC <= 5'b00000;                               // A
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, INPUT_A
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hE2: begin // CHECK FOR OVERFLOW - is DIVIDEND EQUAL TOO OR HIGHER THAN DIVISOR - HENCE, SUBTRACT AND LOOK AT C8 (COOL TRICK)
            ALU_DEST <= 3'b111;                                 // NONE (DEFAULT) 
            CIN <= 1'b1;                                        // CARRY (We need this for the equal too)
            ALU_FUNC <= 5'b00110;                               // A_MINUS_B_MINUS_1
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // INPUT_B, TEMP_A
            BOP <= 4'b0011;                                     // C8 (If it's 1 ABORT - ELSE CONTINUE)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'hF; MICRO_AD_LOW <= 4'h0;        // F0 (ABORT)
        end
        // --------------------------------------------------------------------------------------  
        // NOW LETS DO THE LOOP 4 TIMES - WE DON'T HAVE A COUNT SO WE JUST COPY/PASTE

        // FIRST LOOP
            8'hE3: begin // SHIFT DIVIDEND TEMP_REGISTER_A LEFT
                ALU_DEST <= 3'b110;                                 // TA
                CIN <= 1'b0;                                        // NO_CARRY
                ALU_FUNC <= 5'b01100;                               // A PLUS A (bit shift)
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // X, TEMP_A
                BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
            end
            8'hE4: begin // CHECK is DIVIDEND EQUAL TOO OR HIGHER THAN DIVISOR - HENCE, SUBTRACT AND LOOK AT C8 (COOL TRICK)
                ALU_DEST <= 3'b111;                                 // NONE (DEFAULT) 
                CIN <= 1'b1;                                        // CARRY (We need this for the equal too)
                ALU_FUNC <= 5'b00110;                               // A_MINUS_B_MINUS_1
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // INPUT_B, TEMP_A
                BOP <= 4'b1011;                                     // !C8 (If it's 0 THEN JUMP TO 2nd LOOP - ELSE CONTINUE)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'hE; MICRO_AD_LOW <= 4'h7;        // E7 JUMP TO SECOND LOOP
            end
            8'hE5: begin // DIVIDEND = DIVIDEND - DIVISOR
                ALU_DEST <= 3'b110;                                 // TA
                CIN <= 1'b1;                                        // CARRY
                ALU_FUNC <= 5'b00110;                               // A_MINUS_B_MINUS_1 (MUST HAVE CARRY)
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // INPUT_B, TEMP_A
                BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
            end        
            8'hE6: begin // ADD ONE TO DIVIDEND
                ALU_DEST <= 3'b110;                                 // TA
                CIN <= 1'b1;                                        // CARRY 
                ALU_FUNC <= 5'b00000;                               // A
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // X, TEMP_A
                BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
            end

        // SECOND LOOP
            8'hE7: begin // SHIFT DIVIDEND TEMP_REGISTER_A LEFT
                ALU_DEST <= 3'b110;                                 // TA
                CIN <= 1'b0;                                        // NO_CARRY
                ALU_FUNC <= 5'b01100;                               // A PLUS A (bit shift)
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // X, TEMP_A
                BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
            end
            8'hE8: begin // CHECK is DIVIDEND EQUAL TOO OR HIGHER THAN DIVISOR - HENCE, SUBTRACT AND LOOK AT C8 (COOL TRICK)
                ALU_DEST <= 3'b111;                                 // NONE (DEFAULT) 
                CIN <= 1'b1;                                        // CARRY (We need this for the equal too)
                ALU_FUNC <= 5'b00110;                               // A_MINUS_B_MINUS_1
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // INPUT_B, TEMP_A
                BOP <= 4'b1011;                                     // !C8 (If it's 0 THEN JUMP TO 3rd LOOP - ELSE CONTINUE)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'hE; MICRO_AD_LOW <= 4'hB;        // EB JUMP TO THIRD LOOP
            end
            8'hE9: begin // DIVIDEND = DIVIDEND - DIVISOR
                ALU_DEST <= 3'b110;                                 // TA
                CIN <= 1'b1;                                        // CARRY
                ALU_FUNC <= 5'b00110;                               // A_MINUS_B_MINUS_1 (MUST HAVE CARRY)
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // INPUT_B, TEMP_A
                BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
            end        
            8'hEA: begin // ADD ONE TO DIVIDEND
                ALU_DEST <= 3'b110;                                 // TA
                CIN <= 1'b1;                                        // 1 
                ALU_FUNC <= 5'b00000;                               // A
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // X, TEMP_A
                BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
            end

        // THRID LOOP
            8'hEB: begin // SHIFT DIVIDEND TEMP_REGISTER_A LEFT
                ALU_DEST <= 3'b110;                                 // TA
                CIN <= 1'b0;                                        // NO_CARRY
                ALU_FUNC <= 5'b01100;                               // A PLUS A (bit shift)
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // X, TEMP_A
                BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
            end
            8'hEC: begin // CHECK is DIVIDEND EQUAL TOO OR HIGHER THAN DIVISOR - HENCE, SUBTRACT AND LOOK AT C8 (COOL TRICK)
                ALU_DEST <= 3'b111;                                 // NONE (DEFAULT) 
                CIN <= 1'b1;                                        // CARRY (We need this for the equal too)
                ALU_FUNC <= 5'b00110;                               // A_MINUS_B_MINUS_1
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // INPUT_B, TEMP_A
                BOP <= 4'b1011;                                     // !C8 (If it's 0 THEN JUMP TO END - ELSE CONTINUE)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'hE; MICRO_AD_LOW <= 4'hF;        // EF JUMP TO END
            end
            8'hED: begin // DIVIDEND = DIVIDEND - DIVISOR
                ALU_DEST <= 3'b110;                                 // TA
                CIN <= 1'b1;                                        // CARRY
                ALU_FUNC <= 5'b00110;                               // A_MINUS_B_MINUS_1 (MUST HAVE CARRY)
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // INPUT_B, TEMP_A
                BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
            end        
            8'hEE: begin // ADD ONE TO DIVIDEND
                ALU_DEST <= 3'b110;                                 // TA
                CIN <= 1'b1;                                        // CARRY 
                ALU_FUNC <= 5'b00000;                               // A
                B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // X, TEMP_A
                BOP <= 4'b0110;                                     // COUNT (DEFAULT)
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
            end    

        // LOOP DONE JUMP TO END
            8'hEF: begin // WRITE TEMP_REGISTER_A to F AND JUMP TO END
                ALU_DEST <= 3'b011;                                 // F
                CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
                ALU_FUNC <= 5'b00000;                               // A
                B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;                  // X, TEMP_A
                BOP <= 4'b1001;                                     // BRANCH ALWAYS
                COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
                MICRO_AD_HIGH <= 4'hF; MICRO_AD_LOW <= 4'h1;        // F1
            end

        // --------------------------------------------------------------------------------------  
        8'hF0: begin // PART OF ABORT - WRIE ALL 1's to F
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b0;                  // X, X
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end

        // --------------------------------------------------------------------------------------  
        8'hF1: begin // WAIT FOR GO TO BE RELEASED
            ALU_DEST <= 3'b111;                                 // NONE (DEFAULT)
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b00000;                               // A
            B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;                  // X, X
            BOP <= 4'b1100;                                     // !GO_BAR
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'hF; MICRO_AD_LOW <= 4'h1;        // F1 (LOOP)
        end
        8'hF2: begin // GOTO RESET - FLASH 00
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hD;        // OD (TO RESET)
        end

        // 8'hF1 - OPCODE 1111 *********************************************************************************
        // NOT USABLE - THIS IS PART OF DIVIDE AND JAM

        // 8'hFF - JAM *****************************************************************************************
        // WHEN JAM INPUT ENABLED - JUST FLASH FF A FEW TIMES, WHY?  FUN FUN
        8'hFF:  begin // FLASH 1 - WILL HOLD HERE AS LONG AS JAM IS ENABLED
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'hF; MICRO_AD_LOW <= 4'h6;        // F6
        end
        8'hF6: begin // FLASH 0
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hF7: begin // FLASH 1
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hF8: begin // FLASH 0
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hF9: begin // FLASH 1
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hFA: begin // FLASH 0
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hFB: begin // FLASH 1
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hFC: begin // FLASH 0
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hFD: begin // FLASH 1
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'hFE: begin // FLASH 0
            ALU_DEST <= 3'b011;                                 // F
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // 00 (TO START OF RESET)
        end

        // DEFAULT *********************************************************************************************
        default: begin // KICK BACK TO START OF RESET
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // X, X 
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // 00 (TO START OF RESET)
        end

    endcase
end

endmodule
