// Seed: 1553692265
module module_0 (
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
  output wire id_9;
  output wire id_8;
  output uwire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_7 = id_1 ? 1'b0 : id_5;
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
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  xor primCall (id_4, id_1, id_5, id_3);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_6,
      id_7,
      id_4
  );
  parameter id_9 = 1;
  wire id_10;
  ;
endmodule
