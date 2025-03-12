// Seed: 369529195
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply0 id_6
);
  logic id_8;
  wire  id_9;
  assign id_8 = -1 | id_2;
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    input tri0 id_2,
    input uwire id_3,
    input tri0 id_4,
    input wand id_5,
    input supply1 id_6,
    input wand id_7
);
  struct packed {
    integer id_9;
    logic   id_10;
  } id_11;
  ;
  wire id_12;
  parameter id_13 = 1;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_7,
      id_4,
      id_7,
      id_7,
      id_6
  );
  assign modCall_1.id_4 = 0;
  assign id_11.id_9 = id_5;
  logic id_14;
endmodule
