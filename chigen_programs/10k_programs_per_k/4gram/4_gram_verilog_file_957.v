// Seed: 2030319675
module module_0 (
    input wor id_0,
    input supply1 id_1,
    output tri1 id_2,
    output tri1 id_3,
    input uwire id_4,
    output uwire id_5,
    input tri1 id_6
);
  id_8(
      .id_0(1), .id_1(id_1), .id_2(id_1), .id_3(1), .id_4(1), .id_5(id_6 - 1), .id_6(1)
  );
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output uwire id_2,
    input tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    input wor id_6,
    input wor id_7,
    input wire id_8,
    input tri id_9,
    input wor id_10,
    input wor id_11,
    input tri1 id_12,
    input tri1 id_13,
    output wand id_14,
    input wand id_15,
    input supply0 id_16,
    input tri1 id_17,
    input uwire id_18,
    input wor id_19,
    output supply0 id_20,
    input supply1 id_21,
    output wire id_22,
    input supply1 id_23,
    input supply0 id_24,
    input tri1 id_25,
    input uwire id_26,
    input wire id_27,
    input wand id_28,
    input supply1 id_29,
    input wand id_30,
    input tri id_31,
    output uwire id_32,
    input supply1 id_33,
    input uwire id_34,
    input wand id_35,
    output logic id_36,
    input uwire id_37,
    output tri1 id_38,
    input wor id_39,
    input tri0 id_40,
    input supply1 id_41
    , id_46,
    output tri id_42,
    output tri id_43,
    input supply1 id_44
);
  wire id_47;
  wire id_48;
  final $display(1, id_31, 1, (id_39), 1, id_13);
  wire id_49, id_50;
  initial begin : LABEL_0
    id_36 <= 1;
  end
  assign id_32 = id_34;
  assign id_14 = 1 ? id_37 : 1;
  wire id_51;
  id_52(
      .id_0((id_29)), .id_1(1), .id_2(id_34)
  );
  module_0 modCall_1 (
      id_4,
      id_41,
      id_38,
      id_14,
      id_40,
      id_14,
      id_9
  );
  assign modCall_1.id_5 = 0;
  id_53(
      .id_0(id_21), .id_1(id_8), .id_2(1), .id_3(1), .id_4(1)
  );
  wire id_54;
  always @(id_25 or 1'b0) begin : LABEL_0
    wait (1 !== id_26);
  end
  wire id_55, id_56;
endmodule
