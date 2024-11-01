// Seed: 1595907795
module module_0 (
    input wire id_0,
    input wor id_1,
    output wor id_2,
    input supply0 id_3,
    input tri0 id_4,
    output wire id_5,
    input tri id_6
);
  wire id_8;
  wire id_9;
  supply0 id_10;
  assign id_10 = id_4;
  module_2(
      id_10, id_5, id_5, id_5, id_5
  );
  assign id_8 = id_8;
  xnor (id_5, id_1, id_3, id_0, id_8, id_10, id_6);
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1
);
  module_0(
      id_0, id_0, id_1, id_0, id_0, id_1, id_0
  );
  wire id_3;
  logic [7:0] id_5;
  timeunit 1ps;
  assign id_5[1] = 1;
endmodule
module module_2 (
    output tri1 id_0,
    output tri0 id_1,
    output tri  id_2,
    output wor  id_3,
    output tri  id_4
);
  always @(posedge 1) #1;
endmodule
