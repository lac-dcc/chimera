// This program was cloned from: https://github.com/sspku-mzj/Verilog_Module
// License: Apache License 2.0

// Moore状态机: 组合逻辑输出只取决于当前状态,与输入状态无关
// Moore状态机通常比Mealy状态机多一个状态位,即最后一个输出状态
// IDLE :初始状态,输入1进入状态A,输入0保持状态
// A    :       ,输入0进入状态B,输入1保持状态
// B    :       ,输入0进入状态C,输入1跳转回 A
// C    :       ,输入1进入状态D,输入0跳转回 IDLE
// D    :       ,输入0进入状态E,输入1跳转回 A
// E    :       ,拉高输出

// 重复检测: 输入0跳转到状态 C, 输入1跳转到状态 A
// 非重复检测: 输入0跳转到状态 IDLE, 输入1跳转到状态 A

module Moore_10010 #(
    parameter REPEAT = 1'b1                // 1:重复检测   0:非重复检测
)(
    input       data_in,
    input       clk,
    input       rst_n,
    output  reg data_out
);
    reg [2:0]   current_state;
    reg [2:0]   next_state;

    localparam  IDLE    = 3'd0,
                A       = 3'd1,
                B       = 3'd2,
                C       = 3'd3,
                D       = 3'd4,
                E       = 3'd5;
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
        case(current_state)
            IDLE    : next_state = data_in ? A : IDLE;
            A       : next_state = data_in ? A : B;
            B       : next_state = data_in ? A : C;
            C       : next_state = data_in ? D : IDLE;
            D       : next_state = data_in ? A : E;
            E       : next_state = REPEAT ? (data_in ? A : C) : (data_in ? A : IDLE);
            default : next_state = IDLE;
        endcase
    end

    // third
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            data_out <= 1'b0;
        else 
            case(current_state)
                E       : data_out <= 1'b1;
                default : data_out <= 1'b0;  
            endcase
    end

endmodule