// Seed: 647826575
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output tri id_3,
    input supply0 id_4,
    input tri id_5,
    input wor id_6,
    input wire id_7,
    input wire id_8,
    input uwire id_9,
    input uwire id_10,
    input uwire id_11,
    input supply1 id_12,
    input tri1 id_13
);
  always $display(1);
  wire id_15;
  assign module_1.id_12 = 0;
  supply0 id_16 = 1;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input wire id_2,
    input tri id_3,
    output supply1 id_4,
    output wand id_5,
    input tri0 id_6,
    output tri1 id_7,
    input supply0 id_8,
    output tri1 id_9,
    input wire id_10,
    input supply0 id_11,
    input supply0 id_12,
    output wire id_13
);
  assign id_7 = 1'b0;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_8,
      id_8,
      id_6,
      id_8,
      id_11,
      id_2,
      id_10,
      id_3,
      id_2,
      id_3
  );
endmodule
