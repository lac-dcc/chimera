// Seed: 1883043592
module module_0 (
    input  wor   id_0,
    output logic id_1,
    output wor   id_2,
    input  uwire id_3,
    input  logic id_4
);
  initial $display(id_0);
  reg id_6;
  always if (id_3) #1 id_1 <= id_6.id_4;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    input tri0 id_2,
    input logic id_3,
    output logic id_4,
    input supply1 id_5,
    input supply0 void id_6,
    input wor id_7
);
  logic id_9 = id_3, id_10;
  assign id_1 = id_5;
  xnor (id_4, id_9, id_5, id_3, id_0, id_7, id_10, id_6, id_2);
  assign id_4 = id_9;
  module_0(
      id_6, id_10, id_1, id_6, id_9
  );
  wand id_11 = 1;
  always id_10 <= id_2 && 1;
endmodule
