
module BusController(clk, reset, 
                     master_addr, master_rdata, master_wdata, master_rreq, master_wreq, 
                     master_acc, master_busy, 
                     slave_addr, slave_rdata, slave_wdata, slave_rreq, slave_wreq,
                     slave_ack, slave_busy,
                     seg_fault, seg_reason, seg_addr);
	
	input  wire clk, reset;
	
	input  wire [4*32-1:0] master_addr;
	output wire [31:0]     master_rdata;
	input  wire [4*32-1:0] master_wdata;
	input  wire [3:0]      master_rreq;
	input  wire [3:0]      master_wreq;
	output reg  [3:0]      master_acc;
	output wire            master_busy;
    
	output wire [31:0]     slave_addr;
	input  wire [8*32-1:0] slave_rdata;
	output wire [31:0]     slave_wdata;
	output reg             slave_rreq;
	output reg             slave_wreq;
	input  wire [7:0]      slave_busy;
    input  wire [7:0]      slave_ack;
    
    // Debug Registers to store the address and reasons of fault
    `define BUS_FAULT_NONE 3'h0
    `define BUS_FAULT_NO_SLAVE_RESPONSE 3'h1
    `define BUS_FAULT_CHANGED_SLAVE_RESPONSE 3'h2
    `define BUS_FAULT_WITHDRAWN_REQ 3'h3
    `define BUS_FAULT_READ_TIMEOUT 3'h4
    output reg  [2:0]  seg_reason;
    output reg  [31:0] seg_addr;
    output reg         seg_fault;
    
    `define BUS_MAX_READ_DELAY 32'd10000000      // If a read request is not completed in 10M cycles, a fault is issued
    reg  [31:0] read_delay_count;
    
    // Select the slave input signals of the active slave
    reg [2:0] slave_sel;
    reg       slave_valid;
    assign master_rdata = slave_rdata[32*slave_sel+:32];   
    assign master_busy = slave_busy[slave_sel];
    

    // Select the master input signals of the active master
    reg  [1:0] master_sel;
    reg  master_use_latch;
    reg  [31:0] master_addr_latch;
    reg  [31:0] master_wdata_latch;
    wire [31:0]  master_addr_sel = master_addr[32*master_sel+:32];
    wire [31:0] master_wdata_sel = master_wdata[32*master_sel+:32];
    assign slave_addr = master_use_latch ? master_addr_latch : master_addr_sel;
    assign slave_wdata = master_use_latch ? master_wdata_latch : master_wdata_sel;
    
    reg prev_busy;
    always @(posedge clk) begin
        if (reset) begin
            prev_busy <= 1'b0;
        end else begin
            if (~prev_busy & master_busy) begin
                master_addr_latch <= master_addr_sel;
                master_wdata_latch <= master_wdata_sel;
            end
            prev_busy <= master_busy;
        end 
    end
    
    
    // Find out the highest prio request
    wire [2:0] master_req_encoded;   // Encoder the lowest set bit
    wire master_req_valid;           // Set to one if at least one request is 1
    wire [7:0] master_req_input = { master_wreq[3], master_rreq[3], master_wreq[2], master_rreq[2], 
                                    master_wreq[1], master_rreq[1], master_wreq[0], master_rreq[0] };                    
	PriorityEncoder8 master_encoder(.data(master_req_input), 
	                                .enable_n(1'b0), 
                                    .result(master_req_encoded), 
                                    .result_valid(master_req_valid));
                                    
    // Find out the highest prio slave ACK
    wire [2:0] slave_ack_encoded;
    wire slave_ack_valid;
    PriorityEncoder8 slave_encoder(.data(slave_ack), 
                                   .enable_n(1'b0), 
                                   .result(slave_ack_encoded), 
                                   .result_valid(slave_ack_valid));
    
    // Core logic
    `define BUS_STATE_IDLE 3'h0  
    `define BUS_STATE_READ 3'h1
    `define BUS_STATE_WRITE 3'h2
    `define BUS_STATE_READ_DELAY 3'h3
    `define BUS_STATE_WRITE_DELAY 3'h4
    `define BUS_STATE_READ_FINISH 3'h5
    `define BUS_STATE_WRITE_FINISH 3'h6
    reg [2:0] state;
    reg [15:0] read_counter;
    
    always @(posedge clk)
    begin
        if (reset) begin
            state <= `BUS_STATE_IDLE;
            master_acc <= 4'b0000;
            slave_valid <= 1'b0;
            slave_rreq <= 1'b0;
            slave_wreq <= 1'b0;
            master_use_latch <= 1'b0;
            
            seg_fault <= 1'b0;
            seg_reason <= `BUS_FAULT_NONE;
        end else begin
            case (state) 
            `BUS_STATE_IDLE: begin
                if (master_req_valid) begin
                    if (~master_req_encoded[0]) begin
                        state <= `BUS_STATE_READ_DELAY;
                    end else begin
                        state <= `BUS_STATE_WRITE_DELAY;
                    end
                    master_sel <= master_req_encoded[2:1];
                    master_acc <= master_req_encoded[2] ? (master_req_encoded[1] ? 4'b1000 : 4'b0100) : 
                                                          (master_req_encoded[1] ? 4'b0010 : 4'b0001);
                end
                slave_valid <= 1'b0;
                seg_fault <= 1'b0;
            end
            `BUS_STATE_READ_DELAY: begin
                if (~master_rreq[master_sel]) begin
                    seg_fault <= 1'b1;
                    seg_reason <= `BUS_FAULT_WITHDRAWN_REQ;
                    state <= `BUS_STATE_IDLE;
                end else begin 
                    slave_rreq <= 1'b1;
                    state <= `BUS_STATE_READ;
                    read_counter <= 16'd1;
                    read_delay_count <= 32'd0;
                end
            end
            `BUS_STATE_READ: begin
                if ((~slave_valid & slave_ack_valid) || (slave_valid & (slave_sel == slave_ack_encoded))) begin
                    slave_sel <= slave_ack_encoded;
                    slave_valid <= 1'b1;
                    if (~master_rreq[master_sel]) begin  // The request no longer persists
                        master_acc <= 4'h0;
                        slave_rreq = 1'b0;
                        state <= `BUS_STATE_READ_FINISH;
                    end else if (master_busy) begin
                        read_counter <= read_counter + 16'd1;
                    end
                end else begin
                    seg_fault <= 1'b1;
                    if (~slave_ack_valid)
                        seg_reason <= `BUS_FAULT_NO_SLAVE_RESPONSE;
                    else
                        seg_reason <= `BUS_FAULT_CHANGED_SLAVE_RESPONSE;
                    seg_addr <= slave_addr;
                    slave_rreq <= 1'b0;
                    slave_valid <= 1'b0;
                end
            end
            `BUS_STATE_READ_FINISH: begin
                read_delay_count <= read_delay_count + 32'd1;
                if (read_delay_count == `BUS_MAX_READ_DELAY) begin
                    seg_fault <= 1'b1;
                    seg_reason = `BUS_FAULT_READ_TIMEOUT;
                    state <= `BUS_STATE_IDLE;
                end else begin
                    if (~master_busy & (read_counter == 16'd1)) begin
                        state <= `BUS_STATE_IDLE;
                    end else if (~master_busy) begin
                        read_counter <= read_counter - 16'd1;
                    end
                end
            end
            `BUS_STATE_WRITE_DELAY: begin
                if (~master_wreq[master_sel]) begin
                    seg_fault <= 1'b1;
                    seg_reason <= `BUS_FAULT_WITHDRAWN_REQ;
                    state <= `BUS_STATE_IDLE;
                end else begin
                    slave_wreq <= 1'b1;
                    master_use_latch <= 1'b0;
                    state <= `BUS_STATE_WRITE;
                end
            end
            `BUS_STATE_WRITE: begin
                if ((~slave_valid & slave_ack_valid) || (slave_valid & (slave_sel == slave_ack_encoded))) begin
                    slave_sel <= slave_ack_encoded;
                    slave_valid <= 1'b1;
                    if (~master_wreq[master_sel] & ~master_busy) begin  // The request no longer persists
                        master_acc <= 4'h0;
                        slave_wreq = 1'b0;
                        state <= `BUS_STATE_WRITE_FINISH;
                        master_use_latch <= 1'b0;
                    end else if (~slave_valid) begin
                        master_use_latch <= 1'b0;
                    end else begin
                        master_use_latch <= master_busy;
                    end
                end else begin
                    seg_fault <= 1'b1;
                    if (~slave_ack_valid)
                        seg_reason <= `BUS_FAULT_NO_SLAVE_RESPONSE;
                    else
                        seg_reason <= `BUS_FAULT_CHANGED_SLAVE_RESPONSE;
                    seg_addr <= slave_addr;
                    slave_wreq <= 1'b0;
                    state <= `BUS_STATE_IDLE;
                end
            end
            `BUS_STATE_WRITE_FINISH: begin
                if (~master_busy) begin
                    state <= `BUS_STATE_IDLE;
                end
            end 
            endcase
        end
    end
  
endmodule