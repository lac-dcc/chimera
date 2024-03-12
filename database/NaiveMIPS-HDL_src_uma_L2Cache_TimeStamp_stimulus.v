
module TimeStamp_stimulus;
    reg clk, reset;
  
    initial begin
        clk = 1'b1;
        reset = 1'b1;
        #20 reset = 1'b0;
    end
    always
        #2 clk = ~clk;
  
    wire [3:0] oldest;
    reg en;
    reg [3:0] access;
    TimeStamp time_stamp(.clk(clk), .reset(reset), .en(en), .access(access), .oldest_stamp(oldest));
  
    integer i, j, seed;
  
    integer count[0:15];
    integer max_value;
    integer max_index;
  
    initial begin
        en = 1'b0;
        access = 4'h0;
        seed = 0;
        for (j = 0; j < 16; j = j + 1) begin
            count[j] = 0;
        end
        #21
        for (i = 0; i < 10000; i = i + 1) begin
            #4 
            // Simulate expected output
            max_value = count[0];
            max_index = 0;
            for (j = 1; j < 16; j = j + 1) begin
                if (count[j] > max_value) begin
                    max_value = count[j];
                    max_index = j;
                end
            end
          
            if (max_index != oldest) begin
                $display("Error: mismatch");
                $stop;
            end
          
            // Set random input
            access = ($random(seed) - 1) % 16;
            en = $random(seed) % 2;
            
            // Update simulated states
            if (en == 1) begin
                for (j = 0; j < 16; j = j + 1)
                    count[j] = count[j] + 1;
                count[access] = 0;
                #8 begin end
            end
        end
        $display("PASS");
    end
endmodule