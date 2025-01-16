// Seed: 3408929047
module module_0 (
    input uwire id_0,
    input tri id_1,
    input tri1 id_2,
    input uwire id_3,
    output tri0 id_4,
    input wire id_5,
    input tri1 id_6,
    output supply1 id_7,
    input supply1 id_8,
    input wand id_9,
    input uwire id_10,
    output uwire id_11,
    input wire id_12,
    output wand id_13,
    input tri id_14,
    input uwire id_15,
    input uwire id_16,
    input supply0 id_17,
    input wire id_18,
    input wor id_19,
    input tri0 id_20,
    output wand id_21,
    input supply0 id_22,
    input uwire id_23,
    input wire id_24,
    input wire id_25,
    input supply0 id_26,
    input supply1 id_27,
    input tri0 id_28,
    input wor id_29,
    input supply0 id_30,
    output tri id_31
);
  assign id_7.id_16 = 1 ? 1 : -1;
  assign id_21 = -1;
  assign id_31 = -1;
  wire id_33;
  wire id_34;
  assign id_11.id_18 = -1;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri1 id_4
);
  id_6 :
  assert property (@(-1) id_1 & id_3) begin : LABEL_0
    id_0 = 1;
  end
  wire id_7, id_8;
  final @(*) $display(id_8);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_1,
      id_0,
      id_4,
      id_1,
      id_0,
      id_3,
      id_3,
      id_3,
      id_0,
      id_3,
      id_0,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_0,
      id_1,
      id_4,
      id_3,
      id_2,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_0
  );
  assign modCall_1.type_10 = 0;
endmodule
