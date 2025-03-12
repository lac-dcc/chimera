// Seed: 1629798214
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input uwire id_2,
    input supply1 id_3,
    input wand id_4,
    output supply0 id_5,
    input tri id_6,
    output supply1 id_7,
    input tri id_8,
    output uwire id_9,
    input supply1 id_10,
    input uwire id_11,
    output tri id_12,
    input tri1 id_13,
    output uwire id_14,
    output logic id_15
    , id_50,
    output logic id_16,
    output tri id_17,
    input supply1 id_18,
    output supply0 id_19,
    input uwire id_20,
    output uwire id_21,
    input wand id_22,
    input supply0 id_23,
    input wire id_24,
    input wor id_25,
    output tri0 id_26,
    output wand id_27,
    output logic id_28,
    output logic id_29,
    input tri0 id_30,
    input wand id_31,
    input supply0 id_32,
    output supply0 id_33,
    input supply0 id_34,
    output supply1 id_35,
    input tri1 id_36,
    input tri1 id_37,
    output tri id_38,
    input tri1 id_39,
    input wor id_40,
    output supply0 id_41,
    input wand id_42,
    input uwire id_43,
    input wand id_44,
    output wand id_45,
    output tri id_46,
    output wand id_47,
    output tri1 id_48
);
  always @(posedge id_2) begin : LABEL_0
    id_16 <= id_44;
    id_29 <= 1;
    $signed(59);
    ;
    forever begin : LABEL_1
      id_28 <= id_44;
      id_15 = 1;
      id_16 <= -1'b0 ** id_24;
    end
  end
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input wire id_2,
    output tri1 id_3,
    input supply0 id_4,
    input wand id_5,
    output uwire id_6,
    input wire id_7,
    output tri1 id_8,
    input supply0 id_9,
    input tri id_10,
    output wand id_11,
    input wire id_12,
    input supply0 id_13,
    output wor id_14,
    input supply0 id_15,
    input wand id_16,
    output logic id_17,
    output tri0 id_18,
    input tri id_19
    , id_22,
    inout logic id_20
);
  always @(id_1 != -1'b0) begin : LABEL_0
    assume (id_15);
    id_17 = 1;
    if (1) begin : LABEL_1
      id_20 = -1 > 1 - id_4;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_19,
      id_9,
      id_11,
      id_4,
      id_11,
      id_7,
      id_11,
      id_9,
      id_15,
      id_14,
      id_5,
      id_8,
      id_17,
      id_20,
      id_8,
      id_16,
      id_18,
      id_4,
      id_6,
      id_13,
      id_7,
      id_16,
      id_0,
      id_14,
      id_8,
      id_17,
      id_17,
      id_5,
      id_7,
      id_12,
      id_18,
      id_5,
      id_3,
      id_0,
      id_5,
      id_11,
      id_12,
      id_16,
      id_6,
      id_13,
      id_15,
      id_7,
      id_3,
      id_3,
      id_14,
      id_8
  );
  assign modCall_1.id_33 = 0;
endmodule
