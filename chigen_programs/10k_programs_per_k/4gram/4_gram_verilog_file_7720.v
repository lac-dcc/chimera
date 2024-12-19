// Seed: 2001545334
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
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  integer id_9 = id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
  nor primCall (id_5, id_6, id_3, id_7);
  assign id_3 = id_2;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_6,
      id_2
  );
endmodule
