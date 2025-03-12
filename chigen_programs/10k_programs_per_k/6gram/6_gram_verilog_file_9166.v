// Seed: 3746179526
module module_0 (
    input uwire id_0,
    input wire id_1,
    output wand id_2,
    output supply0 id_3,
    output supply1 id_4,
    input wire id_5,
    input supply1 id_6,
    input supply0 id_7,
    input supply1 id_8,
    output tri1 id_9,
    output wand id_10,
    input tri id_11,
    input uwire id_12,
    input supply1 id_13,
    input uwire id_14,
    input wand id_15
    , id_24,
    input tri1 id_16,
    input tri1 id_17,
    output wor id_18,
    input tri1 id_19,
    input supply0 id_20,
    input wand id_21,
    output wand id_22
);
  wire id_25;
  wire id_26;
  wire id_27;
  assign id_3  = id_21;
  assign id_22 = id_6;
endmodule
module module_1 #(
    parameter id_2 = 32'd62
) (
    output uwire id_0,
    output wor id_1,
    input supply1 _id_2,
    input tri1 id_3,
    output wire id_4,
    input wor id_5,
    output tri0 id_6,
    output supply1 id_7,
    input tri id_8,
    input wor id_9,
    output logic id_10,
    input supply0 id_11,
    input supply0 id_12,
    input supply0 id_13
);
  wire [!  id_2 : 1] id_15 = !id_2;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_6,
      id_7,
      id_0,
      id_9,
      id_13,
      id_13,
      id_11,
      id_6,
      id_0,
      id_3,
      id_9,
      id_13,
      id_11,
      id_12,
      id_11,
      id_3,
      id_4,
      id_3,
      id_13,
      id_12,
      id_6
  );
  always @(id_15 or posedge id_2) begin : LABEL_0
    id_10 <= -1 * 1;
  end
endmodule
