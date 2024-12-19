// Seed: 330823763
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1 ? 1'h0 != id_1 : id_1 == "";
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  tri1 id_8 = 1;
  nand primCall (id_1, id_7, id_3, id_8, id_2);
  module_0 modCall_1 (
      id_3,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_8 = id_8;
  module_0 modCall_1 (
      id_8,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule
