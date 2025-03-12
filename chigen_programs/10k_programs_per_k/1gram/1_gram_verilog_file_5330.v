// Seed: 3602920887
module module_0 (
    id_1
);
  inout wire id_1;
  bit id_2, id_3, id_4;
  always id_2 = id_1;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  wire id_2;
  module_0 modCall_1 (id_2);
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout reg id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (id_1);
  assign modCall_1.id_2 = 0;
  always @(posedge -1'd0, id_1) id_4 <= -1;
endmodule
