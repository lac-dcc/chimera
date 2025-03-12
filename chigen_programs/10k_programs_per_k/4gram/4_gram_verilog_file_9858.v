// Seed: 2491226802
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    input wor id_3,
    output tri0 id_4
    , id_15,
    input tri0 id_5,
    input wire id_6,
    input wor id_7,
    input tri0 id_8,
    input supply1 id_9
    , id_16,
    input tri id_10,
    input tri1 id_11,
    input uwire id_12,
    input supply1 id_13
);
  assign id_0 = id_15;
  bit id_17;
  initial begin : LABEL_0
    #1 begin : LABEL_1
      if (-1'h0) id_16 = id_16;
    end
    id_17 <= id_12;
  end
endmodule
module module_0 #(
    parameter id_34 = 32'd4,
    parameter id_45 = 32'd5,
    parameter id_7  = 32'd38
) (
    input uwire id_0,
    input wor id_1,
    input supply1 id_2,
    input wand id_3,
    output wand id_4,
    output wand id_5,
    output tri0 id_6,
    output tri _id_7,
    input tri0 id_8,
    input wor id_9,
    input tri id_10,
    input tri0 id_11,
    input wire id_12,
    input wand id_13,
    input tri id_14,
    input supply0 id_15,
    input supply0 id_16,
    output supply0 id_17,
    input supply0 id_18,
    input supply1 id_19,
    input wire id_20,
    output wire id_21,
    output wand id_22,
    input supply1 id_23,
    output supply1 id_24,
    input tri id_25,
    input supply0 id_26,
    output tri0 id_27,
    input supply0 id_28,
    input supply0 id_29,
    input wand id_30
    , id_64,
    output tri1 id_31,
    input supply1 module_1,
    input uwire id_33,
    input tri1 _id_34,
    input wire id_35,
    input wire id_36,
    input uwire id_37,
    output uwire id_38,
    input tri1 id_39,
    output supply1 id_40,
    output wire id_41,
    output supply0 id_42,
    input wor id_43,
    input tri id_44,
    input tri0 _id_45,
    input wor id_46,
    output uwire id_47,
    input tri1 id_48,
    output wire id_49,
    input supply0 id_50,
    input supply0 id_51,
    input supply1 id_52,
    output wor id_53,
    input wor id_54,
    input supply0 id_55,
    output tri0 id_56,
    output tri id_57,
    output uwire id_58,
    input wire id_59,
    input tri0 id_60,
    output wire id_61,
    output wor id_62
);
  logic [id_34 : id_7] id_65;
  module_0 modCall_1 (
      id_42,
      id_54,
      id_9,
      id_54,
      id_58,
      id_60,
      id_54,
      id_12,
      id_51,
      id_33,
      id_23,
      id_39,
      id_30,
      id_0
  );
  assign modCall_1.id_9 = 0;
  wire [id_45 : 1] id_66;
  id_67 :
  assert property (@(posedge id_20 && 1) id_9)
  else $clog2(33);
  ;
  always @(posedge !id_51) begin : LABEL_0
    assert (id_66);
  end
endmodule
