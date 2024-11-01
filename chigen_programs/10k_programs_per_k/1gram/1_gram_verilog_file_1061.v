// Seed: 16749759
module module_0 (
    output wor id_0,
    input wire id_1,
    output tri0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wand id_5,
    input wand id_6,
    output supply1 id_7,
    input wire id_8,
    input wire id_9,
    output tri0 id_10,
    output tri1 id_11,
    output wor id_12,
    output tri0 id_13
    , id_25,
    output uwire id_14,
    input supply1 id_15,
    output tri id_16,
    input tri0 id_17,
    input tri0 id_18,
    input uwire id_19,
    output wand id_20,
    input wand id_21,
    input tri id_22,
    input logic id_23
);
  final @(id_23) $display;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output logic id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wor id_5,
    input logic id_6,
    output tri1 id_7,
    input tri id_8,
    input uwire id_9
);
  wire id_11;
  initial begin
    id_2 <= 1'b0;
  end
  if (1'h0) assign id_7 = id_9;
  else wire id_12;
  logic id_13, id_14;
  or (id_7, id_11, id_6, id_0, id_9, id_14, id_1, id_5, id_13, id_12, id_4, id_3);
  module_0(
      id_7,
      id_4,
      id_7,
      id_9,
      id_5,
      id_9,
      id_4,
      id_7,
      id_4,
      id_3,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_4,
      id_7,
      id_3,
      id_4,
      id_3,
      id_7,
      id_8,
      id_9,
      id_6
  ); id_15 :
  assert property (@(negedge 1 ? 1 : id_6) id_13)
  else if (1) begin
    id_15 <= id_13;
  end
endmodule
