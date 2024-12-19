// Seed: 633136790
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input wor id_2
);
  wire id_4;
  id_5(
      .id_0(id_0),
      .id_1(id_2 && 1 && 1),
      .id_2(id_0 - 1),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(id_2),
      .id_7(),
      .id_8(1),
      .id_9(id_2)
  );
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    input supply0 id_5,
    input wire id_6,
    input wand id_7,
    output logic id_8,
    output tri id_9,
    input uwire id_10,
    output uwire id_11,
    output wor id_12,
    input wor id_13,
    input uwire id_14
    , id_16
);
  wire id_17;
  initial assume ("" < 1);
  assign id_2 = 1;
  reg  id_18;
  wire id_19;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_6
  );
  assign modCall_1.id_2 = 0;
  assign id_9 = id_10;
  always @(id_18 or posedge id_18) id_8 = #id_20 id_18;
  id_21(
      .id_0(id_4), .id_1(id_13), .id_2(id_19), .id_3(1)
  );
endmodule
