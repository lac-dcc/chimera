// Seed: 1794454236
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial #1{{id_5, id_4, 1, id_4 | id_5}, 1, id_4} = id_3;
  id_8(
      .id_0(1),
      .id_1(id_4),
      .id_2(id_2),
      .id_3(1),
      .id_4(1'd0),
      .id_5(id_4 - 1),
      .id_6(1),
      .id_7(id_3)
  );
  wire id_9;
  id_10(
      id_4, 1'b0, id_6, 1'b0 - 1
  );
  wire id_11;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri id_5, id_6, id_7 = 1, id_8, id_9;
  assign id_8 = id_6;
  assign id_6 = id_8;
  task id_10;
    id_8 = 1;
  endtask
  uwire id_11 = 1;
  tri0  id_12;
  assign id_12 = id_7;
  assign id_1  = id_4;
  wire id_13, id_14;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6
  );
  wire id_15, id_16, id_17, id_18, id_19;
endmodule
