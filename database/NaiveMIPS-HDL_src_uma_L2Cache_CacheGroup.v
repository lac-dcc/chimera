// A cache group contains 16 cache lines, each cache line contains 64 bytes (6 bits)
module CacheGroup(clk, reset, 
                  rreq, wreq, addr, burst_size, rdata, wdata, busy,
                  bus_rreq, bus_wreq, bus_acc, bus_addr, bus_rdata, bus_wdata, bus_busy);
    input  wire clk, reset;
   
    input  wire rreq, wreq;
    input  wire [31:0] addr;
    input  wire [31:0] wdata;
    input  wire [4:0]  burst_size;
    output wire [31:0] rdata;
    output reg  busy;
  
    // Bus Interface
    output wire [31:0] bus_addr;
    output wire [31:0] bus_wdata;
    output wire bus_rreq, bus_wreq;
    input  wire [31:0] bus_rdata;
    input  wire bus_acc, bus_busy;
    
    
    // Debug registers
    `define CACHE_FAULT_NONE 4'h0
    `define CACHE_FAULT_NOALIGN 4'h1
    reg  [3:0] fault_reason;
    
    // Break up the address into four components
    wire [20:0] tag_addr;
    wire [4:0] set_addr;
    wire [3:0] word_addr;
    wire [1:0] word_offset;
    assign {tag_addr, set_addr, word_addr, word_offset} = addr;
    
    // State machine definition
    reg [3:0] state;
    `define CACHE_STATE_IDLE 4'h0
    `define CACHE_STATE_WAIT 4'h1
    `define CACHE_STATE_CHIT 4'h2 
    
    `define CACHE_STATE_MISS1 4'h4
    `define CACHE_STATE_MISS2 4'h5
    `define CACHE_STATE_WB    4'h6
    `define CACHE_STATE_LOADING 4'h7
    
    `define CACHE_STATE_READING 4'h9
    `define CACHE_STATE_WDELAY  4'hA
    `define CACHE_STATE_WRITING 4'hB
    `define CACHE_STATE_FINISH  4'hC
    
    // No align is set to high if the access do not lie on the same cache line
    wire [4:0] tail_addr = {1'b0, word_addr} + {burst_size} - 5'd1;
    wire no_align = tail_addr[4];
    
    /******************* Internal Memory Block ************************/
    // Writes require two rising edges before taking effect
    reg  mem_internal_use;
    
    // Memory Block Internal Interface
    wire [31:0] mem_rdata;
    wire [31:0] mem_wdata;
    reg  [7:0] mem_raddr, mem_waddr;
    reg  mem_wreq;
    
    // Memory block External Interface
    wire [31:0] mem_wdata_loader;
    wire [7:0] mem_raddr_loader, mem_waddr_loader;
    wire mem_wreq_loader;
    MemoryBlock mem(.clock(clk),
						.data(mem_internal_use ? mem_wdata : mem_wdata_loader),
						.rdaddress(mem_internal_use ? mem_raddr : mem_raddr_loader),
						.wraddress(mem_internal_use ? mem_waddr : mem_waddr_loader),
						.wren(mem_internal_use ? mem_wreq : mem_wreq_loader),
						.q(mem_rdata));
    assign mem_wdata = wdata;
    /********************************************************************/
    
    // When a read is launched on the internal memory, out_en is set to HIGH for one cycle
    // This is to make sure that rdata is set to non-zero values only when necessary
    reg  out_en;
    reg  out_en_prev, out_en_prev_prev;
    always @(posedge clk) begin
        out_en_prev <= out_en;
        out_en_prev_prev <= out_en_prev;
    end
	assign rdata = out_en_prev_prev ? mem_rdata : 32'h0;
    
    // Cache Look up Table
    reg  lut_en;
    reg  [20:0] lut_tag_addr;
    wire [3:0]  lut_group_addr;
    wire        lut_cache_hit;
    wire [20:0] lut_query_tag_addr;
    CacheLUT lut(.clk(clk), .reset(reset),
                 .en(lut_en), .tag_addr(lut_tag_addr), 
                 .group_addr(lut_group_addr), .cache_hit(lut_cache_hit), .query_tag_addr(lut_query_tag_addr));
    reg [15:0] dirty;
    
    // Load Manager
    reg load_wtrig, load_rtrig;
    reg [31:0] load_physical_addr;
    reg [7:0]  load_line_addr;
    wire load_finish;
    wire load_fault;
	LoadManager manager(.clk(clk), .reset(reset), 
					    .wtrig(load_wtrig), .rtrig(load_rtrig), 
                        .physical_addr(load_physical_addr), .group_addr(load_line_addr),
                        .bus_rreq(bus_rreq), .bus_wreq(bus_wreq), .bus_acc(bus_acc), .bus_addr(bus_addr), 
                        .bus_rdata(bus_rdata), .bus_wdata(bus_wdata), .bus_busy(bus_busy),
                        .mem_wreq(mem_wreq_loader), .mem_raddr(mem_raddr_loader), .mem_waddr(mem_waddr_loader), 
                        .mem_rdata(mem_rdata), .mem_wdata(mem_wdata_loader),
						.fault(load_fault), .finish(load_finish));
                        
                        
    reg [4:0]  op_count;
    reg [4:0]  burst_size_latch;
    reg [20:0] tag_addr_latch;
    reg [4:0]  set_addr_latch;
    reg [3:0]  word_addr_latch;
    
    reg [3:0]  group_addr_latch;
    reg        pending_is_read;
    always @(posedge clk) begin
        if (reset) begin
            state <= `CACHE_STATE_IDLE;  
            mem_internal_use <= 1'b1;
            dirty <= 16'h0;
            out_en <= 1'b0;
            busy <= 1'b0;
        end else begin
            case (state)
            `CACHE_STATE_IDLE: begin
                if (rreq | wreq) begin
                    lut_en <= 1'b1;
                    lut_tag_addr <= tag_addr;
                    
                    busy <= 1'b1;
                    
                    burst_size_latch <= burst_size;
                    tag_addr_latch <= tag_addr;
                    set_addr_latch <= set_addr;
                    word_addr_latch <= word_addr;
                    state <= `CACHE_STATE_WAIT;
                end 
                if (rreq)
                    pending_is_read <= 1'b1;
                else 
                    pending_is_read <= 1'b0;
            end
            `CACHE_STATE_WAIT: begin
                lut_en <= 1'b0;
                state <= `CACHE_STATE_CHIT;
            end
            `CACHE_STATE_CHIT: begin
                if (lut_cache_hit) begin
                    op_count <= 5'd0;
                    
                    if (pending_is_read) begin
                        mem_raddr <= {lut_group_addr, word_addr_latch};
                        out_en <= 1'b1;
                        state <= `CACHE_STATE_READING;
                    end else begin
                        mem_waddr <= {lut_group_addr, word_addr_latch};
                        busy <= 1'b0;
                        dirty[lut_group_addr] <= 1'b1;
                        state <= `CACHE_STATE_WDELAY;
                    end
                end else begin
                    state <= `CACHE_STATE_MISS1;
                end
            end
            `CACHE_STATE_MISS1: begin
                state <= `CACHE_STATE_MISS2;
            end
            `CACHE_STATE_MISS2: begin
                group_addr_latch <= lut_group_addr;
                mem_internal_use <= 1'b0;
                if (dirty[lut_group_addr]) begin
                    state <= `CACHE_STATE_WB;
                    load_wtrig <= 1'b1;
                    load_physical_addr <= {lut_query_tag_addr, set_addr_latch, 6'h0};
                    load_line_addr <= {lut_group_addr, 4'h0};
                end else begin
                    state <= `CACHE_STATE_LOADING;
                    load_rtrig <= 1'b1;
                    load_physical_addr <= {tag_addr_latch, set_addr_latch, 6'h0};
                    load_line_addr <= {lut_group_addr, 4'h0};
                end
            end
            `CACHE_STATE_WB: begin
                load_wtrig <= 1'b0;
                if (load_finish) begin
                    state <= `CACHE_STATE_LOADING;
                    load_rtrig <= 1'b1;
                    load_physical_addr <= {tag_addr_latch, set_addr_latch, 6'h0};
                    load_line_addr <= {group_addr_latch, 4'h0};
                end
            end
            `CACHE_STATE_LOADING: begin
                load_rtrig <= 1'b0;
                if (load_finish) begin
                    op_count <= 5'd0;
                    mem_internal_use <= 1'b1;
                    if (pending_is_read) begin
                        mem_raddr <= {group_addr_latch, word_addr_latch};
                        out_en <= 1'b1;
                        dirty[group_addr_latch] <= 1'b0;
                        state <= `CACHE_STATE_READING;
                    end else begin
                        mem_waddr <= { group_addr_latch, word_addr_latch};
                        busy <= 1'b0;
                        dirty[group_addr_latch] <= 1'b1;
                        state <= `CACHE_STATE_WDELAY;
                    end
                end
            end
            `CACHE_STATE_READING: begin
                if (burst_size_latch == 5'd1) begin
                    state <= `CACHE_STATE_FINISH;
                    out_en <= 1'b0;
                end else if (op_count == burst_size_latch - 5'd1) begin
                    state <= `CACHE_STATE_IDLE;
                    out_en <= 1'b0;
                end 
                if (op_count == 5'd1) begin
                    busy <= 1'b0;
                end
                mem_raddr <= mem_raddr + 8'd1;
                op_count <= op_count + 5'd1;
            end
            `CACHE_STATE_FINISH: begin
                busy <= 1'b0;
                state <= `CACHE_STATE_IDLE;
            end
            `CACHE_STATE_WDELAY: begin
                mem_wreq <= 1'b1;
                state <= `CACHE_STATE_WRITING;
            end
            `CACHE_STATE_WRITING: begin
                if (op_count == burst_size_latch - 5'd1) begin
                    state <= `CACHE_STATE_IDLE;
                    mem_wreq <= 1'b0;
                end else begin
                    op_count <= op_count + 5'd1;
                    mem_waddr <= mem_waddr + 8'd1;
                end
            end
            endcase
        end
    end
  

endmodule

