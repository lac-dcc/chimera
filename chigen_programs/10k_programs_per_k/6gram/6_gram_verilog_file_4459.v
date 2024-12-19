// Seed: 1187509262
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    input uwire id_2,
    input wand id_3,
    input tri id_4,
    input tri0 id_5,
    input wire id_6,
    output tri1 id_7,
    input uwire id_8,
    input uwire id_9,
    input wire id_10,
    input wor id_11,
    output tri0 id_12,
    input wire id_13,
    output supply1 id_14,
    input supply0 id_15,
    input supply1 id_16,
    input supply0 id_17,
    input tri1 id_18,
    input wire id_19,
    output wire id_20,
    input tri0 id_21,
    input wire id_22,
    input wire id_23,
    input wand id_24,
    input tri0 id_25,
    input tri id_26,
    input supply0 id_27,
    output wire id_28,
    output tri1 id_29,
    output tri0 id_30,
    input wire id_31,
    output supply1 id_32,
    output uwire id_33,
    output wand id_34,
    input tri0 id_35
);
  wire id_37;
  id_38(
      .id_0(1),
      .id_1(id_21),
      .id_2(1'd0),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(id_8),
      .id_7(),
      .id_8(1'b0),
      .id_9(id_30),
      .id_10(1),
      .id_11(id_12),
      .id_12(id_11)
  );
  assign id_7 = id_21 ? id_5 : 1;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input tri0 id_2
    , id_11,
    input wire id_3,
    input logic id_4,
    input tri1 id_5,
    input tri0 id_6,
    input supply0 id_7,
    output supply0 id_8,
    output wor id_9
);
  reg id_12;
  always @(posedge id_1 or id_5 == id_3)
    if (1) id_12 = id_11;
    else begin : LABEL_0
      id_12 <= id_7 ? id_1 * 1 : id_12;
      id_12 <= id_4;
    end
  module_0 modCall_1 (
      id_5,
      id_8,
      id_2,
      id_5,
      id_6,
      id_5,
      id_5,
      id_9,
      id_1,
      id_0,
      id_0,
      id_1,
      id_9,
      id_7,
      id_9,
      id_0,
      id_5,
      id_5,
      id_2,
      id_3,
      id_9,
      id_0,
      id_2,
      id_1,
      id_7,
      id_5,
      id_1,
      id_7,
      id_9,
      id_8,
      id_8,
      id_6,
      id_8,
      id_8,
      id_9,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
