// Seed: 361623052
module module_0 (
    input tri id_0,
    input uwire id_1,
    input uwire id_2,
    output tri1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    output wire id_9,
    input supply1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    output supply0 id_13,
    input wor id_14,
    output wire id_15,
    input supply1 id_16,
    input wor id_17,
    input tri id_18,
    input supply1 id_19,
    output tri0 id_20,
    input wire id_21,
    input wire id_22,
    input wor id_23,
    input wand id_24,
    output supply0 id_25,
    input wand id_26,
    input tri id_27
);
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input tri1 id_2
);
  initial id_1 = id_2;
  id_4 :
  assert property (@(posedge 1 or posedge 1 or id_0) id_2)
  else;
  module_0(
      id_2,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1,
      id_4,
      id_2,
      id_2,
      id_0,
      id_4,
      id_4,
      id_0,
      id_0,
      id_2,
      id_1,
      id_4,
      id_0
  ); id_5(
      .id_0(1), .id_1(1), .id_2(id_0), .id_3(1), .id_4(id_0 - 1), .id_5((1))
  );
endmodule
