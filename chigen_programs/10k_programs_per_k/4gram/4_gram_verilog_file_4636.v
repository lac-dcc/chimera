// Seed: 1306690427
module module_0 (
    output uwire id_0,
    input wand id_1,
    output uwire id_2,
    input tri id_3,
    input tri1 id_4,
    input wand id_5,
    output supply1 id_6,
    input tri0 id_7,
    output wand id_8,
    input tri1 id_9,
    input tri0 id_10,
    output supply1 id_11
);
  wire id_13;
  assign id_11 = id_5;
  assign module_1.id_1 = 0;
  wire [-1 : 1] id_14;
  parameter id_15 = 1;
  logic id_16;
  ;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input supply0 id_4,
    output tri id_5
);
  generate
    logic id_7, id_8;
    if (1) begin : LABEL_0
      wire id_9;
    end
  endgenerate
  nor primCall (id_5, id_0, id_7, id_4, id_2, id_1);
  module_0 modCall_1 (
      id_5,
      id_0,
      id_5,
      id_0,
      id_0,
      id_4,
      id_5,
      id_2,
      id_3,
      id_0,
      id_0,
      id_5
  );
endmodule
