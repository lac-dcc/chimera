module DirectLoader(clk, reset, rreq, wreq, addr, rdata, wdata, miss, 
                    bus_rreq, bus_wreq, bus_addr, bus_acc, bus_rdata, bus_wdata, bus_busy);
                    
    input  wire clk, reset;
    
    input  wire rreq, wreq;
    input  wire [31:0] addr, wdata;
    output reg  [31:0] rdata;
    output reg  miss;
    
    output reg  bus_rreq, bus_wreq;
    output reg  [31:0] bus_addr;
    output reg  [31:0] bus_wdata;
    input  wire bus_acc, bus_busy;
    input  wire [31:0] bus_rdata;
    
    reg [2:0] state;
    `define DL_STATE_IDLE 3'h0
    `define DL_STATE_RWAIT 3'h1
    `define DL_STATE_RDELAY 3'h2
    `define DL_STATE_READ 3'h3
    `define DL_STATE_WWAIT 3'h4
    `define DL_STATE_WRITE 3'h5
    `define DL_STATE_FINISH 3'h6
    
    always @(posedge clk) begin
        if (reset) begin
            state <= 3'h0;
            bus_rreq <= 1'b0;
            bus_wreq <= 1'b0;
            miss <= 1'b1;
        end else begin
            case (state) 
            `DL_STATE_IDLE: begin
                if (rreq) begin
                    bus_rreq <= 1'b1;
                    state <= `DL_STATE_RWAIT;
                end else if (wreq) begin
                    bus_wreq <= 1'b1;
                    state <= `DL_STATE_WWAIT;
                end
            end
            `DL_STATE_RWAIT: begin
                if (bus_acc) begin
                    bus_addr <= addr;
                    bus_rreq <= 1'b0;
                    state <= `DL_STATE_RDELAY;
                end
            end
            `DL_STATE_RDELAY: begin
                state <= `DL_STATE_READ;
            end
            `DL_STATE_READ: begin
                if (~bus_busy) begin
                    rdata <= bus_rdata;
                    miss <= 1'b0;
                    state <= `DL_STATE_FINISH;
                end
            end
            `DL_STATE_WWAIT: begin
                if (bus_acc) begin
                    bus_addr <= addr;
                    bus_wreq <= 1'b0;
                    bus_wdata <= wdata;
                    state <= `DL_STATE_WRITE;
                end
            end
            `DL_STATE_WRITE: begin
                if (~bus_acc) begin
                    miss <= 1'b0;
                    state <= `DL_STATE_FINISH;
                end
            end
            `DL_STATE_FINISH: begin
                miss <= 1'b1;
                state <= `DL_STATE_IDLE;
            end
            endcase
        end
    end
              
endmodule