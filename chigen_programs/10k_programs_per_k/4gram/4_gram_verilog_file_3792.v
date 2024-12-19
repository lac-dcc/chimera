// Seed: 2519945002
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1
  );
  assign modCall_1.id_1 = 0;
  wire id_7;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_5,
      id_6
  );
  wire id_7, id_8, id_9;
  wire id_10;
endmodule
