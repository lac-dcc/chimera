// Seed: 1635093867
module module_0 (
    input wire id_0,
    input tri id_1,
    output supply1 id_2,
    input supply0 id_3,
    output supply1 id_4
);
  supply1 id_6 = -1 & -1;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_1 = 32'd52
) (
    input uwire id_0,
    output supply1 _id_1,
    input tri id_2,
    input uwire id_3,
    input wire id_4#(.id_21(1)),
    output logic id_5,
    input wand id_6,
    input wand id_7,
    output tri id_8,
    input wor id_9,
    input wand id_10,
    output tri id_11,
    input supply1 id_12,
    input wor id_13,
    input tri id_14,
    input uwire id_15[id_1 : -1],
    input tri0 id_16,
    input supply1 id_17,
    input wire id_18,
    input wire id_19
);
  union packed {logic id_22;} id_23;
  ;
  wire id_24;
  wire id_25;
  module_0 modCall_1 (
      id_7,
      id_19,
      id_8,
      id_14,
      id_11
  );
  assign modCall_1.id_4 = 0;
  wor [(  ~  1  ) : !  -1] id_26, id_27, id_28;
  assign id_1  = id_14;
  assign id_27 = id_9;
  always id_5 = id_26;
  always_ff begin : LABEL_0
    id_23.id_22 <= 1;
  end
  assign id_27 = id_24 !== (~^ -1);
endmodule
