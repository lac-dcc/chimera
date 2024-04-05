`include "riscvConst.vh"
`include "macros.vh"

module riscvTop
(
  input clk,

`ifndef ASIC
  output       console_out_val,
  input        console_out_rdy,
  output [7:0] console_out_bits,
`endif

  input        htif_reset,

  input        htif_in_val,
  input  [3:0] htif_in_bits,
  output       htif_in_rdy,
 
  output       htif_out_clk,
  output       htif_out_val,
  output [3:0] htif_out_bits,
  
  output reg   error_core0,
  output reg   error_core1,
  output reg   error_htif
);

  reg reset_delay1;
  reg reset_delay2;

  always @(posedge clk)
  begin
    reset_delay1 <= htif_reset;
    reset_delay2 <= reset_delay1;
  end
  
  wire         htif_req_val;
  wire         htif_req_rdy;
  wire         htif_req_rw;
  wire [31:0]  htif_req_addr;
  wire [127:0] htif_req_data;
  wire [`MEM_TAG_BITS-1:0] htif_req_tag;
  wire         htif_resp_val;
  wire [127:0] htif_resp_data;
  wire [`MEM_TAG_BITS-1:0] htif_resp_tag;

  wire htif_start0;
  wire htif_start1;
  wire htif_start2;

  wire htif_fromhost_wen0;
  wire htif_fromhost_wen1;
  wire htif_fromhost_wen2;

  wire [31:0] htif_fromhost0;
  wire [31:0] htif_fromhost1;
  wire [31:0] htif_fromhost2;

  wire [31:0] htif_tohost0;
  wire [31:0] htif_tohost1;
  wire [31:0] htif_tohost2;
 
  wire error_core0_internal;
  wire error_core1_internal;
  wire error_htif_internal;

`ifdef CHIP_SMALL
  resiliency_onecache resiliency1
`else
  resiliency resiliency1
`endif
  (
    .clk(clk),
    .reset_core0(~htif_start0),
    .reset_core1(~htif_start1),
    .reset_l2(reset_delay2),
    .reset_eds(~htif_start2),

    .error_mode0(error_core0_internal),
    .error_mode1(error_core1_internal),

`ifndef ASIC
    .console_out_val(console_out_val),
    .console_out_rdy(console_out_rdy),
    .console_out_bits(console_out_bits),
`endif

    .htif_core0_fromhost_wen(htif_fromhost_wen0),
    .htif_core0_fromhost(htif_fromhost0),
    .htif_core0_tohost(htif_tohost0),

    .htif_core1_fromhost_wen(htif_fromhost_wen1),
    .htif_core1_fromhost(htif_fromhost1),
    .htif_core1_tohost(htif_tohost1),

    .htif_eds_addr(htif_req_addr[15:0]),
    .htif_eds_wen(htif_fromhost_wen2),
    .htif_eds_wdata(htif_fromhost2),
    .htif_eds_rdata(htif_tohost2),

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

`ifdef HTIF_1CLK
  HTIF_onchip_1clk htif
`else
  HTIF_onchip htif
`endif
  (
    .clk(clk),
    .rst(reset_delay2),
    .clk_offchip(htif_out_clk),

    .in_val(htif_in_val),
    .in_bits(htif_in_bits),
    .in_rdy(htif_in_rdy), 
  
    .out_rdy(1'b1),
    .out_val(htif_out_val),
    .out_bits(htif_out_bits),
   
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
    
    .htif_req_val(htif_req_val),
    .htif_req_rdy(htif_req_rdy),
    .htif_req_op(htif_req_rw),
    .htif_req_addr(htif_req_addr),
    .htif_req_data(htif_req_data),
    .htif_req_tag(htif_req_tag),
    
    .htif_resp_val(htif_resp_val),
    .htif_resp_data(htif_resp_data),
    .htif_resp_tag(htif_resp_tag),
  
    .error(error_htif_internal)
  );

  always @(posedge clk)
  begin
    if (reset_delay2)
    begin
      error_core0 <= 1'b0;
      error_core1 <= 1'b0;
      error_htif <= 1'b0;
    end
    else
    begin
      error_core0 <= error_core0_internal;
      error_core1 <= error_core1_internal;
      error_htif <= error_htif_internal;
    end
  end
  
endmodule
