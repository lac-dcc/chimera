// Seed: 550489911
module module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = 1'b0;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
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
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always_comb begin : LABEL_0
    id_3 <= id_1;
  end
  module_0 modCall_1 (id_4);
endmodule
