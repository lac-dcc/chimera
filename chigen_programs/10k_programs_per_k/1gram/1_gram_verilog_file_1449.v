// Seed: 2429766611
module module_0 (
    output wand id_0,
    output uwire id_1,
    output tri1 id_2,
    output uwire id_3,
    input tri1 id_4,
    input supply0 id_5,
    input tri id_6,
    input wor id_7,
    output supply1 id_8,
    input supply1 id_9,
    input wire id_10,
    output tri1 id_11,
    input tri0 id_12,
    output wand id_13[-1 : 1 'b0],
    input supply0 id_14,
    output tri id_15
);
  `define pp_17 0
  assign module_1.id_8 = 0;
  assign id_1 = id_5;
  localparam id_18 = 1'b0;
  wire id_19, id_20, id_21;
  assign id_3 = id_18;
  assign id_3 = `pp_17;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input tri id_2,
    input tri1 id_3,
    output supply1 id_4
);
  parameter id_6 = (1);
  assign id_4 = id_1;
  assign id_4 = id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_0,
      id_3,
      id_3,
      id_3,
      id_4,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_3,
      id_4
  );
  logic id_7 = id_3;
  logic id_8 = id_0 < 1 == -1;
endmodule
