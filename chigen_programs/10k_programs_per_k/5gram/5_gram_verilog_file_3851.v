// Seed: 3267347550
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    output tri1 id_2
    , id_18,
    input supply1 id_3,
    input uwire id_4,
    input wire id_5,
    output uwire id_6,
    output uwire id_7,
    output wire id_8,
    output wire id_9,
    input tri id_10,
    output supply1 id_11,
    output supply0 id_12,
    output supply0 id_13,
    input supply0 id_14,
    output tri1 id_15,
    output supply1 module_0
);
  assign id_16 = 1'b0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    output tri1 id_4
);
  assign id_4 = id_3 ? 1 == !id_3 && id_3 && id_2 : 1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_15 = 0;
endmodule
