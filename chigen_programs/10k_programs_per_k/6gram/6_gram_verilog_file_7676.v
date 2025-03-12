// Seed: 3526250813
module module_0 (
    input wand id_0,
    output uwire id_1,
    input tri0 id_2,
    output wand id_3,
    output wire id_4,
    output uwire id_5,
    output wor id_6,
    output uwire id_7,
    input supply1 id_8,
    input supply0 id_9
    , id_14,
    input wand id_10,
    output wire id_11,
    output logic id_12
);
  assign id_11 = id_14;
  wire id_15;
  always @(negedge -1) id_12 = 1'b0;
  wire id_16;
  ;
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    input uwire id_2,
    output supply1 id_3,
    output wand id_4,
    output tri id_5,
    output uwire id_6,
    input supply1 id_7,
    input tri1 id_8,
    output logic id_9,
    output supply0 id_10,
    output supply1 id_11
);
  always @(posedge -1) begin : LABEL_0
    id_9 <= 1'b0;
  end
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_3,
      id_2,
      id_0,
      id_0,
      id_1,
      id_9
  );
  assign modCall_1.id_6 = 0;
endmodule
