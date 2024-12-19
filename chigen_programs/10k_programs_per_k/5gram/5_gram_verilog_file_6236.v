// Seed: 1912380862
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  tri id_4 = 1;
  assign id_4 = id_3;
  wire id_5;
endmodule
module module_1;
  generate
    assign id_1 = id_1;
  endgenerate
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4[1] = 1;
  bufif1 primCall (id_4, id_2, id_6);
  module_0 modCall_1 (
      id_3,
      id_6,
      id_2
  );
endmodule
