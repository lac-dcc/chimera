// Seed: 680183192
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
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_7 = id_6 - id_4;
  assign module_1.id_2 = 0;
  nmos (
      .id_0(id_9),
      .id_1(1'b0),
      .id_2(1),
      .id_3(1'b0),
      .id_4(id_7 + id_4),
      .id_5(1),
      .id_6(id_8),
      .id_7(id_9),
      .id_8(id_6),
      .id_9(1'b0),
      .id_10(""),
      .id_11(1'b0 + 1'b0),
      .id_12(- |1),
      .id_13(1'b0 - id_2)
  );
  assign id_7 = 1;
  wire id_10;
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1,
    output tri1  id_2,
    input  tri1  id_3
);
  wire id_5, id_6;
  xnor primCall (id_2, id_3, id_1, id_6, id_5);
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
endmodule
