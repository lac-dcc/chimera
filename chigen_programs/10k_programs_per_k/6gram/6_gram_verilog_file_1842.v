// Seed: 895697790
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input supply1 id_5,
    input wire id_6,
    input wand id_7,
    input wand id_8,
    input tri id_9,
    input wand id_10,
    input wand id_11
);
  wire id_13, id_14, id_15, id_16, id_17, id_18;
  logic id_19;
  assign id_17 = id_1;
  bit
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35;
  always @(posedge id_18) begin : LABEL_0
    id_22 = id_32;
  end
endmodule
module module_1 (
    input wire id_0,
    output tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input wor id_4,
    input wor id_5,
    input wire id_6,
    output tri0 id_7,
    input tri id_8,
    input tri1 id_9,
    output supply0 id_10
);
  assign id_10 = 1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_0,
      id_9,
      id_7,
      id_2,
      id_8,
      id_8,
      id_3,
      id_6,
      id_3,
      id_8
  );
  assign modCall_1.id_5 = 0;
  assign id_1 = ~id_2 ? -1 : id_3 ? id_0 : -1;
endmodule
