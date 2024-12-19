// Seed: 2487543866
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  static id_11(
      .id_0(id_10),
      .id_1(id_10),
      .id_2(id_6),
      .id_3(id_1),
      .id_4(1),
      .id_5(1),
      .id_6(id_9),
      .id_7(id_4)
  );
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  tri1 id_0,
    output tri0 id_1,
    input  wire id_2,
    output wire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  wire id_6;
  assign {1, 1, id_2} = id_0;
  tri1 id_7 = id_0 == 1;
  tri  id_8 = 1'b0;
endmodule
