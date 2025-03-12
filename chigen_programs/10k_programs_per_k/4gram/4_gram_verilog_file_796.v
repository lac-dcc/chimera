// Seed: 2070540522
module module_0 (
    output supply0 id_0,
    output wand id_1,
    input wand id_2,
    output supply1 id_3
);
  assign id_1 = -1 ? id_2 : ~-1;
  assign id_3 = 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd36
) (
    output uwire id_0,
    input supply0 id_1,
    output tri id_2,
    output uwire id_3,
    input uwire id_4,
    input tri id_5,
    input wor id_6,
    input wor _id_7,
    output uwire id_8,
    input uwire id_9,
    output logic id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_8
  );
  always @(1, posedge -1) id_10 = (id_12 - id_5);
  integer id_13[1 : id_7];
  ;
  wire id_14;
  assign id_2 = -1;
endmodule
