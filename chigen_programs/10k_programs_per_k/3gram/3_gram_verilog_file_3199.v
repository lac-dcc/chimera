// Seed: 3819667578
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input wire id_2,
    output supply1 id_3,
    output wand id_4,
    input tri1 id_5,
    input wand id_6,
    input wire id_7,
    input supply0 id_8
    , id_17,
    input wor id_9,
    input supply0 id_10
    , id_18,
    output uwire id_11,
    input tri0 id_12,
    output wire id_13,
    input supply0 id_14,
    output wire id_15
);
  id_19(
      .id_0(id_11 ? 1 : 1'h0), .id_1(1'b0)
  );
  assign id_11 = id_8;
  always_ff @(posedge id_5);
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    input supply0 id_2,
    output wand id_3
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_3,
      id_3,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_3,
      id_1,
      id_3,
      id_0,
      id_3
  );
endmodule
