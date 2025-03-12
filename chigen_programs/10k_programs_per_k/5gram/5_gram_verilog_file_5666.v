// Seed: 1884414730
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output wand id_2,
    input tri1 id_3,
    input tri1 id_4,
    input tri1 id_5,
    input wire id_6,
    input tri0 id_7,
    input wand id_8,
    input tri1 id_9,
    input wand id_10,
    input tri1 id_11,
    input supply1 id_12,
    input wor id_13,
    input uwire id_14,
    output wire id_15,
    output tri id_16,
    output wire id_17,
    input wire id_18,
    input tri id_19,
    input tri id_20,
    output uwire id_21,
    input wire id_22,
    input tri1 id_23
);
  assign id_17 = -1;
  logic id_25;
  ;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    output logic id_2,
    input wire id_3,
    input wire id_4,
    output logic id_5,
    input wor id_6,
    output supply1 id_7,
    input supply0 id_8
    , id_18,
    input supply1 id_9,
    output tri0 id_10,
    input tri0 id_11,
    output logic id_12,
    output tri1 id_13,
    input tri0 id_14,
    input tri id_15,
    output wand id_16
);
  always @(posedge id_16++
  && id_9)
  begin : LABEL_0
    id_12 = id_4;
    id_5  = #id_19 1;
    id_12 <= id_15;
    id_0 = id_3;
    id_2 <= id_3;
  end
  module_0 modCall_1 (
      id_4,
      id_11,
      id_10,
      id_4,
      id_8,
      id_3,
      id_4,
      id_14,
      id_11,
      id_1,
      id_11,
      id_15,
      id_15,
      id_1,
      id_4,
      id_13,
      id_16,
      id_10,
      id_8,
      id_4,
      id_6,
      id_10,
      id_11,
      id_4
  );
  assign modCall_1.id_6 = 0;
  assign id_0 = id_11;
endmodule
