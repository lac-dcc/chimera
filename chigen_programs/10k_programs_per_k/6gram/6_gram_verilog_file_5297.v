// Seed: 3961709108
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    input supply0 id_3
);
  wire id_5;
  wire id_6;
  wire id_7;
  assign id_0 = 1'b0;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input wire id_2,
    output tri0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input wand id_6
);
  assign id_3 = 1 ? 1 : id_6 ? 1 : 1;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2
  );
  assign id_4 = 1'b0;
endmodule
