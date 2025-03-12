// Seed: 1896030803
module module_0 (
    output supply1 id_0,
    output wor id_1,
    output tri1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wor id_5,
    output wire id_6
);
  uwire id_8;
  logic id_9, id_10, id_11;
  logic id_12;
  localparam id_13 = 1;
  assign id_12 = 1'b0;
  assign #1 id_10 = id_11;
  assign module_1.id_0 = 0;
  assign id_8 = -1'b0;
  localparam id_14 = 1;
  wire id_15;
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wor id_4,
    input wire id_5,
    output wand id_6
);
  always_latch begin : LABEL_0
    id_1 <= -1;
  end
  xnor primCall (id_1, id_5, id_4, id_2, id_3);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_6,
      id_2,
      id_5,
      id_3,
      id_6
  );
endmodule
