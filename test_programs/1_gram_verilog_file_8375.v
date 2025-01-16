// Seed: 1721557878
module module_0 #(
    parameter id_21 = 32'd14
) (
    output wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    output tri id_3,
    input uwire id_4,
    input tri0 id_5,
    input uwire id_6,
    input uwire id_7,
    input wire id_8,
    input wand id_9,
    input tri id_10,
    input uwire id_11,
    output logic id_12,
    input uwire id_13
);
  wire id_15;
  id_16 :
  assert property (@(posedge 1 | 1) id_11) id_12 <= -1;
  wire id_17 = id_6;
  tri1 id_18, id_19, id_20 = 1;
  defparam id_21 = 1;
endmodule
module module_1 (
    output tri id_0,
    input tri1 id_1,
    input wand id_2,
    output tri0 id_3,
    input wire id_4,
    output wire id_5,
    input tri id_6,
    input wire id_7,
    input uwire id_8 id_12,
    output logic id_9,
    input wor id_10
);
  assign id_5 = -1;
  id_13 :
  assert property (@* 1 - id_13) id_9 <= 1;
  wor  id_14;
  wire id_15;
  assign id_0 = id_1;
  if (id_7) tri id_16;
  localparam id_17 = id_16 - id_14;
  module_0 modCall_1 (
      id_0,
      id_12,
      id_2,
      id_5,
      id_1,
      id_4,
      id_8,
      id_1,
      id_2,
      id_7,
      id_4,
      id_2,
      id_9,
      id_2
  );
  assign modCall_1.id_4 = 0;
  assign id_3 = id_17 + 1'h0;
  assign id_9 = -1;
endmodule
