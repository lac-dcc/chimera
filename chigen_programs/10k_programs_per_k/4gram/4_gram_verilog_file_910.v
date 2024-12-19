// Seed: 4214062672
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_9;
  wire id_10 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2
  );
  wire id_5;
  wire id_6;
  wire id_7;
  assign id_4[1] = id_5;
  integer id_8;
  wire id_9;
  and primCall (id_2, id_4, id_1);
endmodule
