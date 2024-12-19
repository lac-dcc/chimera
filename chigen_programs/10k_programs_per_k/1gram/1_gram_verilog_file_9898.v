// Seed: 3026132990
module module_0 (
    input wor id_0,
    input uwire id_1
    , id_15,
    output tri1 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input wire id_5,
    input wor id_6,
    input tri1 id_7,
    input supply1 id_8,
    input wor id_9,
    input wor id_10,
    input supply0 id_11,
    input tri id_12,
    output tri0 id_13
);
  tri0 id_16;
  wire id_17;
  wire id_18;
  timeprecision 1ps;
  assign id_16 = id_3 * id_12;
  task id_19;
    input id_20;
  endtask
  assign id_13 = 1;
  always_ff begin : LABEL_0
    if (id_16) $display(id_19);
  end
  wire id_21;
  assign id_19 = id_0;
  assign id_19 = (id_7) & id_10;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output tri id_6,
    output wire id_7
    , id_9
);
  assign id_0 = 1;
  assign id_0 = 1;
  wire id_10;
  wire id_11, id_12;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_4,
      id_0,
      id_4,
      id_4,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_4,
      id_6
  );
  assign modCall_1.id_8 = 0;
endmodule
