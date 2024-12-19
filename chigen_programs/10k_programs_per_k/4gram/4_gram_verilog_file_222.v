// Seed: 1595636393
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2
  );
endmodule
module module_2 (
    input supply0 id_0,
    input wor id_1,
    output wire id_2,
    input supply0 id_3
);
  initial begin : LABEL_0
    id_2 = id_0;
  end
  assign module_3.type_1 = 0;
endmodule
module module_3 (
    output supply0 id_0,
    input tri0 id_1,
    output wand id_2
);
  always @(id_1) id_0 = 1;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1
  );
endmodule
