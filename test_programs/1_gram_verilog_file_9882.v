// Seed: 1490223059
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri id_2,
    output wor id_3
);
  wire id_5;
  assign module_1.type_1 = 0;
  assign id_3 = 1;
endmodule
module module_1 (
    input uwire id_0,
    output logic id_1,
    input wire id_2,
    output wor id_3,
    input supply1 id_4,
    input wor id_5,
    input supply0 id_6,
    input tri0 id_7
);
  assign id_3 = id_7;
  nor primCall (id_1, id_5, id_2, id_7, id_6, id_4);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_3
  );
  always id_3 = 1;
  always
    if ("") begin : LABEL_0
      id_1 <= id_5 ? -1 : 1;
      id_3 = 1;
    end
  tri0 id_9 = id_6;
endmodule
