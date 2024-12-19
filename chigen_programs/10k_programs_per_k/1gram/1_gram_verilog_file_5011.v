// Seed: 1131310322
module module_0 (
    input wor id_0,
    output tri id_1,
    input supply1 id_2,
    input wand id_3,
    input supply1 id_4,
    input wand id_5,
    input wire id_6,
    input wand id_7,
    input tri id_8,
    input supply0 id_9,
    input supply1 id_10,
    input wand id_11,
    input supply1 id_12,
    output supply0 id_13,
    input wor id_14,
    input wire id_15,
    output wand id_16,
    input tri id_17,
    input tri1 id_18,
    input tri id_19
);
  wire id_21;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input  tri0 id_1,
    output tri1 id_2
);
  id_4(
      1, 1, 1
  );
  wire id_5 = (id_1);
  always_ff deassign id_2;
  wire id_6, id_7, id_8;
  assign id_5 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_0,
      id_1,
      id_5,
      id_0,
      id_1,
      id_1,
      id_5
  );
  wand id_9;
  wire id_10;
  always $display(id_9, {{id_1, 1'b0, id_5} ==? 1 - 1{1'b0}});
endmodule
