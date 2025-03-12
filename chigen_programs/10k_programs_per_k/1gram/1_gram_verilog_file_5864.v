// Seed: 2108076344
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    output tri id_2,
    input tri1 id_3,
    input tri1 id_4,
    input uwire id_5,
    output wire id_6,
    input supply1 id_7,
    output supply1 id_8,
    output wor id_9,
    input uwire id_10,
    input tri id_11,
    input wire id_12,
    input tri1 id_13,
    input wor id_14,
    input wand id_15,
    output wand id_16,
    output wand id_17,
    input uwire id_18
);
  wire id_20;
  assign module_1.id_17 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd7,
    parameter id_5 = 32'd59
) (
    output logic id_0,
    output tri0 id_1,
    input supply0 _id_2,
    input tri0 id_3,
    output wand id_4,
    output supply1 _id_5,
    input wor id_6
    , id_19,
    output tri1 id_7,
    output tri0 id_8,
    input tri1 id_9[id_2 : id_5],
    input supply1 id_10,
    output tri0 id_11,
    output wand id_12,
    input wire id_13#(
        .id_20(-1 + -1),
        .id_21(1)
    ),
    output tri1 id_14,
    output wor id_15,
    input wand id_16,
    output tri1 id_17
);
  wire [!  -1 : -1] id_22;
  always @(posedge id_20) id_0 = -1 | id_6 | id_2 || id_22;
  wire id_23;
  module_0 modCall_1 (
      id_16,
      id_15,
      id_7,
      id_9,
      id_9,
      id_9,
      id_14,
      id_10,
      id_14,
      id_15,
      id_16,
      id_10,
      id_9,
      id_3,
      id_10,
      id_9,
      id_11,
      id_7,
      id_3
  );
endmodule
