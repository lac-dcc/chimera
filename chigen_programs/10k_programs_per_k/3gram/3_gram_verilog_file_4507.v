// Seed: 3686993633
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri id_3,
    output supply1 id_4,
    input uwire id_5,
    input wor id_6,
    output wor id_7,
    input wire id_8,
    input wand id_9,
    output uwire id_10,
    input supply1 id_11,
    input tri id_12,
    input supply1 id_13
);
  wire id_15;
  wire id_16;
  id_17(
      .id_0(id_1),
      .id_1(1),
      .id_2(1),
      .id_3(id_5),
      .id_4(),
      .id_5(1),
      .id_6('b0),
      .id_7(id_5),
      .id_8(),
      .id_9(1'b0),
      .id_10(1),
      .id_11(id_0),
      .id_12(id_1)
  );
  uwire id_18 = id_0;
  id_19(
      .id_0(1), .id_1(1), .id_2(1), .id_3(), .id_4({id_3 & 1, 1'b0}), .id_5(1'h0), .id_6(1)
  );
endmodule
module module_1 (
    output wor id_0,
    input tri id_1,
    input wor id_2,
    output uwire id_3,
    input wand id_4,
    input tri0 id_5,
    input wor id_6,
    output supply1 id_7,
    input uwire id_8,
    output supply0 id_9,
    output tri id_10,
    input tri id_11
);
  wire id_13;
  module_0(
      id_11, id_5, id_8, id_5, id_10, id_8, id_4, id_10, id_6, id_8, id_10, id_1, id_6, id_8
  );
endmodule
