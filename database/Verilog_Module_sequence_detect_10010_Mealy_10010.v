// This program was cloned from: https://github.com/sspku-mzj/Verilog_Module
// License: Apache License 2.0

// Mealy状态机: 状态机的输出不仅取决于当前状态, 还取决于输入状态
// Mealy状态机通常比Moore状态机少一个状态
// IDLE :初始状态,输入1进入状态A,输入0保持状态
// A    :       ,输入0进入状态B,输入1保持状态
// B    :       ,输入0进入状态C,输入1跳转回 A
// C    :       ,输入1进入状态D,输入0跳转回 IDLE
// D    :       ,输入0拉高输出根据是否重复检测选择跳转,输入1跳转回 A


// 重复检测: 输入0跳转到状态 B, 输入1跳转到状态 A
// 非重复检测: 输入0跳转到状态 IDLE, 输入1跳转到状态 A

module Mealy_10010 #(
    parameter REPEAT = 1'b1         // 1:重复检测   0:非重复检测
)(
    input           data_in,
    input           clk,
    input           rst_n,
    output  reg     data_out
);

    reg [2:0]   current_state;
    reg [2:0]   next_state;

    localparam  IDLE    = 3'd0,
                A       = 3'd1,
                B       = 3'd2,
                C       = 3'd3,
                D       = 3'd4;
    
    // first
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            current_state <= IDLE;
        else 
            current_state <= next_state;
    end

    // second
    always @(*) begin
        next_state = IDLE;
        case (current_state)
            IDLE    : next_state = data_in ? A : IDLE;
            A       : next_state = data_in ? A : B;
            B       : next_state = data_in ? A : C;
            C       : next_state = data_in ? D : IDLE;
            D       : next_state = REPEAT ? (data_in ? A : B) : (data_in ? A : IDLE);
            default : next_state = IDLE; 
        endcase
    end

    // third
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            data_out <= 1'b0;
        else begin
            case(current_state)
                D : begin
                    if(data_in == 1'b0)
                        data_out <= 1'b1;
                    else 
                        data_out <= 1'b0;
                end
                default : data_out <= 1'b0;
            endcase
        end
    end
endmodule