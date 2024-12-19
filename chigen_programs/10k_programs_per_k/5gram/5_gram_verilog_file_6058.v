// Seed: 3886549535
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    output supply0 id_2,
    input wor id_3,
    input uwire id_4,
    input wor id_5,
    output uwire id_6,
    input wire id_7
    , id_12,
    input wor id_8,
    input tri1 id_9,
    output supply0 id_10
);
  wire id_13;
endmodule
module module_1 (
    output tri id_0,
    output wire id_1,
    input wire id_2,
    input tri1 id_3,
    output tri0 id_4,
    output supply1 id_5,
    output wire id_6,
    output wire id_7,
    output tri1 id_8
    , id_11,
    input tri id_9
);
  assign id_11 = id_9;
  and primCall (id_1, id_9, id_2);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_9,
      id_2,
      id_11,
      id_9,
      id_3,
      id_11,
      id_11
  );
  assign modCall_1.id_5 = 0;
  assign id_1 = 1;
endmodule
