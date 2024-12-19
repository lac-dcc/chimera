// Seed: 185962548
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input uwire id_2,
    input uwire id_3,
    output tri0 id_4,
    output supply1 id_5,
    input wand id_6,
    output supply0 id_7,
    output tri id_8,
    input tri id_9,
    output supply1 id_10
);
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  id_16(
      .id_0(id_5 + 1'b0), .id_1((id_0))
  );
  assign id_10 = id_3;
  wire id_17;
  wire id_18;
  wire id_19 = 1;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    input wand id_2,
    input uwire id_3,
    output wor id_4,
    input wor id_5
    , id_8,
    output supply0 id_6
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_6,
      id_3,
      id_4
  );
  assign modCall_1.id_19 = 0;
endmodule
