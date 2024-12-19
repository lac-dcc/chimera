// Seed: 1886769253
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  always @("") begin : LABEL_0
    id_4 <= #id_1 1 & id_1;
  end
  assign id_4 = id_2;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
