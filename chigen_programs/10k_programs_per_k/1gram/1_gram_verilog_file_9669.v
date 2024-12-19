// Seed: 1541100909
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = 1'b0;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  assign id_1 = id_2;
endmodule
module module_2;
  wor id_1, id_2;
  assign id_2 = 1;
  assign id_2 = id_2;
  uwire id_3;
  assign id_3 = id_1;
  wire id_4;
  wire id_5, id_6, id_7;
endmodule
