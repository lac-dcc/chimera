// Seed: 204649260
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7;
  assign module_1.id_3 = 0;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  assign #1 id_1 = 1'b0;
  assign id_1 = id_3;
  assign id_1 = 1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_4
  );
  assign id_4 = id_2;
endmodule
