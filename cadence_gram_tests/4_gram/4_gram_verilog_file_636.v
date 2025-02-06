// Seed: 1455492984
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  id_14(
      .id_0(-1),
      .id_1(1'd0),
      .id_2(id_10 && id_3),
      .id_3(id_5),
      .id_4($realtime),
      .id_5($realtime),
      .id_6(id_11[-1]),
      .id_7(1),
      .id_8(1'b0)
  );
  wire id_15;
  assign id_6 = 1'b0;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  wire id_2 = id_1[1];
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2
  );
endmodule
