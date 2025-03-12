// Seed: 1980300311
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
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
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_18;
  initial begin : LABEL_0
    $unsigned(26);
    ;
    fork
      id_19(-1, id_6, ~id_6);
      id_20;
    join
  end
  wire id_21;
  ;
endmodule
module module_1 (
    input supply0 id_0,
    output tri1 id_1,
    output wire id_2,
    output tri id_3,
    input tri id_4,
    input uwire id_5,
    output tri1 id_6,
    input wor id_7,
    input uwire id_8,
    input wand id_9,
    input wire id_10,
    input tri1 id_11,
    output wire id_12,
    input supply0 id_13,
    input wire id_14,
    input wor id_15,
    input supply0 id_16,
    output tri id_17,
    input tri id_18,
    output tri1 id_19,
    input tri1 id_20,
    output tri id_21,
    input tri0 id_22,
    output uwire id_23,
    input supply1 id_24,
    output wor id_25
);
  wire  [1 : -1] id_27;
  logic [ 1 : 1] id_28;
  assign id_1 = id_9 !== id_5;
  logic id_29;
  assign id_3 = id_16 == 1;
  module_0 modCall_1 (
      id_29,
      id_27,
      id_27,
      id_28,
      id_27,
      id_28,
      id_28,
      id_28,
      id_27,
      id_29,
      id_27,
      id_29,
      id_27,
      id_28,
      id_29,
      id_29,
      id_27
  );
endmodule
