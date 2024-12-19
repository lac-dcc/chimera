// Seed: 2074410983
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_4 = id_1 || (1);
  assign id_5 = 1'b0;
  wire id_11;
  assign id_6 = id_9;
  assign id_7 = id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_4,
      id_1,
      id_1,
      id_5,
      id_5,
      id_6,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
