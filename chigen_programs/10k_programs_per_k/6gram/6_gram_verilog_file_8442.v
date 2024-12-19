// Seed: 3991286230
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    input tri1 id_4
);
  assign id_2 = !id_0 < 1;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    output supply0 id_2,
    output logic id_3,
    input wor id_4
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_4,
      id_0
  );
  initial begin : LABEL_0
    id_3 <= 1;
  end
endmodule
module module_2 (
    input uwire id_0,
    output wor id_1,
    output supply0 id_2,
    output wor id_3,
    output logic id_4,
    input uwire id_5,
    input wire id_6
    , id_11,
    input uwire id_7,
    output tri0 id_8,
    output supply0 id_9
);
  wire id_12;
  wire id_13;
  initial forever id_4 = #1 1;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_8,
      id_5,
      id_7
  );
  assign modCall_1.type_1 = 0;
endmodule
