// Seed: 32463096
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1'b0 ? 1 : id_1 == 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3[|1'b0] = 1;
  module_0 modCall_1 (
      id_4,
      id_5
  );
  assign modCall_1.id_2 = 0;
  assign id_4 = 1;
  uwire id_7;
  tri   id_8 = id_7;
  initial forever $display(id_8, 1);
endmodule
