// Seed: 2323934980
module module_0 (
    input wand id_0,
    input tri id_1,
    output uwire id_2,
    input wire id_3
    , id_21,
    input uwire id_4,
    input uwire id_5,
    output logic id_6,
    input uwire id_7,
    output tri1 id_8,
    output wor id_9,
    output tri0 id_10,
    output uwire id_11,
    output uwire id_12,
    output wire id_13,
    input wand id_14,
    input supply1 id_15,
    input supply1 id_16,
    output wand id_17,
    output supply1 id_18,
    output supply1 id_19
);
  always @(posedge id_21 or id_3 & 1) begin : LABEL_0
    begin : LABEL_1
      id_6 <= id_14;
    end
  end
endmodule
module module_1 (
    output wor   id_0,
    output logic id_1,
    input  tri   id_2
);
  uwire id_4;
  always @(posedge id_4 or id_4) id_1 <= id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
  genvar id_5, id_6;
  logic id_7;
  assign id_4 = 1;
  assign id_1 = -1;
endmodule
