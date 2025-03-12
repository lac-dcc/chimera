// Seed: 3558937350
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri1 id_4,
    input wor id_5,
    input supply1 id_6,
    output wor id_7,
    input tri1 id_8,
    output tri0 id_9,
    output logic id_10,
    input wor id_11,
    output uwire id_12,
    input supply0 id_13,
    input uwire id_14,
    input wor id_15,
    input uwire id_16
);
  always @(posedge 1 or posedge id_3#(.id_15(1))) id_10 = id_6;
  wor id_18 = 1;
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    input supply0 id_2,
    input wire id_3,
    input wire id_4,
    input tri id_5,
    output logic id_6
    , id_11,
    output tri0 id_7,
    input wand id_8,
    input tri1 id_9
);
  logic id_12;
  always @(id_8 or posedge id_9) id_6 = id_1;
  always @(posedge id_9) begin : LABEL_0
    id_6 <= id_9;
  end
  assign id_11 = id_3;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_8,
      id_5,
      id_1,
      id_5,
      id_5,
      id_7,
      id_1,
      id_7,
      id_6,
      id_1,
      id_7,
      id_0,
      id_3,
      id_0,
      id_5
  );
  assign modCall_1.id_15 = 0;
  wire id_13;
endmodule
