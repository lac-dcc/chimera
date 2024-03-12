module CacheLUT_stimulus;
    reg clk, reset;
  
    initial begin
        clk = 1'b1;
        reset = 1'b1;
        #20 reset = 1'b0;
    end
    always
        #2 clk = ~clk;

    reg  en;
    reg  [20:0] tag_addr;
    wire [3:0]  group_addr;
    wire        cache_hit;
    CacheLUT lut(.clk(clk), .reset(reset), 
                     .en(en), .tag_addr(tag_addr), 
                     .group_addr(group_addr), .cache_hit(cache_hit));
    
    integer age[0:15];
    integer addresses[0:15];
    
    integer i, iter;
    integer seed = 10;
    integer success = 0;
    reg [3:0] index;
    initial begin
        en = 1'b0;
        for (i = 0; i < 16; i = i + 1) begin
            age[i] = 0;
            addresses[i] = 0;
        end
        #21
        #4
        tag_addr = 0;
        en = 1'b1;
        #4
        en = 1'b0;
        #12
        
        for (iter = 0; iter < 100000; iter = iter + 1) begin
            if ($random(seed) % 10 == 0) begin
                // Generate a tag address different from all existing addresses
                success = 0;
                while (success == 0) begin
                    tag_addr = $random(seed) % 10000;
                
                    success = 1;
                    for (i = 0; i < 16; i = i + 1) begin
                        if (tag_addr == addresses[i]) begin
                            success = 0;
                        end
                    end
                end
                
                // Trigger a query
                en = 1'b1;
                #4
                en = 1'b0;               
                if (cache_hit != 1'b0) begin               
                    $display("Error: cache hit at non existing address");               
                    $stop;      
                end
             
                // Check if the correct line is eliminated      
                #4 #4      
                for (i = 0; i < 16; i = i + 1) begin     
                    if ((i != group_addr) && (age[i] > age[group_addr])) begin   
                        $display("Error: eliminated cache entry that is not oldest");
                        $stop;
                    end
                end
                // Increment age
                for (i = 0; i < 16; i = i + 1) begin
                    age[i] = age[i] + 1;
                end
                addresses[group_addr] = tag_addr;
                age[group_addr] = 0;
                #4 begin end
            end else begin
                index = ($random(seed) - 1) % 16;
                tag_addr = addresses[index];
                
                // Trigger a query
                en = 1'b1;
                #4
                en = 1'b0;
                
                if (cache_hit == 1'b0) begin
                    $display("Error: missing entry in cache");
                    $stop;
                end
                if (addresses[group_addr] != tag_addr) begin
                    $display("Error: incorrect entry in cache");
                    $stop;
                end
                // Increment age
                for (i = 0; i < 16; i = i + 1) begin
                    age[i] = age[i] + 1;
                end
                age[group_addr] = 0;
                #4 begin end
            end
        end
        $display("PASS");
    end   
endmodule