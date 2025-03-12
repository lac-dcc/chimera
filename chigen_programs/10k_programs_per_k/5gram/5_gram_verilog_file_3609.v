// Seed: 1532647624
module module_0 (
    output wor   id_0,
    output tri   id_1,
    output tri0  id_2,
    output uwire id_3,
    input  wand  id_4,
    input  wand  id_5,
    input  uwire id_6
);
  wire id_8;
  wire id_9;
  assign module_1.id_0 = 0;
  logic [7:0] id_10;
  initial begin : LABEL_0
    $clog2(33);
    ;
    fork
      disable id_11;
      id_12(1 & (-1 & -1) & -1 & 1, id_4, 1);
      id_13;
    join
  end
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri1 id_4,
    output logic id_5,
    input wor id_6,
    output uwire id_7,
    input wire id_8,
    output tri0 id_9,
    input wand id_10,
    input tri0 id_11,
    input uwire id_12,
    input supply1 id_13,
    output tri id_14,
    output wor id_15
);
  wire id_17;
  module_0 modCall_1 (
      id_14,
      id_14,
      id_14,
      id_7,
      id_1,
      id_4,
      id_8
  );
  logic id_18;
  always @(posedge -1 or posedge id_8 ==? 1) if (1) id_5 <= 1;
endmodule
