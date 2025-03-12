// Seed: 3123883835
module module_0 (
    input wand id_0,
    input uwire id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input wand id_5,
    input supply0 id_6,
    input supply1 id_7
);
  wire id_9;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    output supply1 id_2,
    output supply0 id_3,
    output supply0 id_4,
    output uwire id_5,
    input tri id_6,
    input tri0 id_7,
    input supply1 id_8
    , id_16,
    input supply1 id_9,
    input uwire id_10,
    input wire id_11,
    output supply0 id_12,
    output logic id_13,
    output wire id_14
);
  wire id_17;
  assign id_14 = (1'b0 == -1);
  always @(posedge 1 or posedge (id_6)) begin : LABEL_0
    id_13 <= (id_0);
  end
  module_0 modCall_1 (
      id_6,
      id_11,
      id_6,
      id_5,
      id_11,
      id_9,
      id_8,
      id_11
  );
  assign modCall_1.id_1 = 0;
endmodule
