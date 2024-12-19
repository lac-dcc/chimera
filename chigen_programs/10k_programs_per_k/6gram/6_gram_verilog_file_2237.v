// Seed: 306305019
module module_0 (
    input wire id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri id_3,
    input wand id_4,
    input supply1 id_5
    , id_13,
    output wire id_6,
    input wand id_7,
    input wor id_8,
    input wire id_9,
    input wor id_10,
    output tri id_11
);
  wire id_14;
  id_15(
      .id_0(1), .id_1(1)
  );
  tri0 id_16, id_17;
  wire id_18;
  assign id_17 = id_10;
  always begin : LABEL_0
    id_14 = !id_8;
  end
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input uwire id_2,
    output tri id_3,
    input uwire id_4,
    output supply0 id_5,
    input logic id_6
    , id_10,
    input wire id_7,
    output tri0 id_8
);
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_7,
      id_7,
      id_1,
      id_5,
      id_7,
      id_2,
      id_7,
      id_2,
      id_8
  );
  assign modCall_1.id_6 = 0;
  always @(posedge id_11) force id_5 = id_6;
endmodule
