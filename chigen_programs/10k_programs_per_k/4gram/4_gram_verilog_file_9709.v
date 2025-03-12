// Seed: 489373290
module module_0 (
    output uwire id_0,
    input wor id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wor id_4
    , id_25,
    output supply0 id_5,
    input wand id_6,
    input tri0 id_7,
    input wor id_8,
    input uwire id_9,
    input uwire id_10,
    output wire id_11,
    input uwire id_12,
    input tri0 id_13,
    output tri1 id_14,
    input tri0 id_15,
    output uwire id_16,
    output wire id_17,
    input wor module_0,
    input tri0 id_19,
    input uwire id_20,
    output tri id_21,
    input tri0 id_22,
    input wand id_23
);
  assign id_21 = id_19;
  localparam id_26 = 1;
endmodule
module module_1 (
    output wor id_0,
    inout logic id_1,
    input supply0 id_2
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_10 = 0;
  logic [-1 : 1 'h0] id_4 = id_4;
  always @(posedge id_1) begin : LABEL_0
    id_4 = id_4 - id_4;
    if (1)
      if (-1) begin : LABEL_1
        id_1 <= id_1 / id_4;
        disable id_5;
      end
  end
  always @(posedge 1 or posedge id_1) begin : LABEL_2
    return id_4;
  end
endmodule
