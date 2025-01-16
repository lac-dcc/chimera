// Seed: 1267401723
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  wire id_8;
  parameter id_9 = (id_4) * id_5 && id_7 == 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_4,
      id_4,
      id_1
  );
  wire id_8;
  wire id_9;
  and primCall (id_1, id_4, id_2, id_7, id_5);
  assign id_5 = 1 & id_2;
  initial if (id_2) id_8 = -1;
endmodule
