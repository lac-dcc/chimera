// Seed: 3616262161
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input wor id_2,
    input supply1 id_3,
    output uwire id_4,
    input tri1 id_5,
    output wire id_6,
    input tri0 id_7,
    output supply0 id_8
    , id_12,
    output wire id_9,
    input supply0 id_10
);
  assign id_1 = id_3;
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    output wire id_2,
    output supply0 id_3,
    input supply1 id_4,
    input supply0 id_5
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_3,
      id_4,
      id_2,
      id_3,
      id_5
  );
  assign modCall_1.id_9 = 0;
  assign id_2 = id_3++;
endmodule
