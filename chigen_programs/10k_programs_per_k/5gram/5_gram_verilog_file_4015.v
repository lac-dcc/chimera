// Seed: 3449665420
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wand id_3,
    input tri1 id_4,
    input tri1 id_5,
    output wor id_6,
    output wor id_7,
    input tri1 id_8,
    input wand id_9,
    input uwire id_10,
    output logic id_11
);
  always @(posedge id_10) id_11 <= 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output tri1 id_2,
    output supply1 id_3,
    input uwire id_4,
    input uwire id_5,
    output logic id_6,
    output uwire id_7
);
  always begin : LABEL_0
    fork
      id_6 <= 1;
      #1;
    join_none
  end
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_0,
      id_0,
      id_4,
      id_7,
      id_2,
      id_0,
      id_0,
      id_0,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
