// Seed: 3922335031
module module_0 (
    output wand id_0,
    output supply0 id_1,
    input wand id_2,
    input wor id_3,
    input wor id_4,
    input tri id_5,
    output supply1 id_6,
    input tri1 id_7,
    output uwire id_8,
    input wand id_9,
    output tri1 id_10,
    output wor id_11,
    input uwire id_12,
    input supply1 id_13,
    input tri id_14,
    input wor id_15,
    input uwire id_16,
    output supply0 id_17,
    output supply0 id_18,
    input supply1 id_19
);
  wire id_21;
  id_22(
      .id_0((id_5)), .id_1(id_17 * 1'b0)
  );
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wire id_3
);
  always @(posedge id_2) begin : LABEL_0
    id_0 = id_2;
  end
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_3,
      id_2,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_0,
      id_0,
      id_3
  );
endmodule
