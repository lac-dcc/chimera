// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module keyboard_filter(
    input           clk,
    input           rstn,
    input  [15: 0]  key_in,
    output [15: 0]  key_pulse // if key pushed, output 1
);

wire [15: 0] key;
assign key = ~key_in;

reg  [19 : 0] treg0;
reg  [19 : 0] treg1;
reg  [19 : 0] treg2;
reg  [19 : 0] treg3;
reg  [19 : 0] treg4;
reg  [19 : 0] treg5;
reg  [19 : 0] treg6;
reg  [19 : 0] treg7;
reg  [19 : 0] treg8;
reg  [19 : 0] treg9;
reg  [19 : 0] treg10;
reg  [19 : 0] treg11;
reg  [19 : 0] treg12;
reg  [19 : 0] treg13;
reg  [19 : 0] treg14;
reg  [19 : 0] treg15;
wire [19 : 0] treg0_nxt = treg0 + 1'b1;
wire [19 : 0] treg1_nxt = treg1 + 1'b1;
wire [19 : 0] treg2_nxt = treg2 + 1'b1;
wire [19 : 0] treg3_nxt = treg3 + 1'b1;
wire [19 : 0] treg4_nxt = treg4 + 1'b1;
wire [19 : 0] treg5_nxt = treg5 + 1'b1;
wire [19 : 0] treg6_nxt = treg6 + 1'b1;
wire [19 : 0] treg7_nxt = treg7 + 1'b1;
wire [19 : 0] treg8_nxt = treg8 + 1'b1;
wire [19 : 0] treg9_nxt = treg9 + 1'b1;
wire [19 : 0] treg10_nxt = treg10 + 1'b1;
wire [19 : 0] treg11_nxt = treg11 + 1'b1;
wire [19 : 0] treg12_nxt = treg12 + 1'b1;
wire [19 : 0] treg13_nxt = treg13 + 1'b1;
wire [19 : 0] treg14_nxt = treg14 + 1'b1;
wire [19 : 0] treg15_nxt = treg15 + 1'b1;

always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
        treg0 <= 20'b0;
        treg1 <= 20'b0;
        treg2 <= 20'b0;
        treg3 <= 20'b0;
        treg4 <= 20'b0;
        treg5 <= 20'b0;
        treg6 <= 20'b0;
        treg7 <= 20'b0;
        treg8 <= 20'b0;
        treg9 <= 20'b0;
        treg10 <= 20'b0;
        treg11 <= 20'b0;
        treg12 <= 20'b0;
        treg13 <= 20'b0;
        treg14 <= 20'b0;
        treg15 <= 20'b0;        
    end
    else begin
        if (key[0]) begin 
            if (treg0 != 20'hfffff)
                treg0 <= treg0_nxt;
        end
        else begin
            treg0 <= 20'b0;
        end

        if (key[1]) begin
            if (treg1 != 20'hfffff)
                treg1 <= treg1_nxt;
        end
        else begin   
            treg1 <= 20'b0;
        end

        if (key[2]) begin
            if (treg2 != 20'hfffff)
                treg2 <= treg2_nxt;
        end
        else begin
            treg2 <= 20'b0;
        end

        if (key[3]) begin
            if (treg3 != 20'hfffff) 
                treg3 <= treg3_nxt;
        end
        else begin        
            treg3 <= 20'b0;
        end

        if (key[4]) begin 
            if (treg4 != 20'hfffff)
                treg4 <= treg4_nxt;
        end
        else begin
            treg4 <= 20'b0;
        end
        
        if (key[5]) begin 
            if (treg5 != 20'hfffff)
                treg5 <= treg5_nxt;
        end
        else begin
            treg5 <= 20'b0;
        end

        if (key[6]) begin 
            if (treg6 != 20'hfffff)
                treg6 <= treg6_nxt;
        end
        else begin
            treg6 <= 20'b0;
        end
        
        if (key[7]) begin 
            if (treg7 != 20'hfffff)
                treg7 <= treg7_nxt;
        end
        else begin
            treg7 <= 20'b0;
        end

        if (key[8]) begin 
            if (treg8 != 20'hfffff)
                treg8 <= treg8_nxt;
        end
        else begin
            treg8 <= 20'b0;
        end

        if (key[9]) begin
            if (treg9 != 20'hfffff)
                treg9 <= treg9_nxt;
        end
        else begin   
            treg9 <= 20'b0;
        end

        if (key[10]) begin
            if (treg10 != 20'hfffff)
                treg10 <= treg10_nxt;
        end
        else begin
            treg10 <= 20'b0;
        end

        if (key[11]) begin
            if (treg11 != 20'hfffff) 
                treg11 <= treg11_nxt;
        end
        else begin        
            treg11 <= 20'b0;
        end

        if (key[12]) begin 
            if (treg12 != 20'hfffff)
                treg12 <= treg12_nxt;
        end
        else begin
            treg12 <= 20'b0;
        end
        
        if (key[13]) begin 
            if (treg13 != 20'hfffff)
                treg13 <= treg13_nxt;
        end
        else begin
            treg13 <= 20'b0;
        end

        if (key[14]) begin 
            if (treg14 != 20'hfffff)
                treg14 <= treg14_nxt;
        end
        else begin
            treg14 <= 20'b0;
        end
        
        if (key[15]) begin 
            if (treg15 != 20'hfffff)
                treg15 <= treg15_nxt;
        end
        else begin
            treg15 <= 20'b0;
        end                
    end
end

assign key_pulse[15] = (treg15 != 20'hfffff) & (treg15_nxt == 20'hfffff); 
assign key_pulse[14] = (treg14 != 20'hfffff) & (treg14_nxt == 20'hfffff);
assign key_pulse[13] = (treg13 != 20'hfffff) & (treg13_nxt == 20'hfffff);
assign key_pulse[12] = (treg12 != 20'hfffff) & (treg12_nxt == 20'hfffff);
assign key_pulse[11] = (treg11 != 20'hfffff) & (treg11_nxt == 20'hfffff); 
assign key_pulse[10] = (treg10 != 20'hfffff) & (treg10_nxt == 20'hfffff);
assign key_pulse[9] = (treg9 != 20'hfffff) & (treg9_nxt == 20'hfffff);
assign key_pulse[8] = (treg8 != 20'hfffff) & (treg8_nxt == 20'hfffff);
assign key_pulse[7] = (treg7 != 20'hfffff) & (treg7_nxt == 20'hfffff); 
assign key_pulse[6] = (treg6 != 20'hfffff) & (treg6_nxt == 20'hfffff);
assign key_pulse[5] = (treg5 != 20'hfffff) & (treg5_nxt == 20'hfffff);
assign key_pulse[4] = (treg4 != 20'hfffff) & (treg4_nxt == 20'hfffff);
assign key_pulse[3] = (treg3 != 20'hfffff) & (treg3_nxt == 20'hfffff); 
assign key_pulse[2] = (treg2 != 20'hfffff) & (treg2_nxt == 20'hfffff);
assign key_pulse[1] = (treg1 != 20'hfffff) & (treg1_nxt == 20'hfffff);
assign key_pulse[0] = (treg0 != 20'hfffff) & (treg0_nxt == 20'hfffff);

endmodule         
        