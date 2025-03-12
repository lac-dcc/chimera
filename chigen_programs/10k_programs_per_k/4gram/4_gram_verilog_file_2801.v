// Seed: 1102567261
module module_0 (
    input supply1 id_0,
    input tri id_1,
    output tri1 id_2,
    output uwire id_3,
    input supply1 id_4,
    output tri0 id_5,
    inout wor id_6,
    output tri0 id_7,
    input wor id_8,
    output supply0 id_9
);
  specify
    (id_11 => id_12) = (1  : -1  : !id_11, -1  : 1  : 1'b0);
    (posedge id_13 => (id_14 +: -1)) = (1, id_4  : -1  : {(id_1) {1}});
    specparam id_15 = 1;
  endspecify
endmodule
module module_1 (
    input supply0 id_0,
    output uwire id_1,
    output supply1 id_2,
    output tri1 id_3,
    output wand id_4,
    output supply1 id_5,
    output supply1 id_6,
    inout supply1 id_7,
    output tri0 id_8,
    input tri id_9,
    input supply1 id_10
    , id_13,
    output tri id_11
);
  wire id_14;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_6,
      id_7,
      id_9,
      id_8,
      id_7,
      id_5,
      id_9,
      id_2
  );
  assign modCall_1.id_14 = 0;
endmodule
