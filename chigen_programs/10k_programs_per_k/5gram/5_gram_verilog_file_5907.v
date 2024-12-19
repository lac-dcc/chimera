// Seed: 3044190154
module module_0 (
    input wor id_0,
    output wor id_1,
    output supply0 id_2,
    input supply1 id_3,
    input tri1 id_4,
    output uwire id_5,
    input wor id_6
    , id_30,
    input wor id_7,
    output tri id_8,
    input tri0 id_9,
    input tri0 id_10,
    input tri0 id_11,
    input wire id_12,
    input supply1 id_13,
    output supply1 id_14,
    output supply0 id_15,
    input supply0 id_16,
    input wor id_17,
    output tri1 id_18,
    output tri1 id_19,
    input supply1 id_20,
    output wire id_21,
    output wire id_22,
    input tri1 id_23,
    input wire id_24,
    input uwire id_25,
    input tri0 id_26,
    input supply1 id_27,
    output wor id_28
);
  assign id_14 = id_17;
endmodule
module module_2 (
    input  tri   id_0,
    output uwire id_1,
    output wire  id_2,
    output logic id_3,
    input  wand  id_4,
    input  wand  id_5,
    input  uwire id_6,
    output logic id_7,
    input  logic module_1,
    output uwire id_9
);
  logic id_11;
  wire  id_12;
  always @(1'b0 & id_0 & id_8) begin : LABEL_0
    id_11 <= 1 & 1 && 1 ? id_11 : id_8;
    begin : LABEL_0
      id_7 <= 1'd0;
    end
  end
  wire id_13;
  wire id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25;
  assign id_3 = id_11;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_1,
      id_4,
      id_5,
      id_9,
      id_0,
      id_4,
      id_1,
      id_5,
      id_5,
      id_0,
      id_5,
      id_6,
      id_1,
      id_9,
      id_6,
      id_6,
      id_2,
      id_1,
      id_6,
      id_9,
      id_9,
      id_0,
      id_6,
      id_6,
      id_5,
      id_5,
      id_2
  );
endmodule
