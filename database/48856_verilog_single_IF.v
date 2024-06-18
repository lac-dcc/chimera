// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module IF(J, Branch, target, zero, imm, pc, clk, init);
    input J, Branch, zero, clk, init;
    input [15:0] imm;
    input [25:0] target;

    output reg [31:0] pc;

    always @(init) begin //初始化 第一个字为nop指令
        pc = init?32'h0:pc;
    end

    always @(negedge clk) begin 
        pc = pc + 4;
        if(J)
        begin
            pc = {pc[31:28],target,2'b00};
        end
        else
        begin
            if(Branch && zero)
            begin
                pc = pc + {{14{imm[15]}},imm,2'b00}; //符号扩展
            end
        end
    end
endmodule

