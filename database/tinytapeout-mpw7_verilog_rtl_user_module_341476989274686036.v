// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

module user_module_341476989274686036(
    input [7:0] io_in,
    output [7:0] io_out
    );
    
    localparam OP_NGA = 4'h0;
    localparam OP_AND = 4'h1;
    localparam OP_OR  = 4'h2;
    localparam OP_XOR = 4'h3;
    localparam OP_SLL = 4'h4;
    localparam OP_SRL = 4'h5;
    localparam OP_SRA = 4'h6;
    localparam OP_ADD = 4'h7;
    localparam OP_NOP = 4'h8;
    localparam OP_BEQ = 4'h9;
    localparam OP_BLE = 4'hA;
    localparam OP_JMP = 4'hB;
    localparam OP_LDA = 4'hC;
    localparam OP_LDB = 4'hD;
    localparam OP_STA = 4'hE;
    localparam OP_STB = 4'hF;
    
    wire clk = io_in[0];
    wire rst_p = io_in[1];
    wire[3:0] data_in = io_in[5:2];
    wire fast = io_in[7];
    
    wire wcyc;
    wire[6:0] addr;
    
    reg[3:0] reg_a;
    reg[3:0] reg_b;
    reg[6:0] tmp;
    reg[6:0] pc;
    
    reg[2:0] opcode_lsb;
        
    localparam STATE_ADDR  = 3'h0; //Fetch
    localparam STATE_OP    = 3'h1; //Execute
    localparam STATE_MEM1  = 3'h2; //AddrH
    localparam STATE_MEM2  = 3'h3; //AddrL
    localparam STATE_MEM3  = 3'h4; //Load or Put Write ADDR
    localparam STATE_MEM4  = 3'h5; //Write DATA
    reg[2:0] state;
    reg[2:0] next_state;

    always@(posedge clk or posedge rst_p) begin
        if(rst_p) begin
            opcode_lsb <= 0;
        end else begin
            if(next_state == STATE_OP)
                opcode_lsb <= 0;
            else if(state == STATE_OP) begin
                opcode_lsb <= data_in[2:0];
            end
        end
    end

    always@(posedge clk or posedge rst_p) begin
        if(rst_p) state <= STATE_ADDR;
        else state <= next_state;
    end 
    
    always@(*) begin
        next_state <= fast ? STATE_OP : STATE_ADDR;
        case(state)
            STATE_ADDR: next_state <= STATE_OP;
            STATE_OP: if(data_in[3] & |data_in[2:0]) next_state <= STATE_MEM1;
            STATE_MEM1: next_state <= STATE_MEM2;
            STATE_MEM2: if(opcode_lsb[2]) next_state <= STATE_MEM3;
            STATE_MEM3: if(opcode_lsb[1]) next_state <= STATE_MEM4;
        endcase
    end
    
    always@(posedge clk or posedge rst_p) begin
        if(rst_p) begin
            reg_a <= 0;
            reg_b <= 0;
        end else begin
            if(state == STATE_OP)
                case(data_in[2:0])
                    OP_AND: reg_a <= reg_a & reg_b;
                    OP_NGA: reg_a <= ~reg_a + 1;
                    OP_OR:  reg_a <= reg_a | reg_b;
                    OP_XOR: reg_a <= reg_a ^ reg_b;
                    OP_SLL: reg_a <= reg_a << reg_b[1:0];
                    OP_SRL: reg_a <= reg_a >> reg_b[1:0];
                    OP_SRA: reg_a <= reg_a >>> reg_b[1:0];
                    OP_ADD: reg_a <= reg_a + reg_b;
                endcase
            else if(state == STATE_MEM3 && !opcode_lsb[1])
                if(opcode_lsb[0]) reg_b <= data_in;
                else reg_a <= data_in;
        end
    end
    
    always@(posedge clk or posedge rst_p) begin
        if(rst_p)
            tmp <= 0;
        else if(state == STATE_MEM1) tmp[6:4] <= data_in[2:0];
        else if(state == STATE_MEM2) tmp[3:0] <= data_in;
    end    
    
    always@(posedge clk or posedge rst_p) begin
        if(rst_p) pc <= 0;
        else if(state == STATE_MEM2 && ((opcode_lsb[2:0]==OP_BLE[2:0]) && (reg_a <= reg_b))) pc <= pc + {tmp[6:4],data_in};
        else if(state == STATE_MEM2 && ((opcode_lsb[2:0]==OP_BEQ[2:0]) && (reg_a == reg_b))) pc <= pc + {tmp[6:4],data_in};
        else if(state == STATE_MEM2 && (opcode_lsb[2:0]==OP_JMP)) pc <= {tmp[6:4],data_in};
        else if(state == STATE_OP || state == STATE_MEM1 || state == STATE_MEM2) pc <= pc + 1;
    end
    
    assign wcyc = ((state == STATE_MEM3) || (state == STATE_MEM4)) & opcode_lsb[1];
    assign addr = ((state == STATE_MEM3) || (state == STATE_MEM4)) ? tmp : pc;
    assign io_out[6:0] = state == STATE_MEM4 ? (opcode_lsb[0] ? {3'b0,reg_b} : {3'b0,reg_a}) : addr;
    assign io_out[7] = wcyc;
    
endmodule
