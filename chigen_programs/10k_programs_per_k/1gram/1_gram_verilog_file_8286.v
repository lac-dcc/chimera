// Seed: 3798379968
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input wire id_2,
    input wor id_3,
    input tri0 id_4,
    output wire id_5,
    output supply1 id_6,
    output tri0 id_7,
    input tri1 id_8,
    input tri1 id_9
);
  rpmos #id_11 (.id_0(1'b0), .id_1(id_3 & -1'b0));
  assign id_7 = "" ** 1'b0;
  assign id_5 = id_11;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    input wor id_2,
    output tri1 id_3,
    input tri1 id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wor id_7,
    input wire id_8,
    input uwire id_9,
    output supply0 id_10
    , id_14,
    output tri0 id_11,
    input tri0 id_12
);
  assign id_14 = 1;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_9,
      id_5,
      id_11,
      id_11,
      id_10,
      id_4,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
