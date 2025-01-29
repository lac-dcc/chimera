// Seed: 2927690193
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_4;
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
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5
  );
  wire id_8, id_9;
  or primCall (id_5, id_1, id_4, id_2);
  assign id_3 = -1;
endmodule
