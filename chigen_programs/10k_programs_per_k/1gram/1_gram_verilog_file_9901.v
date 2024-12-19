// Seed: 2186854636
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  pullup (1, id_2);
  assign id_2 = 1'h0;
  reg id_3, id_4, id_5;
  wire id_6;
  assign id_5 = 1'b0;
  wire id_7, id_8, id_9;
  final begin : LABEL_0
    id_4 <= 1;
  end
endmodule
module module_1 (
    input tri0 id_0
    , id_38,
    input supply1 id_1,
    input tri0 id_2,
    output tri0 id_3,
    input tri0 id_4,
    output tri1 id_5,
    input wand id_6,
    input wand id_7,
    output tri0 id_8,
    input wire id_9,
    output supply0 id_10,
    input uwire id_11,
    input uwire id_12,
    input wire id_13,
    input wand id_14,
    input tri0 id_15,
    input uwire id_16,
    output tri1 id_17,
    input wire id_18,
    output tri id_19,
    input tri1 id_20,
    input tri id_21,
    output supply1 id_22,
    output tri id_23,
    input uwire id_24,
    output uwire id_25,
    output wor id_26,
    input uwire id_27,
    output wor id_28,
    output tri id_29,
    output tri id_30,
    input supply0 id_31,
    input uwire id_32,
    input wand id_33,
    input supply0 id_34,
    output supply0 id_35,
    output supply1 id_36
);
  supply0 id_39 = 1'h0;
  id_40(
      .id_0(id_6), .id_1(id_11), .id_2(), .id_3(1), .id_4(id_22)
  ); id_41 :
  assert property (@(posedge 1'b0) 1) begin : LABEL_0
    id_22 = id_9;
  end
  assign id_35 = 1 * id_31;
  wire id_42;
  xor primCall (
      id_23,
      id_7,
      id_34,
      id_18,
      id_39,
      id_38,
      id_6,
      id_9,
      id_1,
      id_14,
      id_16,
      id_31,
      id_11,
      id_40,
      id_42,
      id_15,
      id_24,
      id_20,
      id_12,
      id_21,
      id_4,
      id_33,
      id_0,
      id_2,
      id_32,
      id_41,
      id_13,
      id_27
  );
  module_0 modCall_1 (
      id_41,
      id_39
  );
  assign modCall_1.id_3 = 0;
  wire id_43;
endmodule
