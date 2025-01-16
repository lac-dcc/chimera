// Seed: 1656972945
module module_0 (
    input wand id_0,
    output supply0 id_1,
    output supply1 id_2,
    inout wand id_3,
    output wand id_4,
    input wire id_5
);
endmodule
module module_1 (
    input supply0 id_0,
    inout tri id_1,
    input wor id_2,
    input wire id_3,
    output tri id_4
);
  wire id_6;
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_1,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.type_0 = 0;
  assign id_4 = -1;
  wire id_7;
  always @(posedge 1) id_4 = id_2 ? id_1 && id_2 : -1;
endmodule
