// Seed: 1916639154
module module_0 (
    output uwire id_0,
    input tri id_1,
    input tri sample,
    input wor id_3,
    input wire id_4,
    input wire id_5,
    output supply0 id_6,
    input tri id_7,
    output tri1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input tri id_11,
    input wand id_12,
    input tri id_13,
    output wor id_14,
    input wire id_15,
    output tri0 id_16,
    output wor id_17,
    output supply1 id_18,
    input tri1 id_19,
    input tri0 id_20,
    output wire id_21,
    input wor id_22,
    output supply1 id_23,
    output supply0 id_24,
    input tri1 id_25,
    input tri0 id_26,
    output tri0 id_27,
    output supply0 id_28,
    input tri id_29,
    output supply0 id_30,
    output tri id_31,
    input tri1 id_32,
    input supply0 id_33,
    output supply1 id_34,
    output tri0 id_35,
    output tri0 id_36,
    input supply1 module_0,
    input uwire id_38,
    output supply1 id_39,
    input tri1 id_40,
    output tri id_41
);
  always_ff @(posedge id_37 or 1) id_31 = id_7 ? 1 != 1 : id_9;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output tri   id_2,
    input  wor   id_3
);
  wand id_5;
  assign id_0 = 1'h0;
  wire id_6 = 1 !=? id_3;
  module_0(
      id_2,
      id_5,
      id_3,
      id_1,
      id_1,
      id_3,
      id_5,
      id_5,
      id_2,
      id_1,
      id_5,
      id_1,
      id_1,
      id_3,
      id_5,
      id_5,
      id_0,
      id_5,
      id_2,
      id_3,
      id_3,
      id_5,
      id_3,
      id_5,
      id_2,
      id_5,
      id_1,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_5,
      id_1,
      id_2,
      id_0,
      id_0,
      id_3,
      id_1,
      id_5,
      id_5,
      id_0
  );
  generate
    begin
      for (id_7 = id_1 * id_7; id_6; id_5 = id_3) begin : id_8
        wor id_9;
        id_10(
            .id_0(),
            .id_1(1),
            .id_2(id_9(id_8, 1'b0)),
            .id_3(),
            .id_4(1),
            .id_5(id_1),
            .id_6(1'b0),
            .id_7(1)
        );
        wire id_11;
        supply0 id_12 = 1 == id_9;
      end
    end
  endgenerate
endmodule
