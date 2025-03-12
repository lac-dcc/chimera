// Seed: 1777662580
module module_0 (
    output supply1 id_0,
    output supply1 id_1,
    output tri0 id_2,
    output wor id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply0 id_6,
    output supply0 id_7,
    input uwire id_8,
    input wire id_9,
    output supply0 id_10
);
  assign id_3 = -1;
endmodule
module module_1 (
    output logic id_0,
    input wor id_1,
    input tri id_2,
    input tri0 id_3,
    output uwire id_4,
    input wand id_5,
    output wand id_6,
    input uwire id_7,
    input supply0 id_8
);
  final begin : LABEL_0
    id_0 <= -1;
  end
  nor primCall (id_4, id_1, id_5, id_7, id_3, id_2);
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_5,
      id_3,
      id_5,
      id_6,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
