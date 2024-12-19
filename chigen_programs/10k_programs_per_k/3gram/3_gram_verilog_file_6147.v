// Seed: 3881988038
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_2
  );
  uwire id_5 = id_3 | 1 ? 1'b0 : id_4 ? id_5 : id_5;
endmodule
