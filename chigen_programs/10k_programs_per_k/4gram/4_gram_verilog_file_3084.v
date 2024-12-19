// Seed: 1561878725
module module_0 (
    input  uwire id_0,
    input  wor   id_1,
    input  tri0  id_2,
    input  wand  id_3,
    input  tri1  id_4,
    output wire  id_5
);
  wire id_7;
  assign id_5 = id_4;
  assign module_1.id_18 = 0;
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1
    , id_17,
    input logic id_2,
    input tri1 id_3,
    input wand id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri id_7,
    input wor id_8,
    output tri0 id_9,
    input supply1 id_10,
    output wor id_11,
    output logic id_12,
    input wor id_13,
    input supply1 id_14,
    output tri1 id_15
);
  always @(posedge id_13) begin : LABEL_0
    id_12 <= id_2;
  end
  always @(posedge id_4) id_9 = 1;
  assign id_11 = 1;
  supply1 id_18 = id_4;
  assign id_9 = 1;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_18,
      id_4,
      id_13,
      id_18
  );
  wand id_19 = id_18;
  wor id_20 = id_1, id_21, id_22;
endmodule
