// Seed: 1504745007
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    input tri1 id_2,
    output wire id_3,
    output wire id_4,
    input supply1 id_5,
    output tri id_6,
    output tri id_7,
    output tri id_8,
    input wand id_9,
    output supply0 id_10,
    input wand id_11,
    input wor id_12,
    input wire id_13,
    output wire id_14,
    input tri0 id_15,
    input supply1 id_16,
    input supply0 id_17,
    input supply0 module_0
);
  wire id_20;
  ;
  logic id_21;
  ;
  wire id_22;
  wire [-1 : -1] id_23;
  logic id_24;
  wire id_25;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input uwire id_2,
    output uwire id_3,
    inout wire id_4,
    input supply1 id_5,
    input supply1 id_6,
    output tri0 id_7,
    input tri1 id_8,
    output tri0 id_9,
    output tri0 id_10
);
  id_12 :
  assert property (@(posedge id_6) -1)
  else $signed(92);
  ;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_10,
      id_9,
      id_5,
      id_4,
      id_7,
      id_10,
      id_0,
      id_9,
      id_1,
      id_5,
      id_0,
      id_10,
      id_0,
      id_5,
      id_8,
      id_8
  );
endmodule
