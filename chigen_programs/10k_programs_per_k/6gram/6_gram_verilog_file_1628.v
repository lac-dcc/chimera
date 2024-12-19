// Seed: 3103207883
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wor id_3,
    output wire id_4,
    input tri1 id_5,
    output tri id_6,
    output supply1 id_7
);
  wire id_9;
  assign module_1.id_27 = 0;
  wire id_10;
endmodule
module module_1 (
    output tri1 id_0,
    output tri1 id_1,
    output supply1 id_2,
    output uwire id_3,
    input wire id_4,
    input wire id_5,
    input supply1 id_6,
    input wire id_7,
    input wor id_8,
    input wor id_9,
    input tri id_10,
    output tri1 id_11,
    input wand id_12,
    output tri id_13,
    input supply0 id_14,
    input wand id_15,
    input uwire id_16,
    output wire id_17,
    output tri1 id_18,
    input wor id_19,
    output wor id_20,
    input wand id_21,
    input wire id_22,
    output supply1 id_23
);
  assign id_11 = id_10;
  id_25(
      .id_0(1), .id_1(!id_0 == 1), .id_2(id_5 - 1), .id_3(id_19), .id_4(id_9), .id_5(id_15)
  );
  module_0 modCall_1 (
      id_19,
      id_9,
      id_12,
      id_19,
      id_2,
      id_12,
      id_2,
      id_17
  );
  wor id_26 = id_5, id_27;
  always @(posedge 1 or posedge id_14) id_13 = 1;
endmodule
