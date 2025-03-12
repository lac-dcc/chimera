// Seed: 69959920
module module_0 (
    input wand id_0,
    output supply0 id_1,
    output supply0 id_2
);
  assign id_2 = id_0;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input tri1 id_2,
    output logic id_3,
    input uwire id_4,
    output logic id_5,
    input wor id_6,
    input supply0 id_7,
    input wand id_8,
    input wor id_9,
    input tri id_10
);
  assign id_3 = id_1;
  parameter id_12 = 1;
  or primCall (id_3, id_6, id_10, id_12, id_7, id_1);
  timeunit 1ps;
  module_0 modCall_1 (
      id_10,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
  if (1) assign id_3 = 1;
  else always @(-1 or posedge -1) id_3 <= 1;
  always @(negedge -1'b0 + -1 | 1'b0) id_5 = 1;
endmodule
