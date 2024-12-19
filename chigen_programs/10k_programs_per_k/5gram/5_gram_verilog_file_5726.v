// Seed: 1313817673
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input wor id_3,
    input wire id_4,
    output tri0 id_5,
    input tri id_6,
    input wand id_7,
    output wand id_8,
    output tri1 id_9,
    input tri id_10,
    output uwire id_11,
    input wand id_12,
    input uwire id_13,
    input wand id_14,
    output tri1 id_15,
    input tri0 id_16,
    input supply1 id_17,
    input wand id_18,
    output uwire id_19,
    input tri0 id_20,
    input supply1 id_21,
    input wand id_22,
    input wand id_23,
    output supply0 id_24,
    output tri1 id_25,
    output wire id_26,
    input wor id_27,
    input wire id_28,
    input tri0 id_29,
    output wire id_30,
    input tri0 id_31,
    output logic id_32,
    input tri1 id_33,
    input wor id_34
    , id_43,
    input tri0 id_35,
    input uwire id_36,
    input wor id_37,
    input logic id_38,
    input supply1 id_39,
    input tri id_40,
    input uwire module_0
);
  always @(1) begin : LABEL_0
    if (1 < 1) begin : LABEL_0
      id_32 <= id_38;
    end
  end
  wire id_44;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    input wand id_2,
    input wor id_3,
    output wor id_4,
    output uwire id_5,
    output supply1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    output wor id_9,
    input logic id_10,
    output logic id_11,
    output tri0 id_12,
    input wire id_13,
    input wire id_14,
    input wire id_15
);
  module_0 modCall_1 (
      id_15,
      id_2,
      id_5,
      id_3,
      id_13,
      id_1,
      id_8,
      id_0,
      id_12,
      id_12,
      id_3,
      id_6,
      id_7,
      id_13,
      id_2,
      id_1,
      id_0,
      id_3,
      id_8,
      id_12,
      id_3,
      id_13,
      id_8,
      id_7,
      id_5,
      id_5,
      id_1,
      id_2,
      id_15,
      id_13,
      id_12,
      id_3,
      id_11,
      id_8,
      id_8,
      id_3,
      id_8,
      id_7,
      id_10,
      id_14,
      id_7,
      id_7
  );
  assign modCall_1.id_26 = 0;
  always @(1'b0) begin : LABEL_0
    if (id_2) begin : LABEL_0
      assign id_4#(
          .id_13(id_15),
          .id_14(id_7)
      ) = 1;
      $display(1'h0 ^ id_3);
      id_11 <= id_10;
    end
  end
endmodule
