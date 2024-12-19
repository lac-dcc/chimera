// Seed: 1651054134
module module_0 (
    output tri1 id_0,
    input wor id_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    input wire id_5
    , id_24,
    input wire id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri id_9,
    input tri0 id_10,
    input wor id_11,
    output supply0 id_12,
    input tri0 id_13,
    input tri0 id_14,
    output wand id_15,
    input uwire id_16,
    output tri0 id_17,
    input tri1 id_18,
    output uwire id_19,
    input tri0 id_20,
    input tri1 id_21,
    output tri id_22
);
  assign id_12 = (1);
  wire id_25;
  assign id_19 = 1;
  wire id_26, id_27, id_28, id_29;
  wire id_30;
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  tri0  id_4,
    output logic id_5
);
  always @(id_1 or posedge 1) begin : LABEL_0
    id_5 <= #1 1'd0;
  end
  module_0 modCall_1 (
      id_0,
      id_4,
      id_2,
      id_1,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_1,
      id_0,
      id_3,
      id_3,
      id_0,
      id_4,
      id_0,
      id_2,
      id_0,
      id_3,
      id_4,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
