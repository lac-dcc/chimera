module dma(
    clockgb, resetn,
    address, indata, outdata, load, store,
    dma_address, dma_indata, dma_outdata, dma_load, dma_store,
    dma_active
);

parameter DMA_COUNT = 8'ha0;
parameter DMA_DEST = 8'hfe;

input clockgb;
input resetn;

input [15:0] address;
input [7:0] indata;
output [7:0] outdata;
input load;
input store;

output reg [15:0] dma_address;
input [7:0] dma_indata;
output reg [7:0] dma_outdata;
output reg dma_load;
output reg dma_store;


output reg dma_active;
reg [7:0] dma_hi;
reg [7:0] dma_lo;
reg [1:0] dma_state;
reg [7:0] dma_temp;

always @(*) begin
    if (dma_state < 2) begin
        dma_address = {dma_hi, dma_lo};
    end else begin
        dma_address = {DMA_DEST, dma_lo};
    end
    
    if (dma_active) begin
        dma_load = (dma_state == 0);
        dma_store = (dma_state == 3);
    end else begin
        dma_load = 0;
        dma_store = 0;
    end
end

always @(posedge clockgb or negedge resetn) begin
    if (!resetn) begin
        dma_hi <= 0;
        dma_lo <= 0;
        dma_active <= 0;
        dma_state <= 0;
    end else begin
        if (dmac_store) begin
            dma_hi <= dmac_indata;
            dma_lo <= 0;
            dma_active <= 1'b1;
            dma_state <= 0;
        end
        
        if (dma_active) begin
            if (dma_state == 3) begin
                if (dma_lo + 1'b1 == DMA_COUNT) begin
                    dma_active <= 0;
                end
                
                dma_lo <= dma_lo + 1'b1;
            end
        
            dma_state <= dma_state + 1'b1;
            dma_outdata <= dma_indata;
        end
    end
end


wire [7:0] dmac_indata;
wire dmac_store;

rrmmap #(16'hff46) dmac_mmap(
    clockgb, resetn,
    address, indata, outdata, load, store,,
    dmac_indata, dma_hi,, dmac_store
);

endmodule
