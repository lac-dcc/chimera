// Seed: 2032826340
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input supply1 id_2,
    output tri0 id_3,
    output tri0 id_4,
    input wand id_5,
    input wire id_6,
    input supply1 id_7
);
  localparam id_9 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output logic id_2,
    input wand id_3,
    output tri0 id_4,
    input tri1 id_5,
    input wire id_6,
    input supply0 id_7,
    output supply1 id_8,
    input tri0 id_9,
    input wand id_10,
    input wire id_11,
    output tri id_12,
    output supply0 id_13,
    output wor id_14,
    input wand id_15,
    output supply1 id_16
);
  logic id_18;
  wire  id_19;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_6,
      id_4,
      id_4,
      id_3,
      id_7,
      id_9
  );
  assign modCall_1.id_0 = 0;
  logic id_20;
  ;
  wire id_21;
  assign id_18 = 1 - 1;
  always @(*) begin : LABEL_0
    id_18 <= id_5 & -1;
    id_2  <= -1;
  end
  assign id_18 = !id_11;
endmodule
