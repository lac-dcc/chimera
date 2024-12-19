// Seed: 2081391459
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output wand id_2,
    input wire id_3,
    input wand id_4,
    input tri id_5,
    output uwire id_6,
    output uwire id_7,
    input supply1 id_8,
    input supply1 id_9,
    output tri id_10
);
  wire id_12;
  assign module_1.type_19 = 0;
endmodule
module module_1 #(
    parameter id_15 = 32'd47,
    parameter id_16 = 32'd38
) (
    output tri1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output tri0 id_3,
    output wire id_4,
    output supply0 id_5,
    input tri1 id_6,
    input wand id_7,
    input supply1 id_8,
    input supply1 id_9,
    input supply1 id_10,
    input wand id_11
);
  wire id_13;
  integer id_14 = id_11;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5,
      id_9,
      id_9,
      id_9,
      id_14,
      id_14,
      id_11,
      id_2,
      id_5
  );
  defparam id_15.id_16 = 1;
endmodule
