// Seed: 2988286233
module module_0 (
    output wor id_0,
    input wor id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wand id_4,
    input wand id_5,
    input tri0 id_6
);
  wire id_8, id_9;
  assign module_1.id_13 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input logic id_1,
    input tri1 id_2,
    input supply1 id_3,
    id_21,
    input supply1 id_4,
    input uwire id_5,
    input wand id_6,
    id_22,
    output tri0 id_7,
    input tri1 id_8,
    input wor id_9,
    input logic id_10,
    input tri id_11,
    output tri1 id_12,
    output tri0 id_13,
    input uwire id_14,
    input wand id_15,
    input tri id_16,
    id_23,
    output wor id_17,
    input wand id_18,
    input tri0 id_19
);
  always id_12 = 1;
  module_0 modCall_1 (
      id_17,
      id_11,
      id_19,
      id_12,
      id_11,
      id_0,
      id_14
  );
  always begin : LABEL_0
    id_13 = 'b0;
    @(id_18 or posedge -1'b0) $display(1);
    id_22 = id_10;
    id_21 <= id_1;
  end
  wire id_24;
endmodule
