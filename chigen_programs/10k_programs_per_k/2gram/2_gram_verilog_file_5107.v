// Seed: 3005255298
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
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
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_3,
      id_5,
      id_2,
      id_9
  );
  wire id_14;
  wire id_15;
  assign id_11 = id_10;
  nor primCall (id_13, id_9, id_7, id_12, id_10, id_11, id_1, id_3, id_6);
  assign id_4 = 1'b0;
  wire id_16;
endmodule
