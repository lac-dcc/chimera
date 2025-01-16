// Seed: 1292655457
module module_0 (
    input uwire id_0
);
  always_comb id_2 = id_0;
endmodule
module module_1 (
    input tri1 id_0
);
  initial begin : LABEL_0
    id_2 <= 1;
  end
  module_0 modCall_1 (id_0);
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_3 (
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
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_2 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_2,
      id_4,
      id_5
  );
endmodule
