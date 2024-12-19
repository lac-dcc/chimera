// Seed: 1557695947
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  tri0 id_7;
  assign id_7 = (1'b0);
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
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = 1;
  xor primCall (id_1, id_4, id_2, id_7, id_5);
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_3,
      id_4,
      id_1
  );
  assign modCall_1.type_7 = 0;
  assign id_1 = id_4;
  assign id_1 = id_5;
  assign id_1 = id_4;
endmodule
