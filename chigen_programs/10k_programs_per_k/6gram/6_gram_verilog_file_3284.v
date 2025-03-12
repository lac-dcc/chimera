// Seed: 66485389
module module_0 (
    input wire id_0,
    input wand id_1,
    input tri0 id_2,
    input uwire id_3,
    input wor id_4,
    input uwire id_5,
    output wand id_6,
    output supply1 id_7,
    output supply1 id_8
);
  wire id_10;
  wire id_11;
  assign id_6 = {1} | id_3;
  assign module_1.id_44 = 0;
endmodule
module module_1 (
    input tri id_0,
    output tri0 id_1,
    input tri id_2,
    output tri0 id_3,
    input wand id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri id_7,
    output logic id_8,
    input wor id_9
    , id_44,
    input tri id_10,
    input wire id_11,
    input tri id_12,
    input wire id_13,
    input tri0 id_14,
    output tri id_15,
    input wor id_16,
    input wand id_17,
    output supply1 id_18,
    input supply1 id_19,
    output logic id_20,
    input wire id_21,
    input wor id_22,
    input supply1 id_23,
    input wand id_24,
    output wire id_25,
    input uwire id_26,
    output tri0 id_27,
    output tri0 id_28,
    input supply1 id_29,
    output wor id_30,
    input wire id_31,
    output wand id_32,
    input wand id_33,
    output logic id_34,
    output logic id_35,
    input supply0 id_36,
    output wire id_37,
    input wor id_38,
    input wor id_39,
    output supply0 id_40
    , id_45, id_46,
    input supply0 id_41,
    output supply1 id_42
);
  always @(id_24 or posedge id_13) begin : LABEL_0
    if (1)
      case (id_19)
        id_23: id_20 = 1'b0;
        -1'h0: id_45 = -1;
        id_33, 1, id_39, id_11, id_12 / id_46, -1'd0, id_5: id_35 = -1;
        default: id_34 <= id_7;
      endcase
    else if (1'b0) id_8 <= #id_4 id_14;
  end
  module_0 modCall_1 (
      id_4,
      id_23,
      id_22,
      id_16,
      id_21,
      id_16,
      id_37,
      id_15,
      id_18
  );
endmodule
