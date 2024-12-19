// Seed: 997241205
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri0 id_2,
    output supply0 id_3
    , id_24,
    input uwire id_4,
    input supply0 id_5,
    output uwire id_6,
    output tri0 id_7,
    input tri id_8,
    output wand id_9,
    input supply1 id_10,
    input supply1 id_11,
    output wire id_12,
    input wire id_13,
    input wand id_14,
    output supply1 id_15,
    input supply1 id_16,
    input supply1 id_17,
    output tri1 id_18,
    input tri id_19,
    input uwire id_20,
    output supply1 id_21,
    output supply1 id_22
);
  wire id_25;
  assign module_1.id_1 = 0;
  assign #1 id_7 = id_1 == id_20;
  wire id_26;
  wire id_27;
  id_28(
      .id_0(1'b0), .id_1(1), .id_2((1)), .id_3(1), .id_4(1'b0), .id_5(1)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input wor id_2,
    input supply1 id_3,
    input wand id_4,
    input wand id_5,
    input uwire id_6,
    input tri id_7,
    output wand id_8
);
  wire id_10 = id_1;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_4,
      id_8,
      id_4,
      id_5,
      id_10,
      id_10,
      id_10,
      id_8,
      id_1,
      id_2,
      id_10,
      id_1,
      id_10,
      id_10,
      id_7,
      id_2,
      id_8,
      id_6,
      id_6,
      id_10,
      id_10
  );
endmodule
