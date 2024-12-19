// Seed: 731248872
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wand id_4,
    output tri id_5,
    output wor id_6,
    input wand id_7,
    input wand id_8,
    input tri1 id_9,
    input uwire id_10,
    input tri0 id_11,
    output tri1 id_12,
    output wor id_13,
    output tri id_14,
    output tri1 id_15,
    output tri0 id_16
);
  wire id_18;
  assign id_16 = 1'b0;
  assign id_5  = id_10;
  wire id_19;
endmodule
module module_1 (
    output wire  id_0,
    input  tri1  id_1,
    output tri0  id_2,
    input  wand  id_3,
    output logic id_4
);
  wire id_6;
  id_7(
      .id_0(id_0)
  );
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.type_3 = 0;
  always id_4 <= 1;
endmodule
