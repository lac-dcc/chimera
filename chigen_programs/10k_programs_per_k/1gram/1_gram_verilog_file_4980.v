// Seed: 257267985
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always begin : LABEL_0
    id_4 = 1;
  end
  wire id_9;
  assign id_5 = 1;
  assign module_1.id_1 = 0;
  wire id_10;
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1,
    input tri0 id_2
);
  wire id_4, id_5;
  nand primCall (id_1, id_2, id_4);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5
  );
endmodule
