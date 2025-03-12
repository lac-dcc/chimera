// Seed: 745478596
module module_0 (
    input tri id_0,
    input uwire id_1,
    input tri0 id_2,
    input tri id_3,
    output wire id_4,
    output tri0 id_5,
    input tri1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    output wor id_9,
    output wire id_10,
    input wand id_11,
    input tri0 id_12,
    input wand id_13,
    input tri0 id_14,
    output uwire id_15
);
  assign module_1.id_4 = 0;
  reg id_17;
  ;
  logic id_18;
  wire  id_19;
  always @(posedge -1) begin : LABEL_0
    id_17 <= id_13;
  end
endmodule
module module_1 (
    inout wor id_0,
    output tri0 id_1,
    output wand id_2,
    output wand id_3,
    output uwire id_4,
    input supply1 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_0,
      id_3,
      id_0,
      id_5,
      id_0,
      id_0,
      id_4,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
endmodule
