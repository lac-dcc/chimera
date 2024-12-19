// Seed: 2943622582
module module_0 (
    output wire id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri1 id_6,
    input wand id_7,
    output tri1 id_8,
    output supply0 id_9,
    output tri id_10,
    output tri id_11,
    input tri0 id_12,
    output tri1 id_13,
    input wand id_14,
    input supply0 id_15,
    output supply1 id_16,
    input supply0 id_17,
    output uwire id_18,
    output tri0 id_19,
    output tri0 id_20,
    output tri0 id_21,
    output uwire id_22
);
  wire id_24;
  assign module_1.type_7 = 0;
  wire id_25;
endmodule
module module_1 (
    input  tri   id_0,
    input  wire  id_1,
    output uwire id_2
);
  tri0 id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  wire id_5;
  wire id_6;
  always @(1'b0 or negedge id_4) begin : LABEL_0
    id_6 = id_5;
  end
  initial begin : LABEL_0
    assert (1'b0);
  end
endmodule
