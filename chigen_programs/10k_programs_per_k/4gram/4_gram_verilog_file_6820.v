// Seed: 1168598245
module module_0 (
    input tri id_0,
    output tri0 id_1,
    input supply0 id_2,
    output tri1 id_3,
    input tri1 id_4,
    output tri1 id_5
    , id_13,
    output wire id_6,
    input uwire id_7,
    input wand id_8,
    output logic id_9
    , id_14,
    input uwire id_10,
    output tri1 id_11
);
  always begin : LABEL_0
    id_9 <= id_10;
    id_9 = id_7;
  end
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_18 = 32'd36
) (
    input wand id_0,
    output uwire id_1,
    input uwire id_2,
    output wand id_3,
    input supply1 id_4,
    output supply1 id_5,
    output tri id_6,
    input tri id_7,
    input uwire id_8,
    input uwire id_9,
    input tri1 id_10,
    input wor id_11,
    output tri0 id_12,
    output uwire id_13
    , id_24,
    output wire id_14,
    output uwire id_15,
    output uwire id_16,
    input tri0 id_17
    , id_25,
    input wire _id_18,
    input tri1 id_19,
    output logic id_20,
    input uwire id_21,
    input tri1 id_22
);
  always @(*) begin : LABEL_0
    id_20 <= id_22 - id_0;
  end
  wire [id_18 : -1] id_26;
  module_0 modCall_1 (
      id_21,
      id_1,
      id_19,
      id_15,
      id_10,
      id_12,
      id_3,
      id_17,
      id_4,
      id_20,
      id_4,
      id_5
  );
endmodule
