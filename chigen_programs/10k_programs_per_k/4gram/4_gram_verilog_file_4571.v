// Seed: 2611475843
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input wor id_2,
    input wor id_3,
    input wand id_4,
    input wand id_5,
    input supply0 id_6
);
  logic id_8;
  wire  id_9;
  ;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    output tri0 id_2
);
  uwire id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
  assign id_2 = id_4;
  logic [7:0] id_5, id_6;
  wire id_7;
  ;
  struct packed {
    logic [-1 : 1] id_8;
    logic id_9;
  } id_10;
  assign id_5[1] = {id_7{id_4}};
  logic id_11, id_12, id_13;
  parameter id_14 = 1;
  assign id_4 = 'b0;
endmodule
