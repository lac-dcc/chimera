// Pentevo project (c) NedoPC 2011
//
// NMI generation

`include "tune.v"

module znmi
(
  input  wire       fclk,
  input  wire       rst_n,
  input  wire       zpos,
  input  wire       zneg,
  input  wire       int_start, // when INT starts
  input  wire [1:0] set_nmi,   // NMI request from slavespi
  input  wire       clr_nmi, // clear nmi: from zports, pulsed at out to #xxBE
  input  wire       rfsh_n,
  output reg        in_nmi, // when 1, there must be last ram page in 0000-3FFF
  output wire       gen_nmi // NMI generator: when 1, NMI_N=0, otherwise NMI_N=Z
);

  reg  [1:0] set_nmi_r;
  reg [4:0] nmi_count;
  reg [1:0] clr_count;
  reg pending_nmi;
  reg pending_clr;
  
  wire set_nmi_now;
  
  always @(posedge fclk)
    set_nmi_r <= set_nmi;

  assign set_nmi_now = (set_nmi_r[0] && (!set_nmi[0])) ||
                       (set_nmi_r[1] && (!set_nmi[1])) ;

  always @(posedge fclk, negedge rst_n)
  if (!rst_n)
    pending_nmi <= 1'b0;
  else // posedge clk
  begin
    if (int_start)
      pending_nmi <= 1'b0;
    else if (set_nmi_now)
      pending_nmi <= 1'b1;
  end

  always @(posedge fclk)
  if (clr_nmi)
    clr_count <= 2'd3;
  else if (zpos && (!rfsh_n) && (clr_count > 2'd0))
    clr_count <= clr_count - 2'd1;

  always @(posedge fclk)
  if( clr_nmi )
    pending_clr <= 1'b1;
  else if (clr_count==2'd0)
    pending_clr <= 1'b0;

  always @(posedge fclk, negedge rst_n)
  if (!rst_n)
    in_nmi <= 1'b0;
  else // posedge clk
  begin
    if (pending_clr && (clr_count == 2'd0))
      in_nmi <= 1'b0;
    else if (pending_nmi && int_start && (!in_nmi))
      in_nmi <= 1'b1;
  end

  always @(posedge fclk, negedge rst_n)
  if (!rst_n)
    nmi_count <= 5'b00000;
  else if (pending_nmi && int_start && (!in_nmi))
    nmi_count <= 5'b11111;
  else if (nmi_count[4])
    nmi_count <= nmi_count - 5'd1;

  assign gen_nmi = nmi_count[4];

endmodule

