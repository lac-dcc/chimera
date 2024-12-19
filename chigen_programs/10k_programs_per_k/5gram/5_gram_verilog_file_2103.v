// Seed: 877706224
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire  id_6;
  uwire id_7 = 1;
  wire id_8, id_9;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_3
  );
  assign id_1 = 1;
endmodule
module module_2 ();
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.type_12 = 0;
endmodule
