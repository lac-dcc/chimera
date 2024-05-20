// This program was cloned from: https://github.com/skerr92/O2-Trainer
// License: MIT License

`default_nettype none
`include "instr_mem.v"
`include "mem.v"
`include "alu.v"
module cpu(input wire clk, 
           input wire rst, 
           output reg [1:0] cpu_out,
           input wire [7:0] data_in,
           input wire instr_we);

    reg [5:0] pc;
    reg [1:0] alu_op;
    reg [1:0] reg_file [3:0];
    reg we;
    reg [1:0] out;
    assign cpu_out = out;
    reg [7:0] instr_out;
    reg [1:0] mem_out;
    reg [1:0] alu_out;
    reg [1:0] operA;
    reg [1:0] operB;
    reg [3:0] mem_addr;
    reg [1:0] mem_in;
    reg [1:0] state;
    reg [7:0] cur_instr;
    reg [1:0] wb_addr;

    i_mem instr_mem_init(.clk(clk),
                             .we(instr_we),
                             .addr(pc),
                             .d_in(data_in),
                             .d_out(instr_out));

    alu alu_init(.clk(clk),
                 .op(alu_op),
                 .operA(operA),
                 .operB(operB),
                 .alu_out(alu_out));

    mem mem_init(.clk(clk),
                 .we(we),
                 .addr(mem_addr),
                 .d_in(mem_in),
                 .d_out(mem_out));

    initial begin 
        pc = 0;
        state = 0;
        out = 0;
    end

    always @(posedge clk) begin 
        if (rst) begin 
            pc <= 0;
            state <= 0;
            out <= 0;
        end
         
            case (state)
            0: begin //fetch
                cur_instr <= instr_out;
                state <= state + 1;
            end
            1: begin //decode
                case (cur_instr[7:6])
                0: begin //alu ops
                    alu_op <= cur_instr[5:4];
                    operA <= reg_file[cur_instr[3:2]];
                    operB <= reg_file[cur_instr[1:0]];
                    wb_addr <= cur_instr[3:2];
                    out <= alu_out;
                end
                1: begin // write to reg file
                    wb_addr <= cur_instr[3:2];
                    out <= cur_instr[1:0];
                end
                2: begin // store in memory
                    mem_addr <= cur_instr[5:2];
                    mem_in <= cur_instr[1:0];
                    we <= 1;
                    out <= mem_out;
                end
                3: begin // read from mem into reg file
                    wb_addr <= cur_instr[5:4];
                    mem_addr <= cur_instr[3:0];
                    we <= 0;
                    out <= mem_out;
                end
                endcase
                state <= state + 1;
            end
            2: begin //exec
                if (cur_instr[7:6] != 2) begin
                    reg_file[wb_addr] <= out;
                end
                state <= state + 1;
            end
            3: begin //finsih cycle
                out <= reg_file[wb_addr];
                state <= state + 1;
                pc <= pc + 1;
            end
            default:
                state <= 0;
            endcase
    end

endmodule