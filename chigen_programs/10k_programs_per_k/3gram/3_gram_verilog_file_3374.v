// Seed: 2777536667
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
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = 1'b0;
  assign module_1.id_6 = 0;
endmodule
macromodule module_1 (
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
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_11 = id_10;
  id_12(
      .id_0(1), .id_1(!1), .id_2(1), .id_3(1)
  );
  wire id_13;
  assign id_6 = 1;
  id_14 :
  assert property (@(posedge 1) 1)
  else id_13 = id_11;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_13,
      id_7,
      id_9,
      id_8,
      id_6,
      id_14,
      id_11,
      id_11,
      id_11,
      id_3,
      id_9,
      id_14,
      id_2,
      id_4
  );
endmodule
