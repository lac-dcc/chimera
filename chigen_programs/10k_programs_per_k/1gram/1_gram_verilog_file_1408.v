// Seed: 2281813961
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wand id_3,
    input wire id_4,
    input wire id_5,
    input tri0 id_6
);
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wire id_3,
    input wand id_4,
    input tri id_5,
    input uwire id_6,
    output uwire id_7,
    input wand id_8,
    input supply1 id_9
);
  wire id_11;
  assign id_11 = id_0;
  logic id_12;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5
  );
  assign modCall_1.id_4 = 0;
  assign id_2 = !id_6;
endmodule
