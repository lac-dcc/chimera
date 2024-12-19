// Seed: 3077270364
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    output wor id_2,
    input tri1 id_3,
    output wire id_4,
    input tri1 id_5,
    input supply0 id_6
    , id_9,
    input tri id_7
);
  wire id_10, id_11, id_12, id_13, id_14, id_15, id_16;
  always if (1 + 1) assign id_10 = id_7 == 1'b0;
  always @(negedge id_13) begin : LABEL_0
    id_9 <= 1'h0;
  end
endmodule
module module_1 (
    output tri id_0,
    output supply1 id_1,
    output wire id_2,
    input tri id_3,
    input tri id_4,
    input wor id_5
);
  supply0 id_7;
  assign id_7 = 1 + 1 - id_4;
  wire id_8;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_7,
      id_5,
      id_7,
      id_4,
      id_5,
      id_7
  );
  assign id_1 = id_7;
endmodule
