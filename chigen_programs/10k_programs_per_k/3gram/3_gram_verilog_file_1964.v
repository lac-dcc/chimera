// Seed: 1718801359
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    output wire id_2,
    output wire id_3,
    input tri0 id_4,
    output tri id_5,
    input supply1 id_6,
    input uwire id_7,
    input wor id_8,
    input tri1 id_9,
    output tri1 id_10,
    input tri id_11
);
  wire id_13;
endmodule
module module_1 (
    output logic id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    output wire  id_3,
    input  wor   id_4,
    input  tri0  id_5
);
  assign id_3 = id_4;
  reg id_7;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3,
      id_3,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_2
  );
  assign modCall_1.id_6 = 0;
  initial begin : LABEL_0
    if (1) id_0 <= 1;
    id_7 <= id_5;
  end
endmodule
