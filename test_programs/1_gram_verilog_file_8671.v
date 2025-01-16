// Seed: 786930877
module module_0 #(
    parameter id_21 = 32'd39,
    parameter id_22 = 32'd2
) (
    output wire id_0,
    input uwire id_1,
    input tri0 id_2,
    input wor id_3,
    output uwire id_4,
    input tri1 id_5,
    input wand id_6,
    input supply1 id_7,
    input supply1 id_8,
    input supply1 id_9,
    input wand id_10
);
  tri0 id_12, id_13, id_14 = -1;
  wire id_15;
  assign id_13 = -1 + id_14;
  tri1 id_16;
  wire id_17, id_18;
  assign id_16 = (id_6);
  assign id_14 = -1'd0;
  wire id_19;
  parameter id_20 = -1;
  defparam id_21 = -1, id_22 = -1'd0;
endmodule
module module_1 (
    input supply1 id_0,
    output wire id_1,
    input tri0 id_2,
    output tri id_3,
    input wand id_4,
    output wor id_5,
    output tri1 id_6,
    input supply1 id_7,
    output tri1 id_8,
    output supply0 id_9,
    input wire id_10,
    input wand id_11,
    input tri0 id_12,
    input wor id_13,
    output supply0 id_14,
    input supply1 id_15
);
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_13,
      id_12,
      id_1,
      id_4,
      id_13,
      id_12,
      id_2,
      id_7,
      id_4
  );
  assign modCall_1.id_22 = 0;
endmodule
