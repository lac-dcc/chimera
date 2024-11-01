// Seed: 3209346295
module module_0 (
    input tri0 id_0
    , id_19,
    input supply0 id_1,
    output uwire id_2,
    output wand id_3,
    input supply0 id_4,
    output tri0 id_5,
    output wire id_6
    , id_20,
    input tri1 id_7,
    input uwire id_8,
    output supply0 id_9,
    input uwire id_10,
    output wand id_11,
    input supply1 id_12,
    output supply1 id_13,
    input tri1 id_14,
    input supply1 id_15,
    output wand id_16,
    input wire id_17
);
  assign id_16 = 1 - id_0;
  id_21(
      .id_0(1),
      .id_1(id_12),
      .id_2(""),
      .id_3(1),
      .id_4(id_9),
      .id_5(id_8),
      .id_6(1'b0),
      .id_7(id_8),
      .id_8((1 - id_19 ? id_5 : 1'b0))
  );
  wire id_22;
endmodule
module module_1 (
    input tri0  id_0,
    input uwire id_1,
    inout tri0  id_2,
    input wand  id_3
);
  assign id_2 = 1;
  supply0 id_5 = 1;
  module_0(
      id_3,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_0,
      id_2,
      id_3
  );
endmodule
