// Seed: 75990987
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input tri1 id_2,
    output wand id_3,
    input supply0 id_4,
    output wor id_5,
    output tri0 id_6,
    output wor id_7,
    input tri1 id_8,
    output wor id_9
    , id_26,
    output wand id_10,
    input supply0 id_11,
    input wor id_12
    , id_27,
    input wor id_13,
    input wand id_14,
    output wire id_15,
    output tri1 id_16,
    input tri0 id_17,
    input supply0 id_18,
    input tri id_19,
    output tri0 id_20,
    input supply0 id_21,
    input supply1 id_22,
    input supply0 id_23,
    input supply0 id_24
);
  id_28 :
  assert property (@(posedge 1) 1 - id_12)
  else id_7 = id_21;
endmodule
module module_1 #(
    parameter id_10 = 32'd49,
    parameter id_9  = 32'd64
) (
    output tri  id_0,
    output tri0 id_1,
    output wand id_2,
    output wor  id_3,
    input  tri0 id_4,
    output tri  id_5,
    output wand id_6
);
  assign id_6 = 1;
  wire id_8;
  defparam id_9.id_10 = 1;
  nor (id_0, id_10, id_4, id_8);
  module_0(
      id_6,
      id_4,
      id_4,
      id_1,
      id_4,
      id_5,
      id_6,
      id_1,
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_5,
      id_4,
      id_4,
      id_4,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
