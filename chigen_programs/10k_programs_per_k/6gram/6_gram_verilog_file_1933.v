// Seed: 1683834250
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output supply0 id_2,
    output wor id_3,
    input wand id_4,
    output supply1 id_5,
    input uwire id_6,
    output wor id_7
);
  logic [7:0] id_9;
  wire id_10;
  assign id_9[1] = 1;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    output uwire id_2,
    input wand id_3,
    input supply0 id_4,
    output tri1 id_5,
    output tri0 id_6,
    inout tri id_7,
    input wand id_8,
    input tri0 id_9,
    output uwire id_10
);
  assign id_0 = id_3;
  tri0 id_12;
  wire id_13;
  assign id_6 = id_4;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_6,
      id_5,
      id_8,
      id_7,
      id_7,
      id_10
  );
  assign modCall_1.id_2 = 0;
  wire id_14;
  assign id_2 = 1 ? id_1 : id_4;
  tri   id_15;
  event id_16 = {(id_15) {1 == id_3}} < id_16;
  assign id_12 = id_8 === 1'b0;
  wor id_17 = id_9;
  assign id_0 = 1'b0 != 1;
endmodule
