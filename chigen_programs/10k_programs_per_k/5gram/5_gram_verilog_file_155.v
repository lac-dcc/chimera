// Seed: 2195580851
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_7;
  assign module_2.type_14 = 0;
  assign id_7 = 1;
  initial id_7 <= 1'd0;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
module module_2 (
    input tri1 id_0,
    output wire id_1,
    output tri0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input wor id_5,
    output supply0 id_6,
    input uwire id_7,
    output tri1 id_8,
    input wire id_9
);
  wire id_11;
  nor primCall (id_1, id_9, id_0, id_11, id_7, id_5, id_4);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
endmodule
