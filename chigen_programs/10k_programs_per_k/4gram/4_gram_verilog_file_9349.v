// Seed: 858236732
module module_0 (
    input tri id_0,
    input uwire id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wor id_4,
    output supply1 id_5,
    input wand id_6,
    input wor id_7,
    input tri1 id_8,
    output wire id_9,
    input wire id_10,
    input tri0 id_11,
    output tri0 id_12,
    output uwire id_13,
    output supply1 id_14,
    input supply0 id_15
);
  wire id_17;
  id_18(
      .id_0(1)
  );
  wire id_19;
  assign id_14 = id_1;
  id_20(
      .id_0(1'b0), .id_1({id_10{id_15}} > 1)
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    input  tri   id_1,
    input  tri1  id_2,
    output tri1  id_3,
    input  uwire id_4,
    input  tri0  id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_3,
      id_2,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_3,
      id_0,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1
  );
  assign id_3 = id_1;
endmodule
