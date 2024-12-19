// Seed: 1716945583
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input uwire id_2,
    output tri0 id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 id_6,
    output tri id_7,
    input supply1 id_8,
    output tri id_9,
    output supply1 id_10,
    input tri id_11,
    input supply0 id_12,
    output uwire id_13,
    input supply0 id_14,
    input wor id_15,
    output wand id_16,
    output supply1 id_17
    , id_21,
    input supply1 id_18,
    input tri0 id_19
);
  wire id_22;
endmodule
module module_1 (
    input logic id_0,
    input tri id_1
    , id_21,
    input wire id_2,
    input wand id_3,
    output logic id_4,
    output uwire id_5,
    input tri0 id_6,
    input wand id_7,
    input tri1 id_8,
    input logic id_9,
    input wand id_10,
    output tri0 id_11,
    output logic id_12,
    input tri0 id_13,
    input supply0 id_14,
    output tri1 id_15,
    output wor id_16,
    input uwire id_17,
    output tri0 id_18,
    output tri id_19
);
  wor id_22 = 1;
  supply1 id_23;
  always @(posedge 1'h0) begin : LABEL_0
    for (id_23 = 1; ""; id_19 = 1) #1;
    if (id_6) begin : LABEL_0
      id_12 <= id_0;
      id_12 <= "" == id_17;
    end else id_4 <= id_9;
  end
  module_0 modCall_1 (
      id_17,
      id_11,
      id_13,
      id_15,
      id_3,
      id_2,
      id_13,
      id_19,
      id_6,
      id_18,
      id_11,
      id_8,
      id_7,
      id_16,
      id_6,
      id_17,
      id_16,
      id_18,
      id_10,
      id_1
  );
  assign modCall_1.type_3 = 0;
  always force id_11 = 1 | 1;
endmodule
