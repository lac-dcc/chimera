// Seed: 4284595318
module module_0 #(
    parameter id_15 = 32'd7,
    parameter id_16 = 32'd92
) (
    output tri1 id_0,
    output tri1 id_1,
    output tri0 id_2,
    input uwire id_3,
    input wor id_4,
    input tri0 id_5,
    output uwire id_6,
    output tri1 id_7,
    input supply1 id_8,
    output supply0 id_9,
    input supply1 id_10,
    output supply0 id_11
);
  wire id_13;
  wire id_14;
  assign module_1.id_15 = 0;
  defparam id_15.id_16 = 1;
  wire id_17;
endmodule
module module_1 (
    inout uwire id_0,
    input tri id_1,
    input wand id_2,
    input tri1 id_3
    , id_14,
    input wand id_4,
    input tri1 id_5
    , id_15,
    output wor id_6
    , id_16,
    output supply0 id_7,
    output wor id_8,
    output wand id_9,
    input wor id_10,
    output supply0 id_11,
    output supply0 id_12
);
  pulldown (id_9, 1 == 1, 1, id_14);
  id_17(
      .id_0(1), .id_1(!id_2)
  );
  wire id_18;
  tri  id_19 = 1;
  module_0 modCall_1 (
      id_0,
      id_14,
      id_6,
      id_5,
      id_1,
      id_3,
      id_7,
      id_9,
      id_2,
      id_8,
      id_15,
      id_16
  );
  id_20(
      1, ~id_12, 'b0
  );
endmodule
