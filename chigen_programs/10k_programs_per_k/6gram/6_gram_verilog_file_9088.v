// Seed: 3971244070
module module_0 (
    output tri0 id_0,
    input wire id_1,
    output wor id_2,
    output wire id_3,
    output tri0 id_4,
    input tri1 id_5,
    input wor id_6,
    input tri0 id_7,
    output wire id_8,
    input tri1 id_9,
    input supply0 id_10,
    input wand id_11,
    input wand id_12,
    output supply1 id_13,
    output tri0 id_14,
    input uwire id_15
);
  wire id_17;
  wire id_18;
  assign id_0 = 1'b0;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    output uwire id_5,
    input tri id_6,
    output supply1 id_7
);
  logic [-1 : -1] id_9;
  ;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_5,
      id_2,
      id_5,
      id_3,
      id_6,
      id_1,
      id_7,
      id_0,
      id_4,
      id_0,
      id_0,
      id_7,
      id_7,
      id_0
  );
  always @(posedge (1)) begin : LABEL_0
    $clog2(22);
    ;
  end
endmodule
