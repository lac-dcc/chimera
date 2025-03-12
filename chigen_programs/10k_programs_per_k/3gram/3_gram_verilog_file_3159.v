// Seed: 67638069
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    output supply1 id_2,
    output uwire id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri1 id_10,
    output tri id_11,
    input uwire id_12,
    output supply1 id_13,
    input supply1 id_14,
    input supply1 id_15
);
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd15
) (
    input wor id_0,
    output wand id_1,
    output supply0 id_2
    , id_7,
    output wor id_3,
    input uwire _id_4,
    input wand id_5
);
  wire [id_4 : 1 'b0] id_8;
  nor primCall (id_1, id_7, id_5, id_0);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_3,
      id_2,
      id_5,
      id_0,
      id_5,
      id_0,
      id_0,
      id_5,
      id_0,
      id_2,
      id_5,
      id_2,
      id_0,
      id_5
  );
endmodule
