// Seed: 400850022
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    output supply1 id_3,
    input wor id_4,
    input tri0 id_5,
    input supply1 id_6,
    output uwire id_7,
    output tri id_8,
    input tri1 id_9,
    output tri id_10,
    input supply0 id_11,
    output tri1 id_12
    , id_19,
    input supply0 id_13,
    input uwire id_14,
    input supply0 id_15,
    output supply1 id_16,
    input uwire id_17
);
  wire id_20;
  id_21(
      .id_0(id_0), .id_1(id_10), .id_2(1), .id_3(1'b0)
  );
  wire id_22, id_23, id_24, id_25;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    output uwire id_2,
    input supply1 id_3,
    input supply1 id_4,
    output supply1 id_5,
    output wand id_6,
    input tri0 id_7,
    input wand id_8
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_2,
      id_3,
      id_3,
      id_7,
      id_6,
      id_6,
      id_0,
      id_6,
      id_0,
      id_5,
      id_1,
      id_3,
      id_0,
      id_2,
      id_4
  );
endmodule
