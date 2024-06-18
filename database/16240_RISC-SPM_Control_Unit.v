// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

module Control_Unit #(
    parameter word_size = 8, op_size = 4, state_size = 4,
    parameter src_size = 2, dest_size = 2, Sel1_size = 3, Sel2_size = 2,
    // State Codes
    // reset is asserted 
    parameter S_idle = 0, 
    // load Addr_R with contents of PC
    S_fet1 = 1, // Addr_R := PC
    // load the content addressed by Addr_R into IR
    S_fet2 = 2, // IR := Addr_R
    // decode the IR
    S_dec = 3,
    // Execute ALU for single cycle instruction with conditional zero flag
    // load the result to destination register
    S_ex1 = 4, 
    // load the Addr_R second byte of RD(dest <= memory[Addr_R])
    S_rd1 = 5, 
    // load the destination register with the address given in S_rd1
    S_rd2 = 6, 
    // load the Addr_R second byte of WR(memory[Addr_R] <= dest) 
    S_wr1 = 7, 
    // load the destination register with the address given in S_wr1
    S_wr2 = 8,
    // load the Addr_R second byte of BR(PC <= memory[Addr_R])
    S_br1 = 9,
    // load the destination register with the address given in S_br1
    S_br2 = 10,
    // default to trap invalid instructions 
    S_halt = 11,
    // *Newly added state*
    // load the destination register with the literal and increment the PC
    S_ld = 12,  
    // Opcodes
    // Short Instructions
    parameter NOP = 0, ADD = 1, SUB = 2, AND = 3, NOT = 4,
    // Long Instructions
    parameter RD  = 5, WR =  6,  BR =  7, BRZ = 8,
    // Newly added Instructions 
    parameter EQZ = 9,  LDR = 10,
    // Source and Destination Codes  
    parameter R0 = 0, R1 = 1, R2 = 2, R3 = 3
) (
    output reg Load_R0,Load_R1, Load_R2, Load_R3, 
    output reg Load_PC, Inc_PC, 
    output [Sel1_size-1:0] Sel_Bus_1_Mux, 
    output [Sel2_size-1: 0] Sel_Bus_2_Mux,
    output reg Load_IR, Load_Add_R, Load_Reg_Y, Load_Reg_Z, 
    output reg write, 
    input [word_size-1: 0] instruction, 
    input zero, clk, rst
);
    // state registers
    reg [state_size-1: 0] state, next_state;
    // select lines
    reg Sel_ALU, Sel_Bus_1, Sel_Mem;
    reg Sel_R0, Sel_R1, Sel_R2, Sel_R3, Sel_PC;
    // Used for de-bug in simulation	
    reg err_flag;
    // instruction format (opcode,source,destination)
    wire [op_size-1:0] opcode = instruction [word_size-1: word_size - op_size];
    wire [src_size-1: 0] src = instruction [src_size + dest_size -1: dest_size];
    wire [dest_size-1:0] dest = instruction [dest_size -1:0];


    // Mux selectors
    assign  Sel_Bus_1_Mux[Sel1_size-1:0] = Sel_R0 ? 0:
        Sel_R1 ? 1:
        Sel_R2 ? 2:
        Sel_R3 ? 3:
        Sel_PC ? 4: 3'bx;  // 3-bits, sized number

    assign  Sel_Bus_2_Mux[Sel2_size-1:0] = Sel_ALU ? 0:
        Sel_Bus_1 ? 1:
        Sel_Mem ? 2: 2'bx;

    // State transition logic
    always @ (posedge clk or negedge rst) begin: State_transitions
        if (rst == 0) 
            state <= S_idle; 
        else 
            state <= next_state;
    end

    // Output and Next State Decoder 

    /*  always @ (state or instruction or zero) begin:  Output_and_next_state	
    
    !NOTE: 
        The above event control expression leads to incorrect 
        operation.  The state transition causes the activity to be 
        evaluated once, then the resulting instruction change causes 
        it to be evaluated again, but with the residual value of opcode.
        On the second pass the value seen is the value opcode had before 
        the state change, which results in Sel_PC = 0 in state 3, which 
        will cause a return to state 1 at the next clock.  Finally, 
        opcode is changed, but this does not trigger a re-evaluation 
        because it is not in the event control expression.  
        So, the caution is to be sure to use opcode in the event control 
        expression. That way, the final execution of the behavior uses
         the value of opcode that results from the state change, and 
         leads to the correct value of Sel_PC.
    */ 

    
    always @ (state or opcode or zero) begin: Output_and_next_state 
        // Initialize all the signals
        Sel_R0 = 0; Sel_R1 = 0; Sel_R2 = 0; Sel_R3 = 0; Sel_PC = 0;
        Load_R0 = 0; Load_R1 = 0; Load_R2 = 0; Load_R3 = 0;	Load_PC = 0;
        Load_IR = 0; Load_Add_R = 0; Load_Reg_Y = 0; Load_Reg_Z = 0;
        Inc_PC = 0; 
        Sel_Bus_1 = 0; 
        Sel_ALU = 0; 
        Sel_Mem = 0; 
        write = 0; 
        err_flag = 0;	
        next_state = state;

        case(state)

        S_idle: next_state = S_fet1;

        S_fet1: begin       	  	  	
            next_state = S_fet2; 
            Sel_PC = 1;
            Sel_Bus_1 = 1;
            Load_Add_R = 1; 
        end
        
        S_fet2: begin 		
            next_state = S_dec; 
            Sel_Mem = 1;
            Load_IR = 1; 
            Inc_PC = 1;
        end

        S_dec:  	 	
            case(opcode) 
                // Short Instruction
                // No Operation
                NOP: next_state = S_fet1;
                // ADD, SUB, AND
                ADD, SUB, AND, EQZ: begin
                    next_state = S_ex1;
                    Sel_Bus_1 = 1;
                    Load_Reg_Y = 1;
                    case(src)
                        R0: Sel_R0 = 1; 
                        R1: Sel_R1 = 1; 
                        R2: Sel_R2 = 1;
                        R3: Sel_R3 = 1; 
                        default : err_flag = 1;
                    endcase   
                end
                // dest <= ~src
                NOT: begin
                    next_state = S_fet1;
                    Load_Reg_Z = 1;
                    Sel_Bus_1 = 1; //! Typing error
                    Sel_ALU = 1; 
                    case(src)
                        R0: Sel_R0 = 1;			      
                        R1: Sel_R1 = 1;
                        R2: Sel_R2 = 1;			      
                        R3: Sel_R3 = 1; 
                        default : err_flag = 1;
                    endcase   

                    case(dest)
                        R0: Load_R0 = 1; 
                        R1: Load_R1 = 1;			      
                        R2: Load_R2 = 1;
                        R3: Load_R3 = 1;			      
                        default: err_flag = 1;
                    endcase   
                end
                // dest <= memory[Addr_R]  
                RD: begin
                    next_state = S_rd1;
                    Sel_PC = 1; Sel_Bus_1 = 1; Load_Add_R = 1; 
                end 
                // dest <= memory[Addr_R]  
                WR: begin
                    next_state = S_wr1;
                    Sel_PC = 1; Sel_Bus_1 = 1; Load_Add_R = 1; 
                end
                // PC <= memroy[Addr_R]
                BR: begin 
                    next_state = S_br1;  
                    Sel_PC = 1; Sel_Bus_1 = 1; Load_Add_R = 1; 
                end
                // PC <= memroy[Addr_R] if zero_flag
                BRZ: 
                    if (zero == 1) begin
                        next_state = S_br1; 
                        Sel_PC = 1; 
                        Sel_Bus_1 = 1; 
                        Load_Add_R = 1; 
                    end
                    else begin 
                        next_state = S_fet1; 
                        Inc_PC = 1; 
                    end
                // dest <= 8'b????_????  
                LDR: begin
                    next_state = S_ld;
                    Sel_PC = 1; Sel_Bus_1 = 1; Load_Add_R = 1; 
                end 
                    default : next_state = S_halt;
            endcase // (opcode)

        S_ex1: begin 
            next_state = S_fet1;
            Load_Reg_Z = 1;
            Sel_ALU = 1; 
            case(dest)
                R0: begin Sel_R0 = 1; Load_R0 = 1; end
                R1: begin Sel_R1 = 1; Load_R1 = 1; end
                R2: begin Sel_R2 = 1; Load_R2 = 1; end
                R3: begin Sel_R3 = 1; Load_R3 = 1; end
                default : err_flag = 1; 
            endcase  
        end 

        S_rd1: begin 
            next_state = S_rd2;
            Sel_Mem = 1;
            Load_Add_R = 1; 
            Inc_PC = 1;
        end

        S_wr1: begin
            next_state = S_wr2;
            Sel_Mem = 1;
            Load_Add_R = 1; 
            Inc_PC = 1;
        end 

        S_rd2: begin 
            next_state = S_fet1;
            Sel_Mem = 1;
            case(dest) 
                R0: Load_R0 = 1; 
                R1: Load_R1 = 1; 
                R2: Load_R2 = 1; 
                R3: Load_R3 = 1; 
                default : err_flag = 1;
            endcase  
        end

        S_wr2: begin 
            next_state = S_fet1;
            write = 1;
            case(src)
                R0: Sel_R0 = 1;		 	    
                R1: Sel_R1 = 1;		 	    
                R2: Sel_R2 = 1; 		 	    
                R3: Sel_R3 = 1;			    
                default : err_flag = 1;
            endcase  
        end

        S_br1: begin 
            next_state = S_br2; 
            Sel_Mem = 1; 
            Load_Add_R = 1; 
        end

        S_br2: begin 
            next_state = S_fet1; 
            Sel_Mem = 1; 
            Load_PC = 1; 
        end

        S_halt: next_state = S_halt;

        S_ld: begin 
            next_state = S_fet1;
            Sel_Mem = 1;
            Inc_PC = 1;
            case(dest) 
                R0: Load_R0 = 1; 
                R1: Load_R1 = 1; 
                R2: Load_R2 = 1; 
                R3: Load_R3 = 1; 
                default : err_flag = 1;
            endcase  
        end

        default: next_state = S_idle;

        endcase  

  end
  
endmodule