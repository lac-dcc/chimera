// Seed: 501619246
module module_0 (
    input wire id_0,
    input supply1 id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 id_6
);
  id_8(
      .id_0(1'd0), .id_1(1'd0), .id_2(~id_0), .id_3(1), .id_4(1)
  );
  wire id_9, id_10, id_11;
  wire id_12, id_13;
  wire id_14, id_15;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    output wor id_2,
    input tri id_3,
    input supply1 id_4,
    output tri id_5,
    output uwire id_6,
    output wor id_7,
    input tri id_8,
    input tri id_9,
    input supply0 id_10,
    output uwire id_11,
    output wand id_12,
    output supply0 id_13,
    input supply0 id_14,
    input tri1 id_15,
    output tri id_16
);
  module_0 modCall_1 (
      id_4,
      id_8,
      id_3,
      id_5,
      id_15,
      id_4,
      id_8
  );
  assign modCall_1.type_16 = 0;
  assign id_16 = 1;
endmodule
