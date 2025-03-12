// Seed: 2927004380
module module_0 #(
    parameter id_4 = 32'd65
);
  logic id_1;
  logic [7:0] id_2;
  wire id_3;
  wire _id_4;
  assign id_2[id_4] = 1'b0;
endmodule
module module_1 #(
    parameter id_3 = 32'd93,
    parameter id_5 = 32'd56
) (
    output logic id_0,
    input  wire  id_1,
    input  wor   id_2,
    inout  wand  _id_3
);
  wire _id_5;
  bit [id_5 : id_3  -  1]
      id_6,
      id_7,
      id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
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
      id_35,
      id_36,
      id_37,
      id_38,
      id_39,
      id_40,
      id_41,
      id_42,
      id_43,
      id_44,
      id_45,
      id_46,
      id_47,
      id_48,
      id_49,
      id_50,
      id_51,
      id_52,
      id_53,
      id_54,
      id_55,
      id_56,
      id_57,
      id_58,
      id_59,
      id_60,
      id_61,
      id_62,
      id_63,
      id_64,
      id_65,
      id_66,
      id_67,
      id_68,
      id_69,
      id_70,
      id_71,
      id_72,
      id_73,
      id_74;
  logic id_75 = id_71 == 1;
  always_ff @(negedge -1'b0 == id_66) begin : LABEL_0
    id_47 <= -1;
  end
  wire id_76;
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
  wire id_77;
  initial begin : LABEL_1
    @(id_51) id_72 <= id_71 == 1;
  end
  wire id_78;
  always @(*) begin : LABEL_2
    id_71 = 1'd0 - id_42;
    id_39 = id_24;
    id_36 <= -1'b0;
    id_0  <= id_31;
    if (1) begin : LABEL_3
      id_17 <= -1;
    end else begin : LABEL_4
      fork
        id_79(id_10);
      join
    end
  end
endmodule
