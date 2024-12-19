// Seed: 527877027
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9 = id_1[1];
  assign id_4 = 1;
  assign module_1.type_13 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  wand id_6;
  wire id_7;
  id_8(
      .id_0(~|id_6), .id_1(id_2), .id_2(id_5), .id_3(id_1), .id_4(id_1)
  );
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_10,
      id_1,
      id_5,
      id_5,
      id_6,
      id_10
  );
  wire id_11;
  and primCall (id_1, id_8, id_3, id_2, id_7, id_5);
  assign id_1 = 1;
endmodule
