// Seed: 3803554966
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
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10;
  assign module_1.type_13 = 0;
endmodule
module module_1 (
    input  wor  id_0,
    output wand id_1,
    input  wire id_2,
    input  wire id_3
);
  id_5(
      1, id_3
  );
  xnor primCall (id_1, id_6, id_5, id_0);
  assign id_1 = id_2;
  supply0 id_6 = 1 - 1;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_5,
      id_6
  );
  wand id_7;
  id_8(
      .id_0(id_6), .id_1(1), .id_2(id_1), .id_3(id_3), .id_4(1'h0), .id_5(1 / id_7), .id_6(1)
  );
endmodule
