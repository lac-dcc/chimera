module L2Adapter(clk, reset, 
                 drreq, dwreq, daddr, dburst_size, dwdata, dbusy,
                 irreq, iwreq, iaddr, iburst_size, iwdata, ibusy,
                 l2_rreq, l2_wreq, l2_addr, l2_burst_size, l2_wdata, l2_busy);

    input clk, reset;
    
    input  wire drreq, dwreq;
    input  wire [31:0] daddr;
    input  wire [4:0]  dburst_size;
    input  wire [31:0] dwdata;
    output wire dbusy;
    
    input  wire irreq, iwreq;
    input  wire [31:0] iaddr;
    input  wire [4:0]  iburst_size;
    input  wire [31:0] iwdata;
    output wire ibusy;
    
    output reg  l2_rreq, l2_wreq;
    output reg  [31:0] l2_addr;
    output reg  [4:0]  l2_burst_size;
    output wire [31:0] l2_wdata;
    input  wire l2_busy;
    
    reg  [2:0] state;
    `define ADAPTER_STATE_IDLE 3'h0
    `define ADAPTER_STATE_WAIT 3'h2
    `define ADAPTER_STATE_DELAY 3'h1
   
    reg  use_dcache;
    
    assign l2_wdata = use_dcache ? dwdata : iwdata;
    assign dbusy =  use_dcache & (state == `ADAPTER_STATE_WAIT) ? l2_busy : 1'b1;
    assign ibusy = ~use_dcache & (state == `ADAPTER_STATE_WAIT) ? l2_busy : 1'b1;
    
    reg [4:0] burst_size_latch;
    
    // If the request from icache cannot be responded, set it as pending
    reg  pending_irreq;
    reg  pending_iwreq;
    reg  [31:0] pending_iaddr;
    reg  [4:0] pending_isize;
    wire ireq_wait = (state != `ADAPTER_STATE_IDLE) | drreq | dwreq;
    always @(posedge clk) begin
        if (reset) begin
            pending_irreq <= 1'b0;
            pending_iwreq <= 1'b0;
        end else begin
            if (~pending_irreq & ~pending_iwreq) begin
                if (ireq_wait & irreq) begin
                    pending_irreq <= 1'b1;
                    pending_iaddr <= iaddr;
                    pending_isize <= iburst_size;
                end
                if (ireq_wait & iwreq) begin
                    pending_iwreq <= 1'b1;
                    pending_iaddr <= iaddr;
                    pending_isize <= iburst_size;
                end
            end else begin
                if ((state == `ADAPTER_STATE_WAIT) & ~use_dcache) begin   
                    pending_irreq <= 1'b0;
                    pending_iwreq <= 1'b0;
                end
            end
        end
    end

    reg  pending_drreq;
    reg  pending_dwreq;    
    reg  [31:0] pending_daddr;
    reg  [4:0] pending_dsize;
    wire dreq_wait = (state != `ADAPTER_STATE_IDLE);
    always @(posedge clk) begin
        if (reset) begin
            pending_drreq <= 1'b0;
            pending_dwreq <= 1'b0;
        end else begin
            if (~pending_drreq & ~pending_dwreq) begin
                if (dreq_wait & drreq) begin
                    pending_drreq <= 1'b1;
                    pending_daddr <= daddr;
                    pending_dsize <= dburst_size;
                end
                if (dreq_wait & dwreq) begin
                    pending_dwreq <= 1'b1;
                    pending_daddr <= daddr;
                    pending_dsize <= dburst_size;
                end
            end else begin
                if ((state == `ADAPTER_STATE_WAIT) & use_dcache) begin   
                    pending_drreq <= 1'b0;
                    pending_dwreq <= 1'b0;
                end
            end
        end
    end
        
    always @(posedge clk) begin
        if (reset) begin
            state <= `ADAPTER_STATE_IDLE;
            use_dcache <= 1'b1;
            l2_rreq <= 1'b0;
            l2_wreq <= 1'b0;
        end else begin
            case (state)
            `ADAPTER_STATE_IDLE: begin
                if (drreq | dwreq | pending_drreq | pending_dwreq) begin
                    state <= `ADAPTER_STATE_DELAY;
                    if (drreq | pending_drreq) begin
                        l2_rreq <= 1'b1;
                    end else begin
                        l2_wreq <= 1'b1;
                    end
                    if (drreq | dwreq) begin
                        l2_addr <= daddr;
                        l2_burst_size <= dburst_size;
                        burst_size_latch <= dburst_size;
                    end else begin
                        l2_addr <= pending_daddr;
                        l2_burst_size <= pending_dsize;
                        burst_size_latch <= pending_dsize;
                    end
                    use_dcache <= 1'b1;
                end else if (irreq | iwreq | pending_irreq | pending_iwreq) begin
                    state <= `ADAPTER_STATE_DELAY;
                    if (irreq | pending_irreq) begin
                        l2_rreq <= 1'b1;
                    end else begin
                        l2_wreq <= 1'b1;
                    end
                    if (irreq | iwreq) begin
                        l2_addr <= iaddr;
                        l2_burst_size <= iburst_size;
                        burst_size_latch <= iburst_size;
                    end else begin
                        l2_addr <= pending_iaddr;
                        l2_burst_size <= pending_isize;
                        burst_size_latch <= pending_isize;
                    end
                    use_dcache <= 1'b0;
                end
            end
            `ADAPTER_STATE_DELAY: begin
                l2_rreq <= 1'b0;
                l2_wreq <= 1'b0;
                state <= `ADAPTER_STATE_WAIT;
            end
            `ADAPTER_STATE_WAIT: begin
                if (~l2_busy) begin
                    burst_size_latch <= burst_size_latch - 5'd1;
                    if (burst_size_latch == 5'd1) begin
                        state <= `ADAPTER_STATE_IDLE;
                    end
                end
            end
            endcase
        end
    end
endmodule
