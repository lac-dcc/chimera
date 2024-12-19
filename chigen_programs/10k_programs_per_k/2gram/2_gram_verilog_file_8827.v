// Seed: 2738323634
module module_0 (
    input supply1 id_0,
    input tri id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wor id_4,
    output tri1 id_5,
    input supply0 id_6
);
  assign id_5 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input logic id_1,
    output logic id_2,
    input tri1 id_3,
    output logic id_4,
    output wor id_5,
    output wand id_6,
    input logic id_7
);
  always id_4 <= id_1;
  always_comb begin : LABEL_0
    id_2 = id_7;
    if (id_0) id_4 = id_7 * id_1;
    else begin : LABEL_0
      id_4 <= id_7;
      id_4 <= id_7;
      id_4 = id_7;
    end
    id_6 = 1;
  end
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_0,
      id_3,
      id_5,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
