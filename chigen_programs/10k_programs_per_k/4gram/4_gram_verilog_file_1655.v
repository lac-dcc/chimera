// Seed: 1939054340
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout tri1 id_7;
  input wire id_6;
  inout wire id_5;
  inout tri id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_7 = 1;
  assign id_3 = 1 ? id_4 : -1 ? id_4 : id_6;
  assign id_4 = id_1 ==? -1;
  logic id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_5,
      id_5,
      id_1,
      id_4,
      id_1
  );
  wire id_6;
endmodule
