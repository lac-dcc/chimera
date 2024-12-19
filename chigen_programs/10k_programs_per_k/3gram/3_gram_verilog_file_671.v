// Seed: 3675120508
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_5 = 1;
endmodule
macromodule module_1 #(
    parameter id_18 = 32'd2,
    parameter id_19 = 32'd22
) (
    input wor id_0,
    input wand id_1,
    output tri id_2,
    output tri1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input tri1 id_6,
    output wire id_7,
    output wire id_8,
    output tri0 id_9,
    input supply1 id_10,
    input supply0 id_11
    , id_17,
    input supply1 id_12,
    output tri0 id_13,
    output wand id_14,
    output tri0 id_15
);
  assign id_15 = 1;
  defparam id_18.id_19 = 1;
  module_0 modCall_1 (
      id_17,
      id_17,
      id_17,
      id_17,
      id_17,
      id_17,
      id_17,
      id_17
  );
  assign modCall_1.id_5 = 0;
  specify
    (negedge id_20 => (id_21 +: 1)) = (1, 1);
  endspecify
endmodule
