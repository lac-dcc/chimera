// Seed: 1126611425
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = 1 - (1'h0 - id_2);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_3;
  always id_2 = #id_5 1'd0;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
