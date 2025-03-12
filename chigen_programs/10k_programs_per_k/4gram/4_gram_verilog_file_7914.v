// Seed: 3418148815
module module_0 (
    id_1,
    id_2,
    access,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    module_0,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  assign module_1.id_12 = 0;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout supply0 id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_8 = id_8 == -1;
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    input uwire id_2,
    input wire id_3,
    output wand id_4,
    output tri0 id_5,
    input supply1 id_6,
    output wand id_7,
    input supply1 id_8,
    input wire id_9,
    output logic id_10,
    input wire id_11,
    input wand id_12,
    inout supply0 id_13,
    input supply1 id_14,
    input supply0 id_15,
    input supply1 id_16,
    input supply1 id_17,
    output logic id_18,
    input tri id_19,
    output tri id_20,
    input uwire id_21
);
  wire id_23, id_24;
  wire id_25;
  always_comb @(posedge id_2) begin : LABEL_0
    id_10 = id_1;
    id_18 <= -1;
  end
  and primCall (
      id_5,
      id_19,
      id_16,
      id_25,
      id_11,
      id_23,
      id_14,
      id_15,
      id_6,
      id_26,
      id_1,
      id_12,
      id_2,
      id_9,
      id_0,
      id_21,
      id_3,
      id_13,
      id_17,
      id_24,
      id_8
  );
  id_26 :
  assert property (@(posedge 1) 1)
  else $clog2(32);
  ;
  assign id_24 = id_11;
  module_0 modCall_1 (
      id_23,
      id_23,
      id_26,
      id_25,
      id_23,
      id_25,
      id_25,
      id_23,
      id_26,
      id_23,
      id_25,
      id_25,
      id_26,
      id_25,
      id_23,
      id_23,
      id_25
  );
endmodule
