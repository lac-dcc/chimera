// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module keyboard_reg (
    input                clk,
    input                rstn,
    input                key_clear,//高有效
    input        [15:0]  key_pulse,
    output  reg  [15:0]  key_reg
);

wire clear;
assign clear = rstn && (!key_clear) ;


always @(posedge clk or negedge clear) begin
    if (!clear) begin
        key_reg <= 1'b0;
    end else begin
        if(key_pulse[15]) key_reg[15] <= 1'b1;
        if(key_pulse[14]) key_reg[14] <= 1'b1;
        if(key_pulse[13]) key_reg[13] <= 1'b1;
        if(key_pulse[12]) key_reg[12] <= 1'b1;
        if(key_pulse[11]) key_reg[11] <= 1'b1;
        if(key_pulse[10]) key_reg[10] <= 1'b1;
        if(key_pulse[9])  key_reg[9]  <= 1'b1;
        if(key_pulse[8])  key_reg[8]  <= 1'b1;
        if(key_pulse[7])  key_reg[7]  <= 1'b1;
        if(key_pulse[6])  key_reg[6]  <= 1'b1;
        if(key_pulse[5])  key_reg[5]  <= 1'b1;
        if(key_pulse[4])  key_reg[4]  <= 1'b1;
        if(key_pulse[3])  key_reg[3]  <= 1'b1;
        if(key_pulse[2])  key_reg[2]  <= 1'b1;
        if(key_pulse[1])  key_reg[1]  <= 1'b1;
        if(key_pulse[0])  key_reg[0]  <= 1'b1;       
    end
end

endmodule


