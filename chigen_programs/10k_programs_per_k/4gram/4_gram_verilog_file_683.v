// Seed: 826200005
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input supply0 id_2,
    input uwire id_3,
    output wire id_4,
    output wire id_5,
    output supply0 id_6,
    input wire id_7,
    input supply0 id_8,
    input tri1 id_9,
    input uwire id_10,
    output logic id_11,
    input tri1 id_12,
    input wire id_13,
    output tri0 id_14
);
  always @(posedge 1) begin : LABEL_0
    id_11 = new[1] (1 & 1 & 1);
  end
  wand id_16 = id_1;
  wire id_17;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    output wire id_2,
    output tri1 id_3,
    input tri1 id_4,
    input wor id_5,
    input wand id_6
    , id_20,
    input tri id_7
    , id_21,
    input wire id_8,
    input wire id_9,
    input tri1 id_10,
    output uwire id_11,
    output logic id_12,
    output uwire id_13,
    input uwire id_14,
    input tri0 id_15,
    output wand id_16
    , id_22,
    input tri0 id_17,
    input logic id_18
);
  always @(posedge 1 or id_21) id_12 <= id_18;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_8,
      id_4,
      id_11,
      id_2,
      id_3,
      id_10,
      id_17,
      id_10,
      id_9,
      id_12,
      id_10,
      id_5,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule
