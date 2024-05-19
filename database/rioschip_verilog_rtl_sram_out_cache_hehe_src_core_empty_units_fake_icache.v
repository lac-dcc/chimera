// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

module fake_icache (  
    input clk,
    input reset,
    input [31:0] fetch_address,
    output reg [31:0] instruction
);
reg [31:0] pc_address [0:20];
reg [31:0] instruction_store [0:20];

always @(posedge clk) begin
    if (reset) begin
        pc_address[0] <= 32'h8000_0004;
        pc_address[1] <= 32'h8000_0008;
        pc_address[2] <= 32'h8000_000c;
        pc_address[3] <= 32'h8000_0010;
        pc_address[4] <= 32'h8000_0014;
        pc_address[5] <= 32'h8000_0018;
        pc_address[6] <= 32'h8000_001c;
        pc_address[7] <= 32'h8000_0020;
        pc_address[8] <= 32'h8000_0024;
        pc_address[9] <= 32'h7000_0000;
        pc_address[10] <= 32'h7000_0004;
        pc_address[11] <= 32'h7000_0008;
        pc_address[12] <= 32'h7000_000c;
        pc_address[13] <= 32'h7000_0010;
        pc_address[14] <= 32'h7000_0014;
        pc_address[15] <= 32'h7000_0018;
        pc_address[16] <= 32'h7000_001c;
        pc_address[17] <= 32'h7000_0020;
        pc_address[18] <= 32'h7000_0024;
        pc_address[19] <= 32'h7000_0028;
        pc_address[20] <= 32'h8000_0000;
        instruction_store[0] <= 32'hffff8001;
        instruction_store[1] <= 32'hffff8002;
        instruction_store[2] <= 32'hffff8003;
        instruction_store[3] <= 32'hffff8004;
        instruction_store[4] <= 32'hffff8005;
        instruction_store[5] <= 32'hffff8006;
        instruction_store[6] <= 32'hffff8007;
        instruction_store[7] <= 32'hffff8008;
        instruction_store[8] <= 32'hffff8009;
        instruction_store[9] <= 32'hffff7000;
        instruction_store[10] <= 32'hffff7000;
        instruction_store[11] <= 32'hffff7001;
        instruction_store[12] <= 32'hffff7002;
        instruction_store[13] <= 32'hffff7003;
        instruction_store[14] <= 32'hffff7004;
        instruction_store[15] <= 32'hffff7005;
        instruction_store[16] <= 32'hffff7006;
        instruction_store[17] <= 32'hffff7007;
        instruction_store[18] <= 32'hffff7008;
        instruction_store[19] <= 32'hffff7009;
        instruction_store[20] <= 32'hffff8000;
    end
end
wire [20:0] fetch_hit;
generate
    genvar j;
    for(j = 0; j < 21; j = j + 1) begin
        assign fetch_hit[j] = pc_address[j] == fetch_address;
    end
endgenerate
wire token;
assign token = (|fetch_hit);
integer i;
always @(*) begin
    if(token) begin
        for (i=0; i < 21; i=i+1) begin
            if(fetch_hit[i]) begin
                instruction = instruction_store[i];
            end 
        end 
    end else begin
        instruction = pc_address[0];
    end
end

endmodule