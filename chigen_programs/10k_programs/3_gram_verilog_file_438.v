// Seed: 3373039854
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    output wire id_4,
    input tri1 id_5,
    input uwire id_6
    , id_29,
    output wire id_7,
    output wand id_8,
    output supply0 id_9,
    output supply1 id_10,
    input wand id_11,
    input tri id_12,
    input supply1 id_13,
    input uwire id_14,
    input supply1 id_15,
    output supply0 id_16,
    output wand id_17,
    input wand id_18,
    input wor id_19,
    input tri0 id_20,
    output uwire id_21,
    input wor id_22,
    output uwire id_23,
    input wor id_24,
    output supply1 id_25,
    output wor id_26,
    input wor id_27
);
  wire id_30 = 1;
  wire id_31;
  id_32(
      .id_0(id_22 == 1), .id_1(1)
  );
  wire id_33;
  assign id_8 = id_13;
  pulldown (1, 1);
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    input wand id_2,
    input tri id_3
);
  bufif0 (id_0, id_2, id_3);
  module_0(
      id_2,
      id_2,
      id_3,
      id_2,
      id_0,
      id_3,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_2,
      id_3,
      id_3,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1
  ); id_5(
      .id_0((1'd0)), .id_1(id_2 < id_0), .id_2(), .id_3(id_1), .id_4(1), .id_5(1), .id_6(id_1)
  );
endmodule
