`include "riscvConst.vh"
`include "macros.vh"

module riscvTop
(
  input clk,
  input reset,

  output error_mode,

//  output log_control,
  
  input         in_val,
  input   [7:0] in_bits,
  output        in_rdy,  //i have to generate this signal!!!we cannot accept data while processing the previous data!
 
  input         out_rdy,
  output        out_val,
  output  [7:0] out_bits,
  
  output       error
  
);
  
    wire        htif_start0;
   // wire        htif_stop;
    wire        htif_fromhost_wen0;
    wire [31:0] htif_fromhost0;
    wire [31:0] htif_tohost0;
    wire        htif_req_val;
    wire        htif_req_rdy;
  //  wire [3:0]  htif_req_op;
    wire        htif_req_rw;

    wire [31:0] htif_req_addr;
    wire [127:0] htif_req_data;
    wire [7:0]  htif_req_wmask;
    wire [`MEM_TAG_BITS-1:0] htif_req_tag;
    wire        htif_resp_val;
    wire [127:0] htif_resp_data;
    wire [`MEM_TAG_BITS-1:0] htif_resp_tag;

   wire htif_start1;
   wire htif_start2;
   wire htif_start3;

   wire htif_fromhost_wen1;
   wire htif_fromhost_wen2;
   wire htif_fromhost_wen3;

   wire [31:0] htif_fromhost1;
   wire [31:0] htif_fromhost2;
   wire [31:0] htif_fromhost3; 

   wire [31:0] htif_tohost1;
   wire [31:0] htif_tohost2;
   wire [31:0] htif_tohost3;
  
   assign htif_req_wmask = (reset) ? '0 : '1;
  
//  assign htif_tohost1 = 32'b0;
  assign htif_tohost2 = 32'b0;
  assign htif_tohost3 = 32'b0;

resiliency resiliency1
(
  .clk(clk),
  .reset(reset),

  .error_mode(error_mode),

  .htif_start(htif_start0),
  .htif_fromhost_wen(htif_fromhost_wen0),
  .htif_fromhost(htif_fromhost0),
  .htif_tohost(htif_tohost0),

  .htif_req_val(htif_req_val),
  .htif_req_rdy(htif_req_rdy),
  .htif_req_rw(htif_req_rw),
  .htif_req_addr(htif_req_addr[17:4]),
  .htif_req_data(htif_req_data),
  .htif_req_tag(htif_req_tag),
  .htif_resp_val(htif_resp_val),
  .htif_resp_data(htif_resp_data),
  .htif_resp_tag(htif_resp_tag)
);

 
  HTIF_onchip htif
  (
    .clk(clk),
    .rst(reset),
  
    .in_val(in_val),
    .in_bits(in_bits),
    .in_rdy(in_rdy),  //i have to generate this signal!!!we cannot accept data while processing the previous data!
  
    .out_rdy(out_rdy),
    .out_val(out_val),
    .out_bits(out_bits),
   
    .htif_start0(htif_start0),
    .htif_fromhost_wen0(htif_fromhost_wen0),
    .htif_fromhost0(htif_fromhost0),
    .htif_tohost0(htif_tohost0),

    .htif_start1(htif_start1),
    .htif_fromhost_wen1(htif_fromhost_wen1),
    .htif_fromhost1(htif_fromhost1),
    .htif_tohost1(htif_tohost1),

    .htif_start2(htif_start2),
    .htif_fromhost_wen2(htif_fromhost_wen2),
    .htif_fromhost2(htif_fromhost2),
    .htif_tohost2(htif_tohost2),

    .htif_start3(htif_start3),
    .htif_fromhost_wen3(htif_fromhost_wen3),
    .htif_fromhost3(htif_fromhost3),
    .htif_tohost3(htif_tohost3),
    
    .htif_req_val(htif_req_val),
    .htif_req_rdy(htif_req_rdy),
    .htif_req_op(htif_req_rw),
    .htif_req_addr(htif_req_addr),
    .htif_req_data(htif_req_data),
  //  output  [7:0] htif_req_wmask,
    .htif_req_tag(htif_req_tag),
    
    .htif_resp_val(htif_resp_val),
    .htif_resp_data(htif_resp_data),
    .htif_resp_tag(htif_resp_tag),
  
    .error(error)
  );
  
  
  endmodule

