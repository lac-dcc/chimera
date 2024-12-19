// Seed: 2335853884
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    assign id_4 = 1 ? id_3 & id_6 : id_6;
  endgenerate
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input tri id_2,
    input supply1 id_3,
    input tri id_4
);
  supply1 id_6;
  assign id_6 = id_4 < 1;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule
