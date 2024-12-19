// Seed: 231228510
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output tri id_2,
    input supply1 id_3,
    input uwire id_4,
    input wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    output supply0 id_8,
    output uwire id_9,
    output supply0 id_10,
    input wor id_11,
    input wand id_12
    , id_29,
    output supply1 id_13,
    input uwire id_14,
    input wor id_15,
    output wire id_16,
    output uwire id_17,
    input supply0 id_18,
    input wor id_19,
    output tri0 id_20,
    input tri id_21,
    input supply1 id_22,
    input tri0 id_23,
    input wor id_24,
    input tri1 id_25,
    output supply0 id_26,
    input tri0 id_27
);
  wand id_30 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output tri0 id_3,
    output logic id_4,
    output tri id_5,
    input tri1 id_6,
    input tri0 id_7,
    output logic id_8,
    output uwire id_9,
    output tri1 id_10,
    input tri0 id_11,
    input logic id_12
);
  logic [7:0] id_14;
  always @(negedge 1) id_4 <= id_12;
  supply1 id_15 = 1'h0;
  assign id_4 = -id_14[1];
  wire id_16;
  always @(*) id_8 = id_12;
  id_17(
      .id_0(1'b0), .id_1(1), .id_2(id_16)
  );
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_0,
      id_11,
      id_7,
      id_0,
      id_11,
      id_1,
      id_9,
      id_9,
      id_2,
      id_11,
      id_5,
      id_7,
      id_2,
      id_3,
      id_9,
      id_0,
      id_0,
      id_3,
      id_7,
      id_6,
      id_6,
      id_0,
      id_0,
      id_1,
      id_6
  );
  assign id_3 = id_6;
  final $display(1 - 1 == 1);
endmodule
