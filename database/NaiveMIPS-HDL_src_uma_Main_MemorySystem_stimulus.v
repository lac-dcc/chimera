
module MemorySystem_stimulus();
    // Enable one and only one of these
    //`define TEST_CACHE
    //`define TEST_DIRECT
    `define TEST_ALL
    `define MAX_SIZE 500000
    
    reg clk, reset;

    initial begin
        clk = 1'b1;
        reset = 1'b1;
        #20 reset = 1'b0;
    end
    always
        #2 clk = ~clk;
    
    reg signed [31:0] mem[0:32'hFFFF];
    integer j;
    initial begin
        for (j = 0; j < 32'hFFFF; j = j + 1)
            mem[j] = 0;
    end
    
    // Connect Memory System
    reg  drreq, dwreq;
    wire [31:0] drdata;
    wire dmiss;
    
    reg [22:0] dtag_addr;
    reg [3:0]  dset_addr;
    reg [2:0]  dword_addr;
    reg [31:0] dwdata;
 
    reg  irreq;
    wire [31:0] irdata;
    wire imiss;
    
    reg [22:0] itag_addr;
    reg [3:0] iset_addr;
    reg [2:0] iword_addr;
    
    MemorySystem memsys(.clk(clk), .reset(reset), 
                 .irreq(irreq), 
                 .iaddr({itag_addr, iset_addr, iword_addr, 2'h0}), 
                 .irdata(irdata), .imiss(imiss), 
                 .drreq(drreq), .dwreq(dwreq), 
                 .daddr({dtag_addr, dset_addr, dword_addr, 2'h0}), 
                 .drdata(drdata), .dwdata(dwdata), .dmiss(dmiss));
                            
    reg [22:0] tag_addr_list[0:`MAX_SIZE];
    reg [2:0] word_addr_list[0:`MAX_SIZE];
    reg [3:0] set_addr_list[0:`MAX_SIZE];
    integer stack_top = 0;
    
    integer counter;
    integer seed = 129203;
    integer index;
    integer dmem_addr;
    initial begin
        drreq <= 1'b0;
        dwreq <= 1'b0;
        #21 begin end
        #4
        for (counter = 0; counter < `MAX_SIZE; counter = counter + 1) begin
            if ((stack_top != 0) && ($random(seed) % 2 == 0)) begin
                
                if ($random(seed) % 5 == 0) begin
                    index = $random(seed) % stack_top;
                    if (index < 0)
                        index = -index;
                end else begin
                    index = stack_top - 1;
                    while (index > 0 && $random(seed) % 10 != 0)
                        index = index - 1;
                end
                dtag_addr = tag_addr_list[index];
                dword_addr = word_addr_list[index];
                dset_addr = set_addr_list[index];
                dmem_addr = dtag_addr * 32'h80 + dset_addr * 32'h8 + dword_addr;
                drreq = 1'b1;
                #4 
                if (~dmiss) begin
                    if (drdata != mem[dmem_addr]) begin
                        $display("Error: data mismatch @ %h, expected %d, received %d", 
                            dmem_addr *32'h4, mem[dmem_addr], drdata);
                        $stop;
                    end
                end else begin
                    while (dmiss) #4 begin end
                    #4 begin end
                    if (drdata != mem[dmem_addr]) begin
                        $display("Error: data mismatch @ %h, expected %d, received %d", 
                            dmem_addr *32'h4, mem[dmem_addr], drdata);
                        $stop;
                    end    
                end
                drreq = 1'b0;
                $display("DCache Test %d, Read @ %h", counter, dmem_addr * 32'h4);
            end else begin
                dtag_addr = $random(seed) & 23'hF8;
                dword_addr = $random(seed) & 3'h7;
                dset_addr = $random(seed) & 4'hF;
                dmem_addr = dtag_addr * 32'h80 + dset_addr * 32'h8 + dword_addr;
                dwdata = $random(seed) % 1024;
                
                dwreq = 1'b1;
                #4
                if (dmiss) begin
                    while (dmiss) #4 begin end
                    #4 begin end
                end
                dwreq = 1'b0;
                tag_addr_list[stack_top] = dtag_addr;
                word_addr_list[stack_top] = dword_addr;
                set_addr_list[stack_top] = dset_addr;
                stack_top = stack_top + 1;
                mem[dmem_addr] = dwdata;
                $display("DCache Test %d, Write %d @ %h", counter, 
                    mem[dmem_addr], dmem_addr * 32'h4);
            end
        end
        $display("PASS");
    end    
    
    integer iindex, icounter;
    integer mem_addr;
    initial begin
        irreq <= 1'b0;
        #21 begin end
        #4
        for (icounter = 0; icounter < `MAX_SIZE; icounter = icounter + 1) begin
            while ($random(seed) % 5 != 0) #4 begin end
            if (stack_top != 0) begin
                if ($random(seed) % 5 == 0) begin
                    iindex = $random(seed) % stack_top;
                    if (iindex < 0)
                        iindex = -iindex;
                end else begin
                    iindex = stack_top - 1;
                    while (iindex > 0 && $random(seed) % 10 != 0)
                        iindex = iindex - 1;
                end
                itag_addr = tag_addr_list[iindex];
                iword_addr = word_addr_list[iindex];
                iset_addr = set_addr_list[iindex];
                
                irreq = 1'b1;
                mem_addr = itag_addr * 32'h80 + iset_addr * 32'h8 + iword_addr;
                #4 
                if (~imiss) begin
                    if (irdata != mem[mem_addr]) begin
                        $display("Error: data mismatch @ %h, expected %d, received %d", 
                            mem_addr *32'h4, mem[mem_addr], irdata);
                        $stop;
                    end
                end else begin
                    while (imiss) #4 begin end
                    #4 begin end
                    if (irdata != mem[itag_addr * 32'h80 + iset_addr * 32'h8 + iword_addr]) begin
                        $display("Error: data mismatch @ %h, expected %d, received %d", 
                            mem_addr *32'h4, mem[mem_addr], irdata);
                        $stop;
                    end    
                end
                irreq = 1'b0;
                $display("ICache Test %d, Read @ %h", icounter, mem_addr);
            end else #4 begin end
        end
        $display("PASS");
    end       
endmodule