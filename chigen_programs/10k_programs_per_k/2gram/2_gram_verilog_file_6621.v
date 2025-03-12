// Seed: 3907165620
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input supply0 id_2
    , id_19,
    output uwire id_3,
    output tri0 id_4,
    input wor id_5,
    input supply1 id_6,
    output wire id_7,
    input tri0 id_8,
    input wire id_9,
    input wire id_10,
    output wire id_11,
    input wire id_12
    , id_20,
    input tri0 id_13,
    input wor id_14,
    output tri0 id_15,
    output supply1 id_16,
    input wor id_17
);
  wire id_21;
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    output logic id_2,
    input tri0 id_3,
    input tri id_4,
    input wand id_5,
    input tri0 id_6,
    output uwire id_7,
    output wand id_8,
    input supply0 id_9,
    input tri1 id_10
);
  assign id_7 = id_3;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_1,
      id_7,
      id_7,
      id_1,
      id_10,
      id_8,
      id_3,
      id_10,
      id_10,
      id_8,
      id_6,
      id_3,
      id_4,
      id_7,
      id_7,
      id_3
  );
  assign modCall_1.id_2 = 0;
  logic [-1 : -1 'b0] id_12;
  ;
  wire id_13;
  always @(posedge -1 or negedge id_0)
    if (1) begin : LABEL_0
      id_2 <= id_5;
    end else id_12 <= 1 & id_1 & 1'h0;
endmodule
