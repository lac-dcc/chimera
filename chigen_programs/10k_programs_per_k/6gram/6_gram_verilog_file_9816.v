// Seed: 4269000914
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    input wor id_2,
    input wand id_3,
    input tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    output wand id_7,
    output tri0 id_8,
    input tri id_9,
    inout wire id_10,
    input uwire id_11,
    input wand id_12,
    input tri0 id_13,
    input tri0 id_14,
    input tri0 id_15,
    output wor id_16,
    output wand id_17,
    output tri0 id_18,
    input tri id_19,
    input wire id_20,
    output uwire id_21,
    input wor id_22
);
  wire id_24;
  assign module_1.id_17 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input wor id_2,
    input wire id_3,
    input wor id_4,
    output supply0 id_5,
    output tri id_6,
    output logic id_7,
    input tri1 id_8,
    input tri0 id_9,
    output wor id_10,
    input supply1 id_11,
    output tri0 id_12,
    output logic id_13,
    input wire id_14,
    output wand id_15,
    output wand id_16
    , id_24,
    input supply1 id_17,
    input tri0 id_18,
    output tri0 id_19,
    input wire id_20
    , id_25,
    input uwire id_21,
    input wire id_22
);
  always @(id_24[1] or posedge id_22) #1;
  supply1 id_26;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_4,
      id_9,
      id_8,
      id_18,
      id_20,
      id_16,
      id_26,
      id_0,
      id_26,
      id_18,
      id_26,
      id_4,
      id_11,
      id_2,
      id_5,
      id_26,
      id_6,
      id_3,
      id_14,
      id_12,
      id_18
  );
  logic [7:0] id_27;
  always #1 begin : LABEL_0
    id_13 <= 1;
  end
  wire id_28;
  assign id_27 = id_24;
  wire id_29, id_30;
  always @(1 or id_8) begin : LABEL_0
    id_7 <= 1;
  end
endmodule
