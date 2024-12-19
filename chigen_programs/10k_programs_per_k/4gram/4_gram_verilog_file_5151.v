// Seed: 1924805108
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_7 = {id_1, 0};
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  xor primCall (id_6, id_2, id_8, id_7, id_1, id_4, id_5, id_3);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6,
      id_1,
      id_7,
      id_5,
      id_6
  );
endmodule
