// Seed: 1224084185
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    output supply0 id_3
);
  logic id_5;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input wand id_2,
    output tri0 id_3,
    input supply1 id_4
);
  assign id_3 = 1'h0;
  xor primCall (id_3, id_4, id_0, id_1, id_2);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_3
  );
endmodule
module module_2 #(
    parameter id_45 = 32'd20,
    parameter id_52 = 32'd67
) (
    input tri0 id_0,
    output uwire id_1,
    output wor id_2,
    output tri1 id_3,
    input tri id_4,
    output tri id_5,
    input wire id_6,
    output supply1 id_7,
    output supply0 id_8,
    input supply1 id_9,
    output supply1 id_10,
    input wire id_11,
    input wand id_12,
    inout tri id_13,
    input wand id_14,
    input tri1 id_15,
    output supply1 id_16,
    output tri id_17,
    output logic id_18,
    output uwire id_19,
    input supply0 id_20,
    output wire id_21,
    input wor id_22,
    output supply1 id_23,
    input tri1 id_24,
    input wor id_25,
    input wire id_26,
    input tri id_27,
    output wand id_28,
    input wire id_29,
    output supply1 id_30,
    output tri1 id_31
    , _id_52,
    input tri0 id_32,
    input supply0 id_33,
    output tri id_34,
    input supply1 id_35,
    input wire id_36,
    input supply1 id_37,
    input wor id_38,
    input wire id_39,
    input wire id_40,
    output wire id_41,
    output supply1 id_42,
    output tri0 id_43,
    input tri1 id_44,
    input tri _id_45
    , id_53,
    input wire id_46,
    output wire id_47,
    output tri1 id_48,
    input tri id_49,
    input tri0 id_50
);
  wire id_54;
  wire [-1 : (  1  )] id_55;
  wire [id_45 : id_52] id_56;
  assign id_5  = 1;
  assign id_21 = 1 - id_26;
  wire [1  -  1 'b0 : 1] id_57;
  always @(1 or id_52) if (!-1) id_18 <= #id_6 1;
  module_0 modCall_1 (
      id_40,
      id_11,
      id_44,
      id_19
  );
  assign modCall_1.id_2 = 0;
endmodule
