// Seed: 2319972643
module module_0 (
    input wand id_0
    , id_21,
    output supply1 id_1,
    input tri1 id_2,
    input supply0 id_3,
    input wire id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wor id_8,
    output supply1 id_9,
    input supply0 id_10,
    input tri0 id_11,
    input supply1 id_12,
    input tri0 id_13,
    output tri id_14,
    input tri1 id_15
    , id_22,
    output tri0 id_16,
    input tri0 id_17,
    input wor id_18,
    input supply0 id_19
);
  assign id_16 = id_18;
  wire id_23;
  wire id_24;
  assign module_1.id_1 = 0;
  reg id_25, id_26, id_27, id_28, id_29;
  wire id_30;
  always @(posedge 1) begin : LABEL_0
    if (id_19) id_27 <= 1;
    else id_27 <= 1;
  end
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  tri0  id_2,
    output wire  id_3,
    input  tri0  id_4
    , id_6
);
  assign id_0 = id_6;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_2,
      id_3,
      id_4,
      id_2,
      id_2,
      id_2,
      id_3,
      id_4,
      id_3,
      id_4,
      id_2,
      id_4
  );
  always @(1, negedge 1) if (id_6) id_6 <= id_1;
endmodule
