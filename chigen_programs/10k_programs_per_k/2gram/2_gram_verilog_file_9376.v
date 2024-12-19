// Seed: 3849114903
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always id_2 = id_7;
  assign id_3 = id_7;
  id_10(
      .id_0(id_5), .id_1(id_3), .id_2((id_7)), .id_3(1'b0), .id_4(id_7)
  );
  wire id_11;
endmodule
module module_1 (
    output uwire id_0,
    output wand  id_1
);
  wire id_4;
  wire id_5, id_6, id_7, id_8, id_9, id_10;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_5,
      id_9,
      id_6,
      id_4,
      id_7,
      id_7,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
