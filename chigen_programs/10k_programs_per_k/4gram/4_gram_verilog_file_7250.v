// Seed: 2079810845
module module_0 (
    id_1,
    id_2,
    id_3,
    .id_7(id_4),
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8, id_9;
  wire id_10;
  wire id_11;
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
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_9 = id_4;
  nor (id_10, id_2, id_6, id_3, id_9, id_1, id_11, id_7, id_4);
  module_0(
      id_9, id_7, id_10, id_9, id_7, id_10
  );
endmodule
