// Seed: 4121993745
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    output uwire id_2,
    input wand id_3,
    input tri1 id_4,
    output uwire id_5,
    input tri0 id_6,
    input tri1 id_7,
    input supply1 id_8,
    input wand id_9
    , id_14,
    input tri id_10,
    input wor id_11,
    output wand id_12
);
  tri0 id_15;
  assign id_12 = id_8;
  assign id_15 = 1;
  wire id_16;
  assign module_1.type_4 = 0;
  wire id_17;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wor id_4,
    output tri0 id_5,
    input tri1 id_6#(
        .id_12(1),
        .id_13(1)
    ),
    input wand id_7,
    input tri0 id_8,
    input wand id_9,
    output tri id_10
);
  assign id_12 = 1'd0;
  always
    assume #1  (id_2);
    else;
  id_14(
      .id_0(id_6), .id_1(id_2), .id_2(1)
  );
  module_0 modCall_1 (
      id_0,
      id_4,
      id_5,
      id_9,
      id_9,
      id_0,
      id_6,
      id_8,
      id_4,
      id_2,
      id_8,
      id_3,
      id_0
  );
endmodule
