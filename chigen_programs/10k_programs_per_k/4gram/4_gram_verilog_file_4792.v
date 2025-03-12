// Seed: 1157571344
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_16 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_2,
      id_2
  );
  input wire id_3;
  inout wire id_2;
  inout reg id_1;
  always @(posedge (-1)) id_1 = id_2;
  assign id_1 = -1'b0;
  bit
      id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      _id_16,
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
      id_34[-1 'b0 : 1],
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
      id_54;
  integer id_55;
  parameter id_56 = 1;
  logic id_57;
  generate
    if (1) begin : LABEL_0
      logic [id_16 : -1] id_58;
      ;
      assign id_38 = id_35;
    end else begin : LABEL_1
      always_latch @(posedge id_18 or 1 & id_8) begin : LABEL_2
        id_8 = id_45;
      end
    end
  endgenerate
endmodule
