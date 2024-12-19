// Seed: 757134003
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input tri id_8,
    input tri id_9,
    output uwire id_10,
    input uwire id_11,
    output wire id_12,
    output supply1 id_13,
    input supply1 id_14,
    output wire id_15,
    input wire id_16,
    input wor id_17,
    output wand id_18,
    output supply0 id_19
);
  wire id_21;
  id_22 :
  assert property (@(negedge id_7) 1'h0)
  else id_22 = id_8;
  wand id_23 = id_9;
  assign module_1.id_3 = 0;
  id_24(
      .id_0((1'd0)), .id_1(1), .id_2(id_19), .id_3(1)
  );
  assign id_5 = id_17;
  tri id_25 = id_9;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output supply0 id_5,
    output wor id_6,
    output wire id_7,
    input wand id_8,
    output tri id_9,
    output uwire id_10,
    input uwire id_11,
    output wor id_12,
    output wor id_13,
    input uwire id_14,
    input tri id_15,
    input wor id_16,
    output tri1 id_17,
    output tri id_18,
    input wand id_19,
    output supply1 id_20,
    output wand id_21,
    output wire id_22
);
  static id_24(
      .id_0(id_9), .id_1(""), .id_2(1'b0), .id_3(1), .id_4(id_17#(.id_5(1))), .id_6(1)
  );
  module_0 modCall_1 (
      id_7,
      id_18,
      id_2,
      id_2,
      id_16,
      id_0,
      id_14,
      id_14,
      id_8,
      id_15,
      id_22,
      id_1,
      id_22,
      id_7,
      id_1,
      id_18,
      id_14,
      id_4,
      id_18,
      id_5
  );
endmodule
