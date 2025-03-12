// Seed: 2841618132
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
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout supply1 id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(*) force id_1 = -1'b0;
  wire id_11;
  wire id_12;
  parameter id_13 = 1;
  wire [-1 : -1 'b0] id_14;
  assign id_5 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_2,
      id_2,
      id_2,
      id_6,
      id_6,
      id_2,
      id_6
  );
  output wire id_4;
  input wire id_3;
  and primCall (id_6, id_2, id_3);
  inout wire id_2;
  output wire id_1;
endmodule
