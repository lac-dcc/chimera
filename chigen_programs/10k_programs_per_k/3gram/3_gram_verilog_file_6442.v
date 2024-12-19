// Seed: 3957150554
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  always @(posedge id_2) id_5 = 1;
  wire id_6;
  wire id_7;
  assign id_4 = 1'b0;
  supply1 id_8 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wand id_4;
  assign id_3[1] = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.type_12 = 0;
  wire id_5 = id_4 == 1'b0;
endmodule
