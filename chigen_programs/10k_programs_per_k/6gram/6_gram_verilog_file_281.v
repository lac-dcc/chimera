// Seed: 32516306
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input tri1 id_2,
    output tri id_3,
    input wand id_4,
    input uwire id_5,
    input wor id_6,
    input supply0 id_7,
    input tri id_8,
    output wire id_9
);
  wire id_11;
  wire id_12;
  assign module_1.type_3 = 0;
  always @(posedge id_6 or posedge 1) begin : LABEL_0
    fork
      id_13;
    join
  end
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output supply0 id_2
    , id_12,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input wor id_6,
    input tri1 id_7,
    output supply0 id_8,
    input tri1 id_9
    , id_13,
    input tri1 id_10
);
  wor id_14, id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_0,
      id_9,
      id_4,
      id_7,
      id_4,
      id_1,
      id_0
  );
  assign id_14 = 1;
  supply1 id_16 = (1);
endmodule
