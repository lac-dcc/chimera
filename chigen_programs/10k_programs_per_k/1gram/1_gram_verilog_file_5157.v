// Seed: 1655931346
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
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_14;
endmodule
module module_1 (
    input wand id_0
);
  always id_2 <= 1'b0;
  id_3 :
  assert property (@(posedge 1 or posedge ~id_0) ~1'b0) id_2 = 1;
  reg id_4, id_5, id_6;
  always
    if (1)
      if (1'b0) @(posedge 1 or posedge id_0 or posedge 1 or posedge 1'b0) id_4 <= |1;
      else id_6 = 1;
    else;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_7,
      id_3,
      id_7,
      id_3,
      id_7,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_7
  );
endmodule
