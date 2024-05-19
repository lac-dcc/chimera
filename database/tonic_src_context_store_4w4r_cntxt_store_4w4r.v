// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module cntxt_store_4w4r #(
  parameter DEPTH           = -1,
  parameter ADDR_WIDTH      = -1,
  parameter RAM_TYPE        = -1,
  parameter CONTEXT_WIDTH   = -1
)(
  input                               clk,
  input                               rst_n,

  //// Inputs
  // new fids
  input         [ADDR_WIDTH-1:0]      r_fid0,
  input         [ADDR_WIDTH-1:0]      r_fid1,
  input         [ADDR_WIDTH-1:0]      r_fid2,    
  input         [ADDR_WIDTH-1:0]      r_fid3,

  // processed fids
  input         [ADDR_WIDTH-1:0]      w_fid0,
  input         [ADDR_WIDTH-1:0]      w_fid1,
  input         [ADDR_WIDTH-1:0]      w_fid2,    
  input         [ADDR_WIDTH-1:0]      w_fid3,

  // processed contexts
  input         [CONTEXT_WIDTH-1:0]   w_cntxt0,
  input         [CONTEXT_WIDTH-1:0]   w_cntxt1,
  input         [CONTEXT_WIDTH-1:0]   w_cntxt2,
  input         [CONTEXT_WIDTH-1:0]   w_cntxt3,

  //// Outputs
  // looked-up fids
  output reg    [ADDR_WIDTH-1:0]      l_fid0,
  output reg    [ADDR_WIDTH-1:0]      l_fid1,
  output reg    [ADDR_WIDTH-1:0]      l_fid2,    
  output reg    [ADDR_WIDTH-1:0]      l_fid3,

  // looked-up contexts
  output        [CONTEXT_WIDTH-1:0]   l_cntxt0,
  output        [CONTEXT_WIDTH-1:0]   l_cntxt1,
  output        [CONTEXT_WIDTH-1:0]   l_cntxt2,
  output        [CONTEXT_WIDTH-1:0]   l_cntxt3
);

//*********************************************************************************
// Local Parameters
//*********************************************************************************

