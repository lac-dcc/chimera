// Seed: 2716857117
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_5 = 32'd84
) (
    input tri1 id_0,
    input wor id_1,
    input wor id_2,
    input supply0 id_3,
    output tri id_4,
    input tri0 _id_5,
    input supply1 id_6,
    output tri1 id_7,
    output wire id_8,
    output wor id_9,
    output logic id_10,
    output tri1 id_11
    , id_13
);
  assign id_9 = 1;
  logic id_14;
  ;
  assign id_14[id_5] = id_6;
  id_15 :
  assert property (@(negedge id_0#(.id_14(-1'b0))) id_5)
  else id_10 <= id_6;
  module_0 modCall_1 (
      id_15,
      id_13,
      id_13
  );
  wire id_16;
endmodule
