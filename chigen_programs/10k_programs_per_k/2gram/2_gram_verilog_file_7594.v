// Seed: 2804919448
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
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_9;
  id_10(
      .id_0(1),
      .id_1(id_6),
      .id_2(1'b0),
      .id_3(id_3),
      .id_4(id_2 | id_1),
      .id_5(id_8),
      .id_6(id_2),
      .id_7(id_6)
  );
endmodule
module module_1 (
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  initial id_4 <= 1'h0;
  wor  id_12 = 1;
  wire id_13;
  xnor primCall (id_7, id_10, id_5, id_8, id_2, id_12, id_3, id_1);
  module_0 modCall_1 (
      id_12,
      id_5,
      id_10,
      id_5,
      id_12,
      id_13,
      id_7,
      id_13
  );
endmodule
