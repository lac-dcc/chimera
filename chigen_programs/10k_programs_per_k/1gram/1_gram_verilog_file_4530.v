// Seed: 2467937274
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_6 = 1;
  wire id_7;
  wire id_8;
  wire id_9;
  assign id_9 = id_2;
  assign id_3 = id_8;
  assign id_5 = id_8;
  assign id_3 = id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_5;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_3,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
