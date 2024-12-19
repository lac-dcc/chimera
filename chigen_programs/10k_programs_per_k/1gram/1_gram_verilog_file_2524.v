// Seed: 4042853005
module module_0 (
    output uwire id_0,
    input tri id_1,
    input tri1 id_2,
    output tri id_3,
    output wire id_4
    , id_17,
    input tri0 id_5,
    input tri0 id_6,
    input supply1 id_7,
    output tri0 id_8,
    output wor id_9,
    input wire id_10,
    output wand id_11,
    input tri0 id_12,
    output wand id_13,
    output tri0 id_14,
    output uwire id_15
);
  wire id_18, id_19;
  id_20(
      id_5
  );
  wire id_21;
endmodule
module module_1 #(
    parameter id_6 = 32'd21
) (
    output tri0 id_0,
    output logic id_1,
    input supply0 id_2
);
  logic id_4, id_5 = (1);
  assign id_1 = id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_5 = 0;
  initial id_4 <= ~id_4;
  defparam id_6 = 1;
endmodule
