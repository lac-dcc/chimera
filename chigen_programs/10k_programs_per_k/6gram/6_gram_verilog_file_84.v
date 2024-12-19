// Seed: 546860439
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    output tri1 id_2,
    input wor id_3,
    output wire id_4,
    input supply1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    output tri id_8
);
  uwire id_10;
  assign id_2 = id_0 ? 1 : 1 ? !id_6 : 1'd0;
  wire id_11;
  assign id_10 = 1'b0;
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    input tri id_2,
    input wor id_3,
    input tri1 id_4,
    input supply1 id_5
);
  uwire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_2,
      id_7,
      id_0,
      id_5,
      id_0,
      id_7
  );
  assign modCall_1.type_3 = 0;
  assign id_7 = id_2;
  wire id_8;
endmodule
