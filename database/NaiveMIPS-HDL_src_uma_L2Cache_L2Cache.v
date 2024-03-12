module L2Cache(clk, reset, 
               addr, burst_size, rdata, wdata, rreq, wreq, busy,
               bus_addr, bus_wdata, bus_rdata, bus_rreq, bus_wreq, bus_acc, bus_busy);
	input  wire clk, reset;
    
    `define SET_COUNT 32
    
    // Service interface
    input  wire rreq, wreq;
    input  wire [31:0] addr;            // The address of the memory location we would like to read
    input  wire [4:0]  burst_size;      // The number of WORDS of memory we would like to read out 
    input  wire [31:0] wdata;
    output wire [31:0] rdata;
    output wire busy;
    
    // BUS interface
	output wire bus_rreq, bus_wreq;
	output wire [31:0] bus_addr, bus_wdata;
	input  wire [31:0] bus_rdata;
	input  wire bus_acc, bus_busy;

    
    // Break up the address into various components
    wire [20:0] tag_addr;
    wire [4:0] set_addr;
    wire [3:0] word_addr;
    wire [1:0] word_offset;
    assign {tag_addr, set_addr, word_addr, word_offset} = addr;
    
    // Generate the cache sets, set rreq & wreq HIGH only if the set is selected. 
    // OR the outputs to produce the combined output
	wire [`SET_COUNT-1:0] bus_rreq_array;
	wire [`SET_COUNT-1:0] bus_wreq_array;
	wire [31:0] bus_addr_array[0:`SET_COUNT-1];
	wire [31:0] bus_wdata_array[0:`SET_COUNT-1];
	
    wire [`SET_COUNT-1:0] busy_array;
    wire [31:0] rdata_array[0:`SET_COUNT-1];
	genvar gen, gen2;
	generate for (gen = 0; gen < `SET_COUNT; gen = gen + 1) begin: cache_groups
		CacheGroup set(.clk(clk), .reset(reset),
                       .rreq(rreq & (set_addr == gen)),
                       .wreq(wreq & (set_addr == gen)),
                       .addr(addr), 
                       .burst_size(burst_size), 
                       .wdata(wdata), 
                       .rdata(rdata_array[gen]),
                       .busy(busy_array[gen]),
                       .bus_rreq(bus_rreq_array[gen]), 
                       .bus_wreq(bus_wreq_array[gen]), 
                       .bus_addr(bus_addr_array[gen]),
                       .bus_wdata(bus_wdata_array[gen]),
                       .bus_rdata(bus_rdata),
                       .bus_acc(bus_acc),
                       .bus_busy(bus_busy));
	end
	endgenerate
    
    // Or all the output signals together
	assign bus_rreq = |bus_rreq_array;
	assign bus_wreq = |bus_wreq_array;
    assign busy = |busy_array;
    
    wire [`SET_COUNT-1:0] bus_addr_rearrange[0:31];
    wire [`SET_COUNT-1:0] bus_wdata_rearrange[0:31];
    wire [`SET_COUNT-1:0] rdata_rearrange[0:31];
    generate for (gen = 0; gen < `SET_COUNT; gen = gen + 1) begin: rloop1
        for (gen2 = 0; gen2 < 32; gen2 = gen2 + 1) begin: rloop2
            assign bus_addr_rearrange[gen2][gen] = bus_addr_array[gen][gen2];
            assign bus_wdata_rearrange[gen2][gen] = bus_wdata_array[gen][gen2];
            assign rdata_rearrange[gen2][gen] = rdata_array[gen][gen2];
        end 
    end 
    for (gen2 = 0; gen2 < 32; gen2 = gen2 + 1) begin: rloop3
        assign bus_addr[gen2] = |bus_addr_rearrange[gen2];
        assign bus_wdata[gen2] = |bus_wdata_rearrange[gen2];
        assign rdata[gen2] = |rdata_rearrange[gen2];
    end
    endgenerate
endmodule
