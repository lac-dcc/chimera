// Seed: 2435578146
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input wor id_2,
    input tri0 id_3,
    input wand id_4,
    input tri0 id_5,
    output wand id_6,
    id_23,
    output wand id_7,
    input wand id_8,
    input supply0 id_9,
    input wor id_10,
    output wor id_11,
    input wire id_12,
    input tri1 id_13,
    output tri1 id_14,
    input tri id_15,
    output tri0 id_16,
    input wor id_17,
    output supply0 id_18,
    input wor id_19,
    output wor id_20,
    output tri0 id_21
);
  wire id_24;
  id_25 :
  assert property (@(-1'b0) id_2) return 1;
  wire id_26;
  wire id_27;
endmodule
module module_1 (
    output uwire id_0,
    output wand  id_1,
    input  wand  id_2,
    input  tri1  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    output wire  id_6,
    output wand  id_7,
    id_18,
    output tri0  id_8,
    input  wand  id_9,
    input  tri1  id_10,
    output tri1  id_11,
    input  tri0  id_12,
    input  logic id_13,
    output logic id_14,
    input  logic id_15,
    output logic id_16
);
  assign id_0 = id_3;
  always @(1'b0 or id_10 or -1'd0) id_16 <= id_13;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_2,
      id_3,
      id_6,
      id_7,
      id_2,
      id_10,
      id_5,
      id_11,
      id_5,
      id_12,
      id_0,
      id_5,
      id_1,
      id_10,
      id_8,
      id_4,
      id_6,
      id_8
  );
  assign modCall_1.id_3 = 0;
  id_19(
      .id_0(-1), .id_1(id_18), .id_2(1), .id_3(id_11), .id_4(|1), .id_5(1)
  );
endmodule
