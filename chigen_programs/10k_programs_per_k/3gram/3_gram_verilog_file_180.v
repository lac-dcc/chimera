// Seed: 2565357442
module module_0;
  wire id_2;
endmodule
module module_1;
  wire id_1;
  wire id_3 = id_1;
  module_0 modCall_1 ();
  wire id_4;
endmodule
module module_2 (
    input supply0 id_0,
    input tri0 id_1,
    input tri id_2,
    output supply0 id_3,
    input supply1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    input tri1 id_7,
    input tri1 id_8#(.id_10((1 ^ id_4)))
);
  integer id_11;
  wire id_12;
  module_0 modCall_1 ();
endmodule
module module_3 (
    output tri1 id_0,
    input supply0 id_1,
    output tri id_2
);
  assign id_2 = 1;
  module_0 modCall_1 ();
  assign id_2 = id_1;
  assign id_0 = 1;
  logic [7:0] id_4;
  generate
    id_5(
        .id_0(id_4), .id_1(1)
    );
  endgenerate
  wire id_6;
  wire id_7;
  assign id_7 = {id_4[1], id_7};
  wire id_8;
endmodule
