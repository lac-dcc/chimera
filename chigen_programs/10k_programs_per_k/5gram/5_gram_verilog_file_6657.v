// Seed: 3718580028
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  assign module_1.id_6 = 0;
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
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10 = id_8;
  wire id_11;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_10,
      id_9
  );
  assign id_9 = 1 - id_6;
  xnor primCall (id_9, id_7, id_2, id_8, id_10, id_11, id_3, id_6, id_5);
endmodule
