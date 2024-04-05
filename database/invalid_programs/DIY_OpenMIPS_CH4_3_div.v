`include "defines.v"

module div(
    input  wire                    reset,
    input  wire                    clock,

    input  wire                    is_sign_div_input,
    input  wire[`RegisterBus]      div_data1_input,
    input  wire[`RegisterBus]      div_data2_input,
    input  wire                    div_start_input,
    input  wire                    div_cancel_input,
    
    output reg[`DoubleRegisterBus] div_result_output,
    output reg                     div_ready_output
);

    wire[32:0]              div_temp;
    reg[5:0]                count;
    reg[64:0]               dividend;
    reg[1:0]                state;
    reg[`RegisterBus]       divisor;
    reg[`RegisterBus]       temp_data1;
    reg[`RegisterBus]       temp_data2;

    assign div_temp = {1'b0, dividend[63:32]} - {1'b0, divisor};

    always @ (posedge clock) begin
        if (reset == `ResetEnable) begin
            state <= `DivFree;
            div_ready_output <= `DivResultNotReady;
            div_result_output <= {`ZeroWord, `ZeroWord};
        end else begin
            case (state) 
                `DivFree: begin
                    if (div_start_input == `DivStart && div_cancel_input == 1'b0) begin
                        if(div_data2_input == `ZeroWord) begin
                            state <= `DivByZero;
                        end else begin
                            state <= `DivOn;
                            count <= 6'b000000;
                            if (is_sign_div_input == 1'b1 && div_data1_input[31] == 1'b1) begin
                                temp_data1 = ~div_data1_input + 1;
                            end else begin
                                temp_data1 = div_data1_input;
                            end
                            if (is_sign_div_input == 1'b1 && div_data2_input[31] == 1'b1) begin
                                temp_data2 = ~div_data2_input + 1;
                            end else begin
                                temp_data2 = div_data2_input;
                            end
                            dividend <= {`ZeroWord, `ZeroWord};
                            dividend[32: 1] <= temp_data1;
                            divisor <= temp_data2;
                        end
                    end else begin
                        div_ready_output <= `DivResultNotReady;
                        div_result_output <= {`ZeroWord, `ZeroWord};
                    end
                end
                `DivByZero: begin
                    dividend <= {`ZeroWord, `ZeroWord};
                    state <= `DivEnd;
                end
                `DivOn: begin
                    if (div_cancel_input == 1'b0) begin
                        if (count != 6'b100000) begin
                            if (div_temp[32] == 1'b1) begin
                                dividend <= {dividend[63:0], 1'b0};
                            end else begin
                                dividend <= {div_temp[31:0], dividend[31:0], 1'b1};
                            end
                            count <= count + 1;
                        end else begin
                            if ((is_sign_div_input == 1'b1) &&
                                ((div_data1_input[31] ^ div_data2_input[31]) == 1'b1)) begin
                                dividend[31:0] <= (~dividend[31:0] + 1);
                            end 
                            if ((is_sign_div_input == 1'b1) &&
                                (div_data1_input[31] ^ dividend[64]) == 1'b1) begin
                                dividend[64:33] <= (~dividend[64:33] + 1);
                            end
                            state <= `DivEnd;
                            count <= 6'b000000;
                        end
                    end else begin
                        state <= `DivFree;
                    end    
                end 
                `DivEnd: begin
                    div_result_output <= {dividend[64:33], dividend[31:0]};
                    div_ready_output <= `DivResultReady;
                    if (div_start_input == `DivStop) begin
                        state <= `DivFree;
                        div_ready_output <= `DivResultNotReady;
                        div_result_output <= {`ZeroWord, `ZeroWord};
                    end
                end
            endcase
        end
    end

endmodule