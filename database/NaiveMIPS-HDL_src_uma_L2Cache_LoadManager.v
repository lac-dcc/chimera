// Logic to load requested cache line upon cache miss
// Step1: write back if dirty
// Step2: load new cache line
module LoadManager(clk, reset, 
                   wtrig, rtrig, physical_addr, group_addr,
                   bus_rreq, bus_wreq, bus_acc, bus_addr, bus_rdata, bus_wdata, bus_busy,
                   mem_wreq, mem_raddr, mem_waddr, mem_rdata, mem_wdata,
                   fault, finish);
    
	input wire clk, reset;
    
    // Command Interface
	input wire rtrig, wtrig;
	input wire [31:0] physical_addr;
	input wire [7:0] group_addr;
	
	// Bus Interface
	output reg  bus_rreq, bus_wreq;
	output wire [31:0] bus_addr;
	output wire [31:0] bus_wdata;
	input  wire [31:0] bus_rdata;
	input  wire bus_acc, bus_busy;
    
    // Cache Memory Interface
	output reg  mem_wreq;
	output reg  [7:0] mem_raddr, mem_waddr;
	output reg  [31:0] mem_wdata;
	input  wire [31:0] mem_rdata;
    
    // Status Interface
	output reg fault;
	output reg finish;
	
    reg  enable_output;
    wire [31:0] bus_wdata_internal;
    reg  [31:0] bus_addr_internal;
    assign bus_addr = enable_output ? bus_addr_internal : 32'h0;
    assign bus_wdata = enable_output ? bus_wdata_internal : 32'h0;
    
    // Handles consequence of memory latency by registering obtained content when necessary (See sequence diagram)
    // When current address do not match previous address, the data produced by previous address must come out during 
    // next cycle, and we can directly use it. when current address has persisted for more than one cycle,
    // previous address must have been covered, and we use latched data to restore it
    reg [31:0] addr_prev;
    reg [31:0] data_reg;
    reg        use_latch;
    assign bus_wdata_internal = use_latch ? data_reg : mem_rdata;
    always @(posedge clk) begin
        if (reset) begin
            addr_prev <= mem_raddr;
        end else begin
            addr_prev <= mem_raddr;
            if (addr_prev != mem_raddr)
                use_latch <= 1'b0;
            else    
                use_latch <= 1'b1;
        end
    end
    
    // On the edge we detect an adress change, on the next cycle, the old data will be covered, we must latch it by then
    reg cur_read;
    always @(posedge clk) begin
        if (reset) begin
            cur_read <= 1'b0;
        end else begin
            if (mem_raddr != addr_prev)
                cur_read <= 1'b1;
            else
                cur_read <= 1'b0;

            if (cur_read) begin
                data_reg <= mem_rdata;
            end
        end
    end
        
    
	// Core logic
    `define LOADER_STATE_IDLE 4'h0
	`define LOADER_STATE_WRITE_REQ1 4'h1
    `define LOADER_STATE_WRITE_REQ2 4'h2
	`define LOADER_STATE_WRITE 4'h3
	`define LOADER_STATE_READ_REQ1 4'h5
    `define LOADER_STATE_READ_REQ2 4'h6
 	`define LOADER_STATE_READ 4'h7
    `define LOADER_STATE_WAIT   4'h8
	`define LOADER_STATE_FINISH 4'h9
    
	reg [3:0] state;
	reg [31:0] physical_addr_latch;
	reg [7:0] group_addr_latch;
	reg [7:0] read_ptr;

	always @(posedge clk) begin
		if (reset) begin
			state <= `LOADER_STATE_IDLE;
			bus_wreq <= 1'b0;
			bus_rreq <= 1'b0;
			mem_wreq <= 1'b0;
            finish <= 1'b0;
            enable_output <= 1'b0;
		end else begin
			case (state)
			`LOADER_STATE_IDLE: begin
				if (rtrig | wtrig) begin
					physical_addr_latch <= {physical_addr[31:6], 6'h0};
					group_addr_latch <= {group_addr[7:4], 4'h0};
					if (wtrig) begin
						state <= `LOADER_STATE_WRITE_REQ1;
						bus_wreq <= 1'b1;
						mem_raddr <= {group_addr[7:4], 4'h0};
					end else begin
						state <= `LOADER_STATE_READ_REQ1;
						bus_rreq <= 1'b1;
					end
				end
			end
			`LOADER_STATE_WRITE_REQ1: begin
                mem_raddr <= mem_raddr + 8'h1;
                state <= `LOADER_STATE_WRITE_REQ2;
			end
            `LOADER_STATE_WRITE_REQ2: begin
            	if (bus_acc) begin
					state <= `LOADER_STATE_WRITE;
					bus_addr_internal <= physical_addr_latch;    // Check: use latched value
					mem_raddr <= mem_raddr + 8'h1;
                    enable_output <= 1'b1;
				end
            end
			`LOADER_STATE_WRITE: begin
				if ((bus_addr_internal[5:2] == 4'h0) | ~bus_busy) begin
                    mem_raddr <= mem_raddr + 8'h1;
                    bus_addr_internal <= bus_addr_internal + 32'd4;
                end
                if (bus_addr_internal[5:2] == 4'hE & ~bus_busy) begin
                    bus_wreq <= 1'b0;
                    state <= `LOADER_STATE_WAIT;
                end
			end
            `LOADER_STATE_READ_REQ1: begin
                if (bus_acc) begin
                    state <= `LOADER_STATE_READ_REQ2;
                    bus_addr_internal <= physical_addr_latch;
                    read_ptr <= group_addr_latch;
                    enable_output <= 1'b1;
                end 
             end    
			`LOADER_STATE_READ_REQ2: begin
                bus_addr_internal <= bus_addr_internal + 32'h4;
                state <= `LOADER_STATE_READ;
			end
			`LOADER_STATE_READ: begin
                if (~bus_busy) begin
                    read_ptr <= read_ptr + 8'h1;
                    mem_wreq <= 1'b1;
                    mem_wdata <= bus_rdata;
                    mem_waddr <= read_ptr;
                    if (read_ptr[3:0] == 4'hF) begin
                        state <= `LOADER_STATE_WAIT;
                    end
                end else begin
                    mem_wreq <= 1'b0;
                end
                
                if (bus_addr_internal[5:2] == 4'hE) begin
                    bus_rreq <= 1'b0;
                end
                if (bus_addr_internal[5:2] != 4'hF) begin
                    bus_addr_internal <= bus_addr_internal + 32'h4;
                end
			end
            `LOADER_STATE_WAIT: begin
                mem_wreq <= 1'b0;
                // We must wait until bus_acc goes low, so that a future request do not mistake 
                // previous bus_acc as new acceptance
                if (~bus_acc) begin
                    finish <= 1'b1;
                    state <= `LOADER_STATE_FINISH;
                    enable_output <= 1'b0;
                end
            end
			`LOADER_STATE_FINISH: begin
                finish <= 1'b0;
                state <= `LOADER_STATE_IDLE;
			end
			endcase
		end
	end
	
    // Watch dog generates a fault if an operation takes too long
    `define LOADER_MAX_TIMEOUT 32'd10000000     // 10M cycles
	reg [31:0] watch_dog;
	always @(posedge clk) begin
		if (reset) begin
			watch_dog <= 32'd0;
			fault <= 1'b0;
		end else begin
			if (state == `LOADER_STATE_IDLE) begin
				watch_dog <= 32'd0;
			end else if(watch_dog == `LOADER_MAX_TIMEOUT) begin
				fault <= 1'b1;
				watch_dog <= 32'd0;
			end else begin
				watch_dog <= watch_dog + 32'd1;
			end
		end
	end

endmodule


