// Seed: 3867512320
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_8(
      id_4 == {-1, -1, -1, -1, 1, id_6, 1, -1}
  );
  wire id_9;
  wire id_10, id_11;
  assign id_2 = {1{-1}};
  assign module_1.type_25 = 0;
endmodule
program module_1 (
    input tri0 id_0,
    input tri1 id_1,
    input wor id_2,
    input supply0 id_3,
    input wire id_4,
    input wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    output tri0 id_8,
    input wire id_9,
    input supply0 id_10,
    output logic id_11,
    output tri1 id_12,
    output wand id_13,
    input supply1 id_14,
    input tri1 id_15,
    input wor id_16,
    output tri id_17,
    input supply1 id_18
);
  wor id_20;
  id_21 :
  assert property (@(negedge 1) 1 < 1'b0 - id_7) id_11 <= ~id_4;
  module_0 modCall_1 (
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21
  );
  assign id_12 = id_20;
endmodule
