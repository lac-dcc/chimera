// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

module physical_regfile #(
    parameter REG_SIZE = 64,
    parameter REG_SIZE_WIDTH = 6
)
(
    input clk,
    input reset,

    // from rcu (read ports)
    input [REG_SIZE_WIDTH-1:0] prs1_address,
    input [REG_SIZE_WIDTH-1:0] prs2_address,
    // to rcu (read ports)
    output reg [63:0] prs1_data,
    output reg [63:0] prs2_data,

    // double write port
    input [REG_SIZE_WIDTH-1:0] prd_address_alu,
    input [REG_SIZE_WIDTH-1:0] prd_address_lsu,
    input [63:0] prd_data_alu,
    input [63:0] prd_data_lsu,
    input alu_valid,
    input lsu_valid,
    // finish bit
    input [REG_SIZE_WIDTH-1:0] prs1_p_address,
    input [REG_SIZE_WIDTH-1:0] prs2_p_address,
    output reg prs1_p,
    output reg prs2_p,
    input [REG_SIZE_WIDTH - 1:0] lprd_address,
    input flush
);

    reg [63:0] registers [0:REG_SIZE-1];
    reg registers_p [0:REG_SIZE-1];
    integer i;
    //P0 is always 0 and its finish bit is 1

    //reg read
    always @(*) begin
        prs1_data = registers[prs1_address];
    end
    
    always @(*) begin
        prs2_data = registers[prs2_address];
    end
    
    //finish bit read
    always @(*) begin
        prs1_p = registers_p[prs1_p_address];
    end

    always @(*) begin
        prs2_p = registers_p[prs2_p_address];
    end
    
    //reg alu write
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < REG_SIZE; i = i + 1) begin
                registers[i] <= 0;
            end
        end else begin
            if (alu_valid) begin
                registers[prd_address_alu] <= (prd_address_alu == '0)? 64'b0 : prd_data_alu;
            end
            if (lsu_valid) begin
                registers[prd_address_lsu] <= (prd_address_lsu == '0)? 64'b0 : prd_data_lsu;
            end
        end
    end
    
    //finish bit write
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < REG_SIZE; i = i + 1) begin
                if (i == 0) begin
                    registers_p[i] <= 1;
                end else begin
                    registers_p[i] <= 0;
                end
            end
        end else begin
            if (flush) begin
                registers_p[lprd_address] <= (lprd_address == '0)? 1'b1:1'b0;
            end
            if (alu_valid) begin
                registers_p[prd_address_alu] <= 1'b1;
            end
            if (lsu_valid) begin
                registers_p[prd_address_lsu] <= 1'b1;
        end
    end
    end
endmodule
