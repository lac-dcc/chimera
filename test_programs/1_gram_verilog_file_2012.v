// Seed: 3756541331
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_8 = -1;
  supply1 id_9;
  id_10(
      -1'b0, (id_7), 1
  );
  assign id_5 = id_10;
  assign id_4 = 1;
  nor primCall (id_7, id_9, id_8, id_1, id_3, id_6, id_11, id_10);
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_7,
      id_9,
      id_7
  );
  assign id_9 = {1{-1}};
endmodule
