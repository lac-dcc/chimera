// Seed: 1250981323
module module_0 (
    id_1
);
  inout wire id_1;
  assign module_1.id_3 = 0;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3 = 1;
  module_0 modCall_1 (id_3);
endmodule
module module_2 (
    output uwire id_0,
    output wor   id_1,
    input  wand  id_2,
    input  uwire id_3,
    output wire  id_4,
    output uwire id_5,
    input  tri   id_6,
    input  wand  id_7,
    input  wor   id_8
);
  id_10(
      .id_0(id_8), .id_1(1'b0 - id_5), .id_2(1), .id_3(id_3 == id_5), .id_4(), .id_5(), .id_6(1)
  );
  assign id_1 = 1'h0;
endmodule
module module_3 (
    output supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    input wor id_3,
    output wire id_4,
    output wand id_5,
    input tri id_6,
    input uwire id_7,
    output supply0 id_8,
    output supply0 id_9,
    input logic id_10,
    input supply1 id_11,
    output logic id_12,
    input tri id_13
);
  always_ff id_12 <= id_10;
  module_2 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_7,
      id_5,
      id_9,
      id_6,
      id_13,
      id_11
  );
  assign modCall_1.type_14 = 0;
endmodule
