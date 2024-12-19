// Seed: 4030340982
module module_0 ();
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_4 = 1'h0;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign #1 id_4 = 1'b0;
  always begin : LABEL_0
    id_4 <= 1;
    id_1 <= id_4;
  end
  always if (id_3) id_1 = 1;
  assign id_4 = id_2 - 1;
  assign id_4 = id_4;
endmodule
