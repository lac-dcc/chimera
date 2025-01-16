// Seed: 696905041
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input uwire id_2,
    input uwire id_3,
    input wor id_4,
    input wor id_5,
    input uwire id_6,
    input tri id_7,
    input tri id_8,
    id_13,
    input supply1 id_9,
    output wire id_10,
    input wire id_11
);
  wire id_14, id_15, id_16;
  wire id_17;
  id_18(
      .id_0(id_10), .id_1(1), .id_2(id_4 & id_11)
  );
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    output logic id_2,
    output tri   id_3,
    input  tri0  id_4,
    input  uwire id_5,
    output tri0  id_6,
    input  logic id_7,
    input  tri0  id_8,
    input  wand  id_9,
    output tri0  id_10,
    input  tri1  id_11,
    input  wand  id_12,
    output tri0  id_13,
    input  wire  id_14,
    input  wand  id_15
);
  assign id_3 = -1;
  final begin : LABEL_0
    id_2 <= id_7;
  end
  module_0 modCall_1 (
      id_15,
      id_10,
      id_14,
      id_5,
      id_1,
      id_1,
      id_11,
      id_4,
      id_14,
      id_15,
      id_3,
      id_8
  );
  assign modCall_1.id_8 = 0;
  wire id_17, id_18, id_19;
endmodule
