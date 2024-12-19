// Seed: 2395257323
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
    id_14
);
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  uwire id_15 = 1;
  assign module_1.type_9 = 0;
  assign id_5 = 1;
  assign id_2 = 1;
endmodule
module module_1 (
    output logic id_0,
    input wire id_1,
    output tri0 id_2,
    output tri1 id_3,
    output tri0 id_4,
    output wor id_5,
    input supply0 id_6,
    input wire id_7,
    output supply0 id_8,
    input tri1 id_9,
    input wand id_10,
    output supply1 id_11,
    input tri1 id_12,
    input wor id_13,
    input supply1 id_14,
    output supply0 id_15,
    input tri0 id_16,
    input supply1 id_17,
    output logic id_18,
    output wor id_19,
    input supply0 id_20,
    input supply1 id_21,
    output tri id_22
    , id_26,
    output supply1 id_23,
    input wor id_24
);
  wire id_27;
  module_0 modCall_1 (
      id_27,
      id_27,
      id_27,
      id_27,
      id_27,
      id_27,
      id_27,
      id_27,
      id_27,
      id_27,
      id_27,
      id_27,
      id_27,
      id_27
  );
  generate
    initial begin : LABEL_0
      id_0 <= 1'b0;
    end
  endgenerate
  always @(*)
    if ((id_9)) id_18 <= id_26;
    else begin : LABEL_0
      fork
        #1;
      join
    end
endmodule
