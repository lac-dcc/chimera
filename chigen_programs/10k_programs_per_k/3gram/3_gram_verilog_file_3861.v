// Seed: 1537752928
module module_0 (
    output uwire id_0,
    output tri id_1,
    input supply0 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input wor id_5,
    input tri0 id_6,
    input wand id_7,
    input wire id_8,
    output uwire id_9,
    output tri1 id_10,
    output tri id_11,
    output wand id_12,
    output tri0 id_13,
    input supply1 id_14,
    output supply0 id_15,
    output tri id_16,
    output wand id_17,
    output wire id_18,
    output tri id_19,
    input wire id_20,
    input wire id_21,
    input supply1 id_22
);
  assign id_18 = 1'b0 & 1;
  assign id_4  = 1;
  wire id_24;
  assign #id_25 id_0 = 1;
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    input tri0 id_5,
    input logic id_6,
    output tri id_7,
    input tri0 id_8,
    output logic id_9,
    output supply1 id_10,
    input tri1 id_11
);
  module_0(
      id_10,
      id_10,
      id_8,
      id_5,
      id_7,
      id_5,
      id_5,
      id_3,
      id_11,
      id_7,
      id_10,
      id_10,
      id_7,
      id_7,
      id_3,
      id_7,
      id_10,
      id_7,
      id_10,
      id_10,
      id_2,
      id_0,
      id_2
  ); id_13 :
  assert property (@(negedge 1'b0) 1)
  else begin
    if (-1) id_9 = 1 ^ 1'h0 ^ id_4 - id_2;
    $display(id_11);
  end
  always @(negedge id_0 & id_8) id_9 <= id_6;
endmodule
