// This is a memory device with 8K words of memory that can be connected to the bus directly
// The current address range is BASE_ADDR..BASE_ADDR + 32'h8000
module InternalMemory(clk, reset, rreq, wreq, addr, wdata, rdata, busy, ack);
    input  wire clk, reset;
    input  wire rreq, wreq;
    input  wire [31:0] addr, wdata;
    output wire [31:0] rdata;
    output wire busy, ack;
    
    parameter BASE_ADDR=32'h0;

    wire [12:0] local_addr;
    wire [16:0] local_sel;
    wire [1:0]  bias;
    assign {local_sel, local_addr, bias} = addr - BASE_ADDR;
    assign ack = (rreq | wreq) & ~|local_sel;
    InternalMemoryBlock mem_block(.clock(clk), 
                                  .data(wdata), 
                                  .rdaddress(local_addr), 
                                  .wraddress(local_addr), 
                                  .wren(wreq & ack),
                                  .q(rdata));
    
    // The first read generates a one cycle latency
    reg cur_read;
    reg prev_read;
    always @(posedge clk) begin
        if (reset) begin
            cur_read <= 1'b0;
            prev_read <= 1'b0;
        end else begin
            cur_read <= rreq & ack;
            prev_read <= cur_read;
        end
    end
    assign busy = ~prev_read & cur_read;


endmodule