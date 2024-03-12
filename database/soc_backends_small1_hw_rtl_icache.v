//`define ICDEBUG 1
//`define DUMMY_CACHE

// Number of cache lines
`define IC_WIDTH_BITS 4
`define IC_LINES_BITS 6
`define IC_WIDTH_ZERO 4'b0000
`define IC_WIDTH_ONES 4'b1111

`define IC_WIDTH (1<<`IC_WIDTH_BITS)
`define IC_LINES (1<<`IC_LINES_BITS)

`ifdef DUMMY_CACHE
module toy_icache(input clk,
                  input             reset,

                  input [31:0]      ic_addr,
                  input             ic_rq,
                  output reg        ic_data_out_valid,
                  output reg [31:0] ic_data_out,

                  // memory bus interface
                  input [31:0]      data_in, // bus data in
                  input             data_in_ready, // bus data ready
                  output reg        data_rd, // request data read 
                  output reg [31:0] data_address // output data address
                  );
   always @(posedge clk)
     begin
        data_address <= ic_addr;
        data_rd <= ic_rq;
        ic_data_out <= data_in;
        ic_data_out_valid <= data_in_ready;
     end

endmodule
`endif

`ifndef DUMMY_CACHE
module toy_icache(input clk,
                  input 	    reset,

                  input [31:0] 	    ic_addr,
                  input 	    ic_rq,
                  output reg 	    ic_data_out_valid,
                  output reg [31:0] ic_data_out,

                  // memory bus interface
                  input [31:0] 	    data_in, // bus data in
                  input 	    data_in_ready, // bus data ready
                  output reg 	    data_rd, // request data read 
                  output reg [31:0] data_address // output data address
                  );

   // bits 2-0 are cache line address
   // bits 31-3 are a tag
   // bits 7-3 are a line address
   // bits 7-0 are 
   

   reg [31-`IC_WIDTH_BITS+1:0]      ictags[0:`IC_LINES-1];
   reg [31:0]                       cacheram[0:`IC_LINES*`IC_WIDTH-1];

   wire [31-`IC_WIDTH_BITS:0]       addrtag;
   
   assign addrtag = ic_addr[31:`IC_WIDTH_BITS];
   
   reg [31-`IC_WIDTH_BITS+1:0]      icnewtag;
   

   parameter S_IDLE = 0;
   parameter S_FILL = 1;
   parameter S_FILL_STEP = 2;
   parameter S_FILL_START = 3;
   
   reg [2:0]                                   ic_state;

   reg [31:0]                                  ictagsout;
   reg [1:0]                                   ic_rq_shift;
   
   always @(posedge clk)
     if (!reset) begin
        ic_data_out_valid <= 0;
        ic_data_out <= 0;
        icnewtag <= 0;
        data_rd <= 0;
        ic_state <= S_IDLE;
        ictagsout <= 0;
        ic_rq_shift <= 0;
     end else begin
        ic_rq_shift <= {ic_rq_shift[0],ic_rq};
        ictagsout <= ictags[ic_addr[`IC_WIDTH_BITS+`IC_LINES_BITS-1:`IC_WIDTH_BITS]];
        case (ic_state)
          S_IDLE:
            if (ic_rq_shift[1]) begin
               if(ictagsout == {1'b1,addrtag}) // hit
                 begin
`ifdef ICDEBUG
                    $display("ICACHE HIT: %X -> %X", ic_addr, cacheram[ic_addr[`IC_WIDTH_BITS+`IC_LINES_BITS-1:0]]);
                    
`endif

                    ic_data_out <= cacheram[ic_addr[`IC_WIDTH_BITS+`IC_LINES_BITS-1:0]];
                    ic_data_out_valid <= 1;
                 end else begin // sorry, miss
`ifdef ICDEBUG
                    $display("ICACHE SHIT: %X [%X vs. %X] at %X", ic_addr, ictags[ic_addr[`IC_WIDTH_BITS+`IC_LINES_BITS-1:`IC_WIDTH_BITS]], {1'b1,addrtag}, ic_addr[`IC_WIDTH_BITS+`IC_LINES_BITS-1:`IC_WIDTH_BITS]);
`endif
                    ic_data_out_valid <= 0;
                    ictags[ic_addr[`IC_WIDTH_BITS+`IC_LINES_BITS-1:`IC_WIDTH_BITS]] <= 0; // evict
                    ic_state <= S_FILL_START;
                    data_address <= {ic_addr[31:`IC_WIDTH_BITS],`IC_WIDTH_ZERO}; // start of the line
                    data_rd <= 0;
                    icnewtag <= {1'b1, addrtag};
                 end
            end else begin 
               ic_data_out_valid <= 0;
               ic_data_out <= 0;
            end // else: !if(ic_rq_shift[1])
          S_FILL_START: begin
             ic_state <= S_FILL_STEP;
          end
          S_FILL: begin
             if (data_in_ready) begin
`ifdef ICDEBUG
                $display("ICACHE FILL %X <- %X", data_address, data_in);
`endif
                
                if (ic_rq && data_address == ic_addr) begin // a possibly premature hit, report it
`ifdef ICDEBUG
                   $display("ICACHE FHIT: %X -> %X", ic_addr, data_in);
`endif

                   ic_data_out <= data_in;
                   ic_data_out_valid <= 1;
                end else begin
                   ic_data_out_valid <= 0;
                   ic_data_out <= 0;
                end
                cacheram[data_address[`IC_LINES_BITS+`IC_WIDTH_BITS-1:0]] <= data_in;
                data_rd <= 0;
                if (data_address[`IC_WIDTH_BITS-1:0] == `IC_WIDTH_ONES) begin
`ifdef ICDEBUG
                   $display("ICACHE FILLING DONE %X at %X", icnewtag, data_address[`IC_LINES_BITS+`IC_WIDTH_BITS-1:`IC_WIDTH_BITS]);
`endif
                   
                   ictags[data_address[`IC_LINES_BITS+`IC_WIDTH_BITS-1:`IC_WIDTH_BITS]] <= icnewtag; // reclaim a line
                   ic_state <= S_IDLE;
                end else begin
                   ic_state <= S_FILL_STEP;
                   data_address <= data_address + 1;
                end
             end else begin // if (data_in_ready && ~stall)
                if (ic_rq && 
                    data_address[`IC_LINES_BITS+`IC_WIDTH_BITS-1:`IC_WIDTH_BITS]
                      ==
                    ic_addr[`IC_LINES_BITS+`IC_WIDTH_BITS-1:`IC_WIDTH_BITS]
                    && !(data_address[31:`IC_WIDTH_BITS] == ic_addr[31:`IC_WIDTH_BITS])) begin
                   // have to evict before completion
                   ictags[ic_addr[`IC_WIDTH_BITS+`IC_LINES_BITS-1:`IC_WIDTH_BITS]] <= 0;
                   ic_state <= S_IDLE;
                   ic_data_out_valid <= 0;
                end
                if (ic_rq && data_address[31:`IC_WIDTH_BITS] == ic_addr[31:`IC_WIDTH_BITS]
                    && ic_addr[`IC_WIDTH_BITS-1:0] < data_address[`IC_WIDTH_BITS-1:0]) begin
`ifdef ICDEBUG
                   $display("ICACHE FFHIT: %X -> %X [%X vs %X]", ic_addr, cacheram[ic_addr[`IC_WIDTH_BITS+`IC_LINES_BITS-1:0]],
                            ic_addr[`IC_WIDTH_BITS-1:0], data_address[`IC_WIDTH_BITS-1:0]);
                   
`endif

                   ic_data_out <= cacheram[ic_addr[`IC_WIDTH_BITS+`IC_LINES_BITS-1:0]];
                   ic_data_out_valid <= 1;
                end else begin 
                   ic_data_out_valid <= 0;
                   ic_data_out <= 0;
                end
             end
          end // case: S_FILL
          S_FILL_STEP: begin 
             data_rd <= 1;
             ic_state <= S_FILL;
             ic_data_out_valid <= 0;
             ic_data_out <= 0;
          end
        endcase // case (ic_state)
     end

endmodule
`endif //  `ifndef DUMMY_CACHE
