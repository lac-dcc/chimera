// Seed: 2040641697
module module_0 (
    input tri id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri0 id_3,
    input tri id_4,
    output logic id_5,
    output wand id_6,
    input tri0 id_7,
    input uwire id_8,
    input tri1 id_9,
    input wand id_10
);
  assign id_5 = 1 - id_2;
  wire id_12 = id_1;
  always begin : LABEL_0
    assign id_5 = 1'b0;
    `define pp_13 0
    id_5 <= 1;
  end
endmodule
module module_1 (
    output tri0 id_0,
    input wor id_1,
    output logic id_2,
    input wor id_3,
    input supply1 id_4,
    input wand id_5,
    input uwire id_6,
    input tri1 id_7,
    input tri id_8,
    output tri0 id_9,
    input supply1 id_10,
    input wand id_11,
    output tri0 id_12,
    input tri0 id_13,
    output uwire id_14,
    input tri1 id_15
    , id_17
);
  assign id_9  = -1;
  assign id_2  = id_1;
  assign id_14 = id_5 - -1;
  for (id_18 = 1; -1; id_2 = 1'b0) begin : LABEL_0
    wire ['b0 : -1 'd0] id_19;
  end
  wor [-1 'b0 : -1] id_20;
  localparam id_21 = -1;
  module_0 modCall_1 (
      id_15,
      id_1,
      id_6,
      id_4,
      id_6,
      id_2,
      id_12,
      id_11,
      id_15,
      id_15,
      id_6
  );
  assign modCall_1.id_4 = 0;
  assign id_0 = id_4;
  assign id_20 = 1;
endmodule
