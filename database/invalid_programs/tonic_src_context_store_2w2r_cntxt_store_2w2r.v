// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module cntxt_store_2w2r #(
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

  // processed fids
  input         [ADDR_WIDTH-1:0]      w_fid0,
  input         [ADDR_WIDTH-1:0]      w_fid1,

  // processed contexts
  input         [CONTEXT_WIDTH-1:0]   w_cntxt0,
  input         [CONTEXT_WIDTH-1:0]   w_cntxt1,

  //// Outputs
  // looked-up fids
  output reg    [ADDR_WIDTH-1:0]      l_fid0,
  output reg    [ADDR_WIDTH-1:0]      l_fid1,

  // looked-up contexts
  output        [CONTEXT_WIDTH-1:0]   l_cntxt0,
  output        [CONTEXT_WIDTH-1:0]   l_cntxt1
);

//*********************************************************************************
// Local Parameters
//*********************************************************************************

localparam  ADDR_NONE = {ADDR_WIDTH{1'b1}}; 

//*********************************************************************************
// Wires and Regs
//*********************************************************************************

// Memory Stage

wire  read_0_en, read_1_en;
wire  write_0_en, write_1_en;

wire  [CONTEXT_WIDTH-1:0]   mem_cntxt0;
wire  [CONTEXT_WIDTH-1:0]   mem_cntxt1;

reg                         l_read_0_en;
reg                         l_read_1_en;

// Context Look-Up Stage

wire  [ADDR_WIDTH-1:0]      p_fid0;
wire  [ADDR_WIDTH-1:0]      p_fid1;

wire  [CONTEXT_WIDTH-1:0]   p_cntxt0;
wire  [CONTEXT_WIDTH-1:0]   p_cntxt1;

reg   [ADDR_WIDTH-1:0]      prev_fid0;
reg   [ADDR_WIDTH-1:0]      prev_fid1;

reg   [CONTEXT_WIDTH-1:0]   prev_cntxt0;
reg   [CONTEXT_WIDTH-1:0]   prev_cntxt1;

wire  [CONTEXT_WIDTH-1:0]   zero_cntxt;
wire  [CONTEXT_WIDTH-1:0]   one_cntxt;

wire                        l_fid0_eq_p_fid0; 
wire                        l_fid0_eq_p_fid1; 

wire                        l_fid0_eq_prev_fid0; 
wire                        l_fid0_eq_prev_fid1; 

wire                        l_fid0_in_p, l_fid0_in_prev;
wire  [CONTEXT_WIDTH-1:0]   l_cntxt0_from_p, l_cntxt0_from_prev;

wire                        l_fid1_eq_p_fid0; 
wire                        l_fid1_eq_p_fid1; 

wire                        l_fid1_eq_prev_fid0; 
wire                        l_fid1_eq_prev_fid1; 

wire                        l_fid1_in_p, l_fid1_in_prev;
wire  [CONTEXT_WIDTH-1:0]   l_cntxt1_from_p, l_cntxt1_from_prev;

//*********************************************************************************
// Logic - Memory Stage
//*********************************************************************************

always @(posedge clk) begin
  if (~rst_n) begin
    l_fid0  <=  ADDR_NONE;
    l_fid1  <=  ADDR_NONE;
  end
  else begin
    l_fid0  <=  r_fid0;
    l_fid1  <=  r_fid1;
  end
end

always @(posedge clk) begin
    if (~rst_n) begin
        l_read_0_en <= 1'b0;
        l_read_1_en <= 1'b0;
    end
    else begin
        l_read_0_en <= read_0_en;
        l_read_1_en <= read_1_en;
    end
end

// RAM
assign read_0_en    = r_fid0 != ADDR_NONE;
assign read_1_en    = r_fid1 != ADDR_NONE;

assign write_0_en   = w_fid0 != ADDR_NONE;
assign write_1_en   = w_fid1 != ADDR_NONE & w_fid1 != w_fid0;

ram_2w2r #(.RAM_TYPE        (RAM_TYPE               ),
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

                                                            .w0_val     (write_0_en             ),
                                                            .w0_addr    (w_fid0                 ),
                                                            .w0_data    (w_cntxt0               ),
                                                              
                                                            .w1_val     (write_1_en             ),
                                                            .w1_addr    (w_fid1                 ),
                                                            .w1_data    (w_cntxt1               ));

                    
//*********************************************************************************
// Logic - Context Look Up (from Memory and Previous Stages)
//*********************************************************************************
assign p_fid0   = w_fid0;
assign p_fid1   = w_fid1;

assign p_cntxt0 = w_cntxt0;
assign p_cntxt1 = w_cntxt1;

assign zero_cntxt   = {CONTEXT_WIDTH{1'b0}};
assign one_cntxt    = {CONTEXT_WIDTH{1'b1}};

always @(posedge clk) begin
    if (~rst_n) begin
      prev_fid0 <=  ADDR_NONE;
      prev_fid1 <=  ADDR_NONE;
    end
    else begin
      prev_fid0 <=  p_fid0;
      prev_fid1 <=  p_fid1;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        prev_cntxt0 <= zero_cntxt;
        prev_cntxt1 <= zero_cntxt;
    end
    else begin
        prev_cntxt0 <= p_cntxt0;
        prev_cntxt1 <= p_cntxt1;
    end
end

///// Context Multiplexer

// fid0
assign l_fid0_eq_p_fid0 = l_fid0 == p_fid0;
assign l_fid0_eq_p_fid1 = l_fid0 == p_fid1;

assign l_fid0_in_p = (l_fid0_eq_p_fid0) | (l_fid0_eq_p_fid1);

assign l_cntxt0_from_p  = ((l_fid0_eq_p_fid0 ? one_cntxt : zero_cntxt) & p_cntxt0) | 
                          ((l_fid0_eq_p_fid1 ? one_cntxt : zero_cntxt) & p_cntxt1);


assign l_fid0_eq_prev_fid0 = l_fid0 == prev_fid0;
assign l_fid0_eq_prev_fid1 = l_fid0 == prev_fid1;

assign l_fid0_in_prev = (l_fid0_eq_prev_fid0) | (l_fid0_eq_prev_fid1);

assign l_cntxt0_from_prev = ((l_fid0_eq_prev_fid0 ? one_cntxt : zero_cntxt) & prev_cntxt0) | 
                            ((l_fid0_eq_prev_fid1 ? one_cntxt : zero_cntxt) & prev_cntxt1);


assign l_cntxt0 = ~l_read_0_en      ? {CONTEXT_WIDTH{1'bx}} : 
                  l_fid0_in_p       ? l_cntxt0_from_p       :
                  l_fid0_in_prev    ? l_cntxt0_from_prev    : mem_cntxt0;


// fid1
assign l_fid1_eq_p_fid0 = l_fid1 == p_fid0;
assign l_fid1_eq_p_fid1 = l_fid1 == p_fid1;

assign l_fid1_in_p = (l_fid1_eq_p_fid0) | (l_fid1_eq_p_fid1);

assign l_cntxt1_from_p  = ((l_fid1_eq_p_fid0 ? one_cntxt : zero_cntxt) & p_cntxt0) | 
                          ((l_fid1_eq_p_fid1 ? one_cntxt : zero_cntxt) & p_cntxt1);


assign l_fid1_eq_prev_fid0 = l_fid1 == prev_fid0;
assign l_fid1_eq_prev_fid1 = l_fid1 == prev_fid1;

assign l_fid1_in_prev = (l_fid1_eq_prev_fid0) | (l_fid1_eq_prev_fid1);

assign l_cntxt1_from_prev = ((l_fid1_eq_prev_fid0 ? one_cntxt : zero_cntxt) & prev_cntxt0) | 
                            ((l_fid1_eq_prev_fid1 ? one_cntxt : zero_cntxt) & prev_cntxt1);


assign l_cntxt1 = ~l_read_1_en      ? {CONTEXT_WIDTH{1'bx}} :
                  l_fid1_in_p       ? l_cntxt1_from_p       :
                  l_fid1_in_prev    ? l_cntxt1_from_prev    : mem_cntxt1;


// clogb2 function
`include "clogb2.vh"
endmodule
