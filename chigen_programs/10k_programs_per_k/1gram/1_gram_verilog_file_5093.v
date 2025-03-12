// Seed: 2991964274
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign module_1.id_11 = 0;
  assign id_5 = 1'h0;
  assign id_2 = id_1;
  wire [-1 'b0 : -1] id_7, id_8;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    output supply1 id_2,
    output tri id_3[-1 : -1],
    output logic id_4,
    input wand id_5,
    output supply1 id_6
    , id_13,
    output supply0 id_7,
    input tri1 id_8,
    output wire id_9,
    input wire id_10,
    input tri0 id_11
);
  logic id_14, id_15 = id_8;
  module_0 modCall_1 (
      id_14,
      id_15,
      id_15,
      id_14,
      id_14,
      id_14
  );
  wire id_16;
  ;
  assign id_2 = 1;
  assign id_7 = id_10 + -1;
  assign id_0 = 1;
  always begin : LABEL_0
    id_13 <= id_16;
    if (1) id_4 <= -1;
  end
  for (id_17 = id_15; (id_11); id_0 = id_17)
  id_18 :
  assert property (@(1 or posedge 1) id_16) id_0 <= id_17;
  assign id_3 = -1;
  assign id_6 = -1;
endmodule