localparam  ADDR_NONE = {ADDR_WIDTH{1'b1}}; 

//*********************************************************************************
// Wires and Regs
//*********************************************************************************

// Memory Stage

wire  read_0_en, read_1_en, read_2_en, read_3_en;
wire  write_0_en, write_1_en, write_2_en, write_3_en;

wire  [CONTEXT_WIDTH-1:0]   mem_cntxt0;
wire  [CONTEXT_WIDTH-1:0]   mem_cntxt1;
wire  [CONTEXT_WIDTH-1:0]   mem_cntxt2;
wire  [CONTEXT_WIDTH-1:0]   mem_cntxt3;

reg                         l_read_0_en;
reg                         l_read_1_en;
reg                         l_read_2_en;
reg                         l_read_3_en;

// Context Look-Up Stage

wire  [ADDR_WIDTH-1:0]      p_fid0;
wire  [ADDR_WIDTH-1:0]      p_fid1;
wire  [ADDR_WIDTH-1:0]      p_fid2;
wire  [ADDR_WIDTH-1:0]      p_fid3;

wire  [CONTEXT_WIDTH-1:0]   p_cntxt0;
wire  [CONTEXT_WIDTH-1:0]   p_cntxt1;
wire  [CONTEXT_WIDTH-1:0]   p_cntxt2;
wire  [CONTEXT_WIDTH-1:0]   p_cntxt3;

reg   [ADDR_WIDTH-1:0]      prev_fid0;
reg   [ADDR_WIDTH-1:0]      prev_fid1;
reg   [ADDR_WIDTH-1:0]      prev_fid2;
reg   [ADDR_WIDTH-1:0]      prev_fid3;

reg   [CONTEXT_WIDTH-1:0]   prev_cntxt0;
reg   [CONTEXT_WIDTH-1:0]   prev_cntxt1;
reg   [CONTEXT_WIDTH-1:0]   prev_cntxt2;
reg   [CONTEXT_WIDTH-1:0]   prev_cntxt3;

wire  [CONTEXT_WIDTH-1:0]   zero_cntxt;
wire  [CONTEXT_WIDTH-1:0]   one_cntxt;

wire                        l_fid0_eq_p_fid0; 
wire                        l_fid0_eq_p_fid1; 
wire                        l_fid0_eq_p_fid2; 
wire                        l_fid0_eq_p_fid3;

wire                        l_fid0_eq_prev_fid0; 
wire                        l_fid0_eq_prev_fid1; 
wire                        l_fid0_eq_prev_fid2; 
wire                        l_fid0_eq_prev_fid3;

wire                        l_fid0_in_p, l_fid0_in_prev;
wire  [CONTEXT_WIDTH-1:0]   l_cntxt0_from_p, l_cntxt0_from_prev;

wire                        l_fid1_eq_p_fid0; 
wire                        l_fid1_eq_p_fid1; 
wire                        l_fid1_eq_p_fid2; 
wire                        l_fid1_eq_p_fid3; 

wire                        l_fid1_eq_prev_fid0; 
wire                        l_fid1_eq_prev_fid1; 
wire                        l_fid1_eq_prev_fid2; 
wire                        l_fid1_eq_prev_fid3;

wire                        l_fid1_in_p, l_fid1_in_prev;
wire  [CONTEXT_WIDTH-1:0]   l_cntxt1_from_p, l_cntxt1_from_prev;

wire                        l_fid2_eq_p_fid0; 
wire                        l_fid2_eq_p_fid1; 
wire                        l_fid2_eq_p_fid2; 
wire                        l_fid2_eq_p_fid3;

wire                        l_fid2_eq_prev_fid0; 
wire                        l_fid2_eq_prev_fid1; 
wire                        l_fid2_eq_prev_fid2; 
wire                        l_fid2_eq_prev_fid3;

wire                        l_fid2_in_p, l_fid2_in_prev;
wire  [CONTEXT_WIDTH-1:0]   l_cntxt2_from_p, l_cntxt2_from_prev;

wire                        l_fid3_eq_p_fid0; 
wire                        l_fid3_eq_p_fid1; 
wire                        l_fid3_eq_p_fid2; 
wire                        l_fid3_eq_p_fid3;

wire                        l_fid3_eq_prev_fid0; 
wire                        l_fid3_eq_prev_fid1; 
wire                        l_fid3_eq_prev_fid2; 
wire                        l_fid3_eq_prev_fid3;

wire                        l_fid3_in_p, l_fid3_in_prev;
wire  [CONTEXT_WIDTH-1:0]   l_cntxt3_from_p, l_cntxt3_from_prev;

//*********************************************************************************
// Logic - Memory Stage
//*********************************************************************************

always @(posedge clk) begin
  if (~rst_n) begin
    l_fid0  <=  ADDR_NONE;
    l_fid1  <=  ADDR_NONE;
    l_fid2  <=  ADDR_NONE;
    l_fid3  <=  ADDR_NONE;
  end
  else begin
    l_fid0  <=  r_fid0;
    l_fid1  <=  r_fid1;
    l_fid2  <=  r_fid2;
    l_fid3  <=  r_fid3;
  end
end

always @(posedge clk) begin
    if (~rst_n) begin
        l_read_0_en <= 1'b0;
        l_read_1_en <= 1'b0;
        l_read_2_en <= 1'b0;
        l_read_3_en <= 1'b0;
    end
    else begin
        l_read_0_en <= read_0_en;
        l_read_1_en <= read_1_en;
        l_read_2_en <= read_2_en;
        l_read_3_en <= read_3_en;
    end
end

// RAM
assign read_0_en    = r_fid0 != ADDR_NONE;
assign read_1_en    = r_fid1 != ADDR_NONE;
assign read_2_en    = r_fid2 != ADDR_NONE;
assign read_3_en    = r_fid3 != ADDR_NONE;

assign write_0_en   = w_fid0 != ADDR_NONE;
assign write_1_en   = w_fid1 != ADDR_NONE & w_fid1 != w_fid0;
assign write_2_en   = w_fid2 != ADDR_NONE & w_fid2 != w_fid0 & w_fid2 != w_fid1;
assign write_3_en   = w_fid3 != ADDR_NONE & w_fid3 != w_fid0 & w_fid3 != w_fid1 & w_fid3 != w_fid2;

ram_4w4r #(.RAM_TYPE        (RAM_TYPE               ),
           .RAM_DEPTH       (DEPTH                  ),
           .RAM_ADDR_WIDTH  (ADDR_WIDTH             ),
           .RAM_DATA_WIDTH  (CONTEXT_WIDTH          )) ram (.clk        (clk                    ),
                                                            .rst_n      (rst_n                  ),

                                                            .r0_val     (read_0_en              ),
                                                            .r0_addr    (r_fid0                 ),
                                                            .r0_data    (mem_cntxt0             ),
                                                                
                                                            .r1_val     (read_1_en              ),
                                                            .r1_addr    (r_fid1                 ),
                                                            .r1_data    (mem_cntxt1             ),

                                                            .r2_val     (read_2_en              ),
                                                            .r2_addr    (r_fid2                 ),
                                                            .r2_data    (mem_cntxt2             ),
                                                            
                                                            .r3_val     (read_3_en              ),
                                                            .r3_addr    (r_fid3                 ),
                                                            .r3_data    (mem_cntxt3             ),
 
 
                                                            .w0_val     (write_0_en             ),
                                                            .w0_addr    (w_fid0                 ),
                                                            .w0_data    (w_cntxt0               ),
                                                              
                                                            .w1_val     (write_1_en             ),
                                                            .w1_addr    (w_fid1                 ),
                                                            .w1_data    (w_cntxt1               ),

                                                            .w2_val     (write_2_en             ),
                                                            .w2_addr    (w_fid2                 ),
                                                            .w2_data    (w_cntxt2               ),

                                                            .w3_val     (write_3_en             ),
                                                            .w3_addr    (w_fid3                 ),
                                                            .w3_data    (w_cntxt3               ));
                                                            
                    
//*********************************************************************************
// Logic - Context Look Up (from Memory and Previous Stages)
//*********************************************************************************
assign p_fid0   = w_fid0;
assign p_fid1   = w_fid1;
assign p_fid2   = w_fid2;
assign p_fid3   = w_fid3;

assign p_cntxt0 = w_cntxt0;
assign p_cntxt1 = w_cntxt1;
assign p_cntxt2 = w_cntxt2;
assign p_cntxt3 = w_cntxt3;

assign zero_cntxt   = {CONTEXT_WIDTH{1'b0}};
assign one_cntxt    = {CONTEXT_WIDTH{1'b1}};

always @(posedge clk) begin
    if (~rst_n) begin
      prev_fid0 <=  ADDR_NONE;
      prev_fid1 <=  ADDR_NONE;
      prev_fid2 <=  ADDR_NONE;
      prev_fid3 <=  ADDR_NONE;
    end
    else begin
      prev_fid0 <=  p_fid0;
      prev_fid1 <=  p_fid1;
      prev_fid2 <=  p_fid2;
      prev_fid3 <=  p_fid3;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        prev_cntxt0 <= zero_cntxt;
        prev_cntxt1 <= zero_cntxt;
        prev_cntxt2 <= zero_cntxt;
        prev_cntxt3 <= zero_cntxt;
    end
    else begin
        prev_cntxt0 <= p_cntxt0;
        prev_cntxt1 <= p_cntxt1;
        prev_cntxt2 <= p_cntxt2;
        prev_cntxt3 <= p_cntxt3;
    end
end

///// Context Multiplexer

// fid0
assign l_fid0_eq_p_fid0 = l_fid0 == p_fid0;
assign l_fid0_eq_p_fid1 = l_fid0 == p_fid1;
assign l_fid0_eq_p_fid2 = l_fid0 == p_fid2;
assign l_fid0_eq_p_fid3 = l_fid0 == p_fid3;

assign l_fid0_in_p = (l_fid0_eq_p_fid0) | (l_fid0_eq_p_fid1) | (l_fid0_eq_p_fid2) | (l_fid0_eq_p_fid3);

assign l_cntxt0_from_p  = ((l_fid0_eq_p_fid0 ? one_cntxt : zero_cntxt) & p_cntxt0) | 
                          ((l_fid0_eq_p_fid1 ? one_cntxt : zero_cntxt) & p_cntxt1) |
                          ((l_fid0_eq_p_fid2 ? one_cntxt : zero_cntxt) & p_cntxt2) |
                          ((l_fid0_eq_p_fid3 ? one_cntxt : zero_cntxt) & p_cntxt3);  


assign l_fid0_eq_prev_fid0 = l_fid0 == prev_fid0;
assign l_fid0_eq_prev_fid1 = l_fid0 == prev_fid1;
assign l_fid0_eq_prev_fid2 = l_fid0 == prev_fid2;
assign l_fid0_eq_prev_fid3 = l_fid0 == prev_fid3;

assign l_fid0_in_prev = (l_fid0_eq_prev_fid0) | (l_fid0_eq_prev_fid1) | (l_fid0_eq_prev_fid2) | (l_fid0_eq_prev_fid3);

assign l_cntxt0_from_prev = ((l_fid0_eq_prev_fid0 ? one_cntxt : zero_cntxt) & prev_cntxt0) | 
                            ((l_fid0_eq_prev_fid1 ? one_cntxt : zero_cntxt) & prev_cntxt1) |
                            ((l_fid0_eq_prev_fid2 ? one_cntxt : zero_cntxt) & prev_cntxt2) |
                            ((l_fid0_eq_prev_fid3 ? one_cntxt : zero_cntxt) & prev_cntxt3);  


assign l_cntxt0 = ~l_read_0_en      ? {CONTEXT_WIDTH{1'bx}} : 
                  l_fid0_in_p       ? l_cntxt0_from_p       :
                  l_fid0_in_prev    ? l_cntxt0_from_prev    : mem_cntxt0;


// fid1
assign l_fid1_eq_p_fid0 = l_fid1 == p_fid0;
assign l_fid1_eq_p_fid1 = l_fid1 == p_fid1;
assign l_fid1_eq_p_fid2 = l_fid1 == p_fid2;
assign l_fid1_eq_p_fid3 = l_fid1 == p_fid3;

assign l_fid1_in_p = (l_fid1_eq_p_fid0) | (l_fid1_eq_p_fid1) | (l_fid1_eq_p_fid2) | (l_fid1_eq_p_fid3);

assign l_cntxt1_from_p  = ((l_fid1_eq_p_fid0 ? one_cntxt : zero_cntxt) & p_cntxt0) | 
                          ((l_fid1_eq_p_fid1 ? one_cntxt : zero_cntxt) & p_cntxt1) |
                          ((l_fid1_eq_p_fid2 ? one_cntxt : zero_cntxt) & p_cntxt2) |
                          ((l_fid1_eq_p_fid3 ? one_cntxt : zero_cntxt) & p_cntxt3);  


assign l_fid1_eq_prev_fid0 = l_fid1 == prev_fid0;
assign l_fid1_eq_prev_fid1 = l_fid1 == prev_fid1;
assign l_fid1_eq_prev_fid2 = l_fid1 == prev_fid2;
assign l_fid1_eq_prev_fid3 = l_fid1 == prev_fid3;

assign l_fid1_in_prev = (l_fid1_eq_prev_fid0) | (l_fid1_eq_prev_fid1) | (l_fid1_eq_prev_fid2) | (l_fid1_eq_prev_fid3);

assign l_cntxt1_from_prev = ((l_fid1_eq_prev_fid0 ? one_cntxt : zero_cntxt) & prev_cntxt0) | 
                            ((l_fid1_eq_prev_fid1 ? one_cntxt : zero_cntxt) & prev_cntxt1) |
                            ((l_fid1_eq_prev_fid2 ? one_cntxt : zero_cntxt) & prev_cntxt2) |
                            ((l_fid1_eq_prev_fid3 ? one_cntxt : zero_cntxt) & prev_cntxt3);  


assign l_cntxt1 = ~l_read_1_en      ? {CONTEXT_WIDTH{1'bx}} :
                  l_fid1_in_p       ? l_cntxt1_from_p       :
                  l_fid1_in_prev    ? l_cntxt1_from_prev    : mem_cntxt1;


// fid2
assign l_fid2_eq_p_fid0 = l_fid2 == p_fid0;
assign l_fid2_eq_p_fid1 = l_fid2 == p_fid1;
assign l_fid2_eq_p_fid2 = l_fid2 == p_fid2;
assign l_fid2_eq_p_fid3 = l_fid2 == p_fid3;

assign l_fid2_in_p = (l_fid2_eq_p_fid0) | (l_fid2_eq_p_fid1) | (l_fid2_eq_p_fid2) | (l_fid2_eq_p_fid3);

assign l_cntxt2_from_p  = ((l_fid2_eq_p_fid0 ? one_cntxt : zero_cntxt) & p_cntxt0) | 
                          ((l_fid2_eq_p_fid1 ? one_cntxt : zero_cntxt) & p_cntxt1) |
                          ((l_fid2_eq_p_fid2 ? one_cntxt : zero_cntxt) & p_cntxt2) |
                          ((l_fid2_eq_p_fid3 ? one_cntxt : zero_cntxt) & p_cntxt3);  


assign l_fid2_eq_prev_fid0 = l_fid2 == prev_fid0;
assign l_fid2_eq_prev_fid1 = l_fid2 == prev_fid1;
assign l_fid2_eq_prev_fid2 = l_fid2 == prev_fid2;
assign l_fid2_eq_prev_fid3 = l_fid2 == prev_fid3;

assign l_fid2_in_prev = (l_fid2_eq_prev_fid0) | (l_fid2_eq_prev_fid1) | (l_fid2_eq_prev_fid2) | (l_fid2_eq_prev_fid3);

assign l_cntxt2_from_prev = ((l_fid2_eq_prev_fid0 ? one_cntxt : zero_cntxt) & prev_cntxt0) | 
                            ((l_fid2_eq_prev_fid1 ? one_cntxt : zero_cntxt) & prev_cntxt1) |
                            ((l_fid2_eq_prev_fid2 ? one_cntxt : zero_cntxt) & prev_cntxt2) |
                            ((l_fid2_eq_prev_fid3 ? one_cntxt : zero_cntxt) & prev_cntxt3);  


assign l_cntxt2 = ~l_read_2_en      ? {CONTEXT_WIDTH{1'bx}} :
                  l_fid2_in_p       ? l_cntxt2_from_p       :
                  l_fid2_in_prev    ? l_cntxt2_from_prev    : mem_cntxt2;

// fid3
assign l_fid3_eq_p_fid0 = l_fid3 == p_fid0;
assign l_fid3_eq_p_fid1 = l_fid3 == p_fid1;
assign l_fid3_eq_p_fid2 = l_fid3 == p_fid2;
assign l_fid3_eq_p_fid3 = l_fid3 == p_fid3;

assign l_fid3_in_p = (l_fid3_eq_p_fid0) | (l_fid3_eq_p_fid1) | (l_fid3_eq_p_fid2) | (l_fid3_eq_p_fid3);

assign l_cntxt3_from_p  = ((l_fid3_eq_p_fid0 ? one_cntxt : zero_cntxt) & p_cntxt0) | 
                          ((l_fid3_eq_p_fid1 ? one_cntxt : zero_cntxt) & p_cntxt1) |
                          ((l_fid3_eq_p_fid2 ? one_cntxt : zero_cntxt) & p_cntxt2) |
                          ((l_fid3_eq_p_fid3 ? one_cntxt : zero_cntxt) & p_cntxt3);  


assign l_fid3_eq_prev_fid0 = l_fid3 == prev_fid0;
assign l_fid3_eq_prev_fid1 = l_fid3 == prev_fid1;
assign l_fid3_eq_prev_fid2 = l_fid3 == prev_fid2;
assign l_fid3_eq_prev_fid3 = l_fid3 == prev_fid3;

assign l_fid3_in_prev = (l_fid3_eq_prev_fid0) | (l_fid3_eq_prev_fid1) | (l_fid3_eq_prev_fid2) | (l_fid3_eq_prev_fid3);

assign l_cntxt3_from_prev = ((l_fid3_eq_prev_fid0 ? one_cntxt : zero_cntxt) & prev_cntxt0) | 
                            ((l_fid3_eq_prev_fid1 ? one_cntxt : zero_cntxt) & prev_cntxt1) |
                            ((l_fid3_eq_prev_fid2 ? one_cntxt : zero_cntxt) & prev_cntxt2) |
                            ((l_fid3_eq_prev_fid3 ? one_cntxt : zero_cntxt) & prev_cntxt3);  


assign l_cntxt3 = ~l_read_3_en      ? {CONTEXT_WIDTH{1'bx}} :
                  l_fid3_in_p       ? l_cntxt3_from_p       :
                  l_fid3_in_prev    ? l_cntxt3_from_prev    : mem_cntxt3;


// clogb2 function
`include "clogb2.vh"
endmodule
