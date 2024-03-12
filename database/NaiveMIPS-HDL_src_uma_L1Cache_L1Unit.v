module L1Unit(clk, reset, rreq, wreq, addr, hit, rdata, wdata, wmask,
              valid, my_tag_addr, my_set_addr, 
              peek_addr, peek_rdata, peek_hit);
    input  wire clk, reset;
    
    input  wire rreq, wreq;
    input  wire [31:0] addr;
    input  wire [31:0] wdata;
    input  wire [3:0] wmask;
    output wire hit;
    output wire [31:0] rdata;
    
    input  wire valid;
    input  wire [22:0] my_tag_addr;
    input  wire [3:0] my_set_addr;
    
    input  wire [31:0] peek_addr;
    output wire [31:0] peek_rdata;
    output wire peek_hit;
    
    
    reg  [31:0] mem[0:7];
    
    wire [22:0] tag_addr;
    wire [3:0]  set_addr;
    wire [2:0]  word_addr;
    wire [1:0]  word_offset;
    assign {tag_addr, set_addr, word_addr, word_offset} = addr;

    wire [22:0] peek_tag_addr;
    wire [3:0]  peek_set_addr;
    wire [2:0]  peek_word_addr;
    wire [1:0]  peek_word_offset;
    assign {peek_tag_addr, peek_set_addr, peek_word_addr, peek_word_offset} = peek_addr;
    
    wire address_match = (set_addr == my_set_addr) & (tag_addr == my_tag_addr);
    assign hit = valid & (rreq | wreq) & address_match;
    assign rdata = (valid & rreq & address_match) ? mem[word_addr] : 32'h0;
        
    wire peek_match = (peek_set_addr == my_set_addr) & (peek_tag_addr == my_tag_addr);
    assign peek_hit = valid & peek_match;
    assign peek_rdata = (valid & peek_match) ? mem[peek_word_addr] : 32'h0;
    
    wire [31:0] wmask_expanded;
    assign wmask_expanded[7:0] = wmask[0] ? 8'hFF : 8'h0;
    assign wmask_expanded[15:8] = wmask[1] ? 8'hFF : 8'h0;
    assign wmask_expanded[23:16] = wmask[2] ? 8'hFF : 8'h0;
    assign wmask_expanded[31:24] = wmask[3] ? 8'hFF : 8'h0;
    
    always @(posedge clk) begin
        if (wreq & address_match) begin
            mem[word_addr] <= (mem[word_addr] & (~wmask_expanded)) | (wdata & wmask_expanded);
        end
    end
    
endmodule 