// Seed: 155761729
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri id_3,
    input wire id_4,
    output tri1 id_5,
    input uwire id_6,
    input wand id_7,
    output tri0 id_8,
    output wand id_9,
    input tri1 id_10,
    output wand id_11,
    input tri0 id_12
);
  wand id_14 = -1;
  parameter id_15 = -1;
  struct packed {logic id_16;} id_17;
  ;
  assign id_17.id_16   = id_12;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    output tri1 id_2,
    input wand id_3,
    input uwire id_4
);
  always begin : LABEL_0
    #id_6;
  end
  assign id_1 = id_4;
  wire id_7;
  logic [7:0][1] id_8;
  wire id_9;
  wire id_10;
  ;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_0,
      id_4,
      id_2,
      id_4,
      id_0,
      id_2,
      id_1,
      id_3,
      id_2,
      id_4
  );
endmodule
