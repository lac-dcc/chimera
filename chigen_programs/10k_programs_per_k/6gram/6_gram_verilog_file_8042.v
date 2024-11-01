// Seed: 964163314
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
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
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
    id_9
);
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  and (id_8, id_6, id_9, id_2, id_4, id_11, id_10);
  tri  id_10;
  timeunit 1ps;
  wand id_11 = id_10 == id_9;
  module_0(
      id_4, id_6, id_10, id_9, id_7, id_10, id_11, id_8
  );
endmodule
