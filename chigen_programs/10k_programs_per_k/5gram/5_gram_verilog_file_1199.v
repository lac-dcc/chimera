// Seed: 2595750146
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input wand id_2,
    input tri0 id_3,
    output tri1 id_4,
    input wor id_5,
    input tri id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input uwire id_10,
    input supply1 id_11,
    input wand id_12,
    input tri id_13,
    input wor id_14
);
  wire id_16;
  wire id_17;
  assign id_0 = id_5;
  assign module_1.type_14 = 0;
endmodule
module module_1 (
    input wire id_0
    , id_11,
    output tri1 id_1,
    input tri1 id_2,
    output tri0 id_3,
    output logic id_4,
    output supply0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    output logic id_8,
    output wand id_9
);
  always @(posedge id_2)
    if (id_6 >> id_7) id_4 <= id_11 ~^ 1;
    else begin : LABEL_0
      id_8 <= 1;
    end
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7,
      id_7,
      id_9,
      id_2,
      id_6,
      id_6,
      id_0,
      id_6,
      id_2,
      id_2,
      id_6,
      id_0,
      id_7
  );
endmodule
