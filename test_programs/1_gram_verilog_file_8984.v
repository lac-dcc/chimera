// Seed: 3808471312
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
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  parameter id_11 = -1'd0;
  wire id_12;
  wire id_13, id_14;
  wire id_15;
  wire id_16, id_17, id_18;
  assign id_5 = -1'b0;
  id_19(
      .id_0(-1), .id_1(-1'b0), .id_2(id_6), .id_3(-1)
  );
  wire id_20, id_21, id_22;
  wire id_23, id_24;
  assign id_10 = -1;
  assign id_21 = id_13;
endmodule
module module_1;
  wand id_1, id_2;
  tri1 id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3
  );
  always @(1) {id_3 | id_2} = 1;
endmodule
