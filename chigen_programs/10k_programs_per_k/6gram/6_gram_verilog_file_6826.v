// Seed: 141223669
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output wor id_4,
    output tri1 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input uwire id_8,
    output wire id_9,
    input wand id_10,
    input supply1 id_11,
    output wand id_12,
    output tri id_13,
    input uwire id_14,
    output wire id_15,
    output supply1 id_16,
    input wand id_17,
    input wand id_18,
    input wor id_19,
    input tri0 id_20,
    input uwire id_21,
    input wor id_22,
    output uwire id_23,
    input wor id_24,
    input supply1 id_25,
    input wor id_26,
    input wor id_27,
    input wire id_28,
    input tri id_29,
    output wor id_30
);
  logic [-1 : 1] id_32;
  ;
  assign id_2  = -1;
  assign id_16 = id_14;
  always @(posedge id_17) begin : LABEL_0
    $clog2(94);
    ;
    assume (id_19);
  end
  logic [1 : 1] id_33;
  ;
  assign id_16 = id_33 - id_19;
  logic id_34;
  ;
  wire id_35;
  ;
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    output tri0  id_2,
    input  tri   id_3,
    input  wire  id_4,
    input  tri   id_5,
    output tri0  id_6
);
  logic id_8;
  ;
  wire id_9;
  ;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_6,
      id_6,
      id_5,
      id_1,
      id_3,
      id_2,
      id_4,
      id_5,
      id_0,
      id_6,
      id_3,
      id_0,
      id_2,
      id_4,
      id_1,
      id_5,
      id_4,
      id_4,
      id_3,
      id_2,
      id_4,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_2
  );
  wire id_10;
endmodule
