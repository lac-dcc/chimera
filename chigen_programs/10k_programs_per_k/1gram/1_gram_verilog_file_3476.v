// Seed: 644020723
module module_0 (
    input tri0 id_0,
    output tri0 id_1[-1 : -1],
    output tri0 id_2
    , id_14,
    input uwire id_3,
    output supply1 id_4,
    input tri1 id_5,
    output supply0 id_6,
    output supply0 id_7,
    output supply1 id_8,
    output wor id_9,
    input wand id_10,
    output tri0 id_11,
    output uwire id_12
);
  logic id_15;
endmodule
module module_1 #(
    parameter id_0 = 32'd49
) (
    output supply1 _id_0,
    input tri id_1,
    output supply0 id_2,
    output supply1 id_3,
    input wand id_4,
    input supply1 id_5
);
  struct packed {
    logic id_7;
    logic id_8 = 1;
    logic id_9;
    logic id_10 = 1 & 1;
    logic id_11;
    logic id_12;
    logic [id_0 : -1] id_13;
  } id_14;
  ;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_4,
      id_2,
      id_4,
      id_3,
      id_2,
      id_3,
      id_2,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_5 = 0;
  parameter id_15 = 1;
endmodule
