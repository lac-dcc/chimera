// This module manages time stamps, and outputs the index with the oldest time stamp
// If en = 1, then the stamp corresponding to access will be cleared, other stamps will be incremented
// Note that it takes three cycles for a access to be reflected at oldest_stamp
module TimeStamp(clk, reset, en, access, oldest_stamp);
    input  wire clk, reset, en;
    input  wire [3:0] access;
    output reg  [3:0] oldest_stamp;
    
    reg  [3:0] oldest_stamp_reg;
    // Used for testing timing analysis
    always @(posedge clk) 
        oldest_stamp <= oldest_stamp_reg;
        
    // Logic to decide the most recently used cache line
    reg [15:0] time_stamp[0:15];
    genvar gen;
    generate for (gen = 0; gen < 16; gen = gen + 1) begin: stamp_loop
        always @(posedge clk) begin
            if (reset) begin
                time_stamp[gen] <= 16'd0;
            end else if (en) begin
                if (access == gen) 
                    time_stamp[gen] <= 16'd0;
                else if (time_stamp[gen] != 16'hFFFF)
                    time_stamp[gen] <= time_stamp[gen] + 16'd1;
            end
        end
    end
    endgenerate
    
    // Find the index with the largest time stamp value. This implements a binary comparator tree    
    reg [7:0] comp_r1;         
    reg [15:0] max_stamp1[0:7];
    integer i;
    always @(time_stamp[0],  time_stamp[1],  time_stamp[2],  time_stamp[3],
             time_stamp[4],  time_stamp[5],  time_stamp[6],  time_stamp[7],
             time_stamp[8],  time_stamp[9],  time_stamp[10], time_stamp[11],
             time_stamp[12], time_stamp[13], time_stamp[14], time_stamp[15]) begin
        for(i = 0; i < 8; i = i + 1) begin
            if (time_stamp[2 * i] >= time_stamp[2 * i + 1]) begin
                comp_r1[i] = 0;
                max_stamp1[i] = time_stamp[2 * i];
            end else begin
                comp_r1[i] = 1;
                max_stamp1[i] = time_stamp[2 * i + 1];
            end
        end
    end
       
    reg       comp_r2_lower_reg[0:3];
    reg [3:0] comp_r2_reg;
    reg [15:0] max_stamp2_reg[0:3];
    always @(max_stamp1[0], max_stamp1[1], max_stamp1[2], max_stamp1[3], 
             max_stamp1[4], max_stamp1[5], max_stamp1[6], max_stamp1[7], comp_r1) begin
        for(i = 0; i < 4; i = i + 1) begin
            if (max_stamp1[2 * i] >= max_stamp1[2 * i + 1]) begin
                comp_r2_reg[i] = 0;
                max_stamp2_reg[i] = max_stamp1[2 * i];
                comp_r2_lower_reg[i] = comp_r1[2 * i];
            end else begin
                comp_r2_reg[i] = 1;
                max_stamp2_reg[i] = max_stamp1[2 * i + 1];
                comp_r2_lower_reg[i] = comp_r1[2 * i + 1];
            end
        end
    end 
  
    reg        comp_r2_lower[0:3];
    reg [3:0]  comp_r2;
    reg [15:0] max_stamp2[0:3];
    
    always @(posedge clk) begin
        comp_r2 <= comp_r2_reg;
        for (i = 0; i < 4; i = i + 1) begin
            comp_r2_lower[i] <= comp_r2_lower_reg[i];
            max_stamp2[i] <= max_stamp2_reg[i];
        end
    end
    
    reg [1:0] comp_r3_lower[0:1];
    reg [1:0] comp_r3;
    reg [15:0] max_stamp3[0:1];
    always @(max_stamp2[0], max_stamp2[1], max_stamp2[2], max_stamp2[3], comp_r2, 
           comp_r2_lower[0], comp_r2_lower[1], comp_r2_lower[2], comp_r2_lower[3]) begin
        for(i = 0; i < 2; i = i + 1) begin: max_loop3
            if (max_stamp2[2 * i] >= max_stamp2[2 * i + 1]) begin
                comp_r3[i] = 1'b0;
                max_stamp3[i] = max_stamp2[2 * i];
                comp_r3_lower[i] = {comp_r2[2 * i], comp_r2_lower[2 * i]};
            end else begin
                comp_r3[i] = 1'b1;
                max_stamp3[i] = max_stamp2[2 * i + 1];
                comp_r3_lower[i] = {comp_r2[2 * i + 1], comp_r2_lower[2 * i + 1]};
            end
        end
    end
    
    /*
    reg [1:0] comp_r3_lower[0:1];
    reg [1:0] comp_r3;
    reg [15:0] max_stamp3[0:1];
    always @(posedge clk) begin
        comp_r3 <=comp_r3_reg;
        for (i = 0; i < 2; i = i + 1) begin
            comp_r3_lower[i] <= comp_r3_lower_reg[i];
            max_stamp3[i] <= max_stamp3_reg[i];
        end
    end
    */
    
    always @(max_stamp3[0], max_stamp3[1], comp_r3, comp_r3_lower[0], comp_r3_lower[1]) begin
        if (max_stamp3[0] >= max_stamp3[1]) begin
            oldest_stamp_reg = {1'b0, comp_r3[0], comp_r3_lower[0]};
        end else begin
            oldest_stamp_reg = {1'b1, comp_r3[1], comp_r3_lower[1]};
        end
    end
    //assign oldest_stamp = (max_stamp3[0] >= max_stamp3[1]) ? 
    //                      {1'b0, comp_r3[0], comp_r3_lower[0]} :
    //                      {1'b1, comp_r3[1], comp_r3_lower[1]};
 
endmodule