// Seed: 203241612
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input uwire id_2,
    input wire id_3,
    input wire id_4,
    input supply1 id_5,
    output supply0 id_6,
    input tri0 id_7,
    input wor id_8,
    input wire id_9,
    input supply0 id_10,
    output tri1 id_11,
    input uwire id_12,
    output tri1 id_13,
    input wire id_14,
    input tri0 id_15,
    input uwire id_16,
    output tri0 id_17,
    output wor id_18,
    input supply0 id_19
);
  wire id_21;
  tri  id_22 = 1;
  assign id_18 = id_3;
  assign id_6  = 1;
  assign id_18 = id_4;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input wor id_3
);
  wor id_5, id_6, id_7, id_8 = 1'b0 ? 1 : id_5, id_9, id_10, id_11;
  assign id_9 = id_11;
  wire id_12;
  task id_13(input id_14);
    id_15(1);
  endtask
  logic [7:0][1] id_16, id_17;
  always $display;
  assign id_16 = 1;
  assign id_13 = id_17;
  assign id_10 = id_11;
  wire id_18;
  nand (id_2, id_16, id_7, id_5, id_1, id_18, id_13, id_0, id_8, id_14, id_11, id_10);
  module_0(
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_3,
      id_1,
      id_1,
      id_2,
      id_2,
      id_3
  );
endmodule
