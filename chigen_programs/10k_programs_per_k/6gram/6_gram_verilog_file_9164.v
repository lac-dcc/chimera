// Seed: 397324748
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wand id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd21
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  inout wire id_5;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_5,
      id_4,
      id_5
  );
  assign modCall_1.id_5 = 0;
  output wire id_4;
  output wire _id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6 = id_2;
  logic [!  1 : id_3] id_7;
  ;
endmodule
