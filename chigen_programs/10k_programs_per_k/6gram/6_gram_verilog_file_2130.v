// Seed: 3684967505
module module_0 (
    input wand module_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    output logic id_4,
    input wor id_5,
    input supply1 id_6,
    input supply0 id_7,
    input supply0 id_8,
    input wire id_9
);
  assign id_4 = id_2 & id_3;
  always begin : LABEL_0
    id_4 <= 1;
  end
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    output tri id_2,
    input logic id_3,
    output supply1 id_4
);
  reg id_6;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    id_1 <= id_3;
    id_6 <= id_6;
  end
endmodule
