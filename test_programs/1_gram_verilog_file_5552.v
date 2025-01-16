// Seed: 3427288364
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
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_9, id_10;
  tri1 id_11 = id_6 - 1;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output wire id_0,
    input  tri1 id_1,
    output tri1 id_2,
    output tri0 id_3
);
  wire id_5;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_8,
      id_5,
      id_7,
      id_7,
      id_7,
      id_5
  );
  assign id_6 = id_8;
  assign id_0 = 1'h0;
  assign {~1} = id_7;
endmodule
