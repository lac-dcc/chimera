// Seed: 4085469639
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    input wire id_2,
    input tri id_3,
    input tri id_4,
    output wire id_5,
    input uwire id_6,
    input wor id_7,
    input wand id_8,
    input tri id_9,
    input tri0 id_10,
    output tri id_11,
    input uwire id_12,
    output tri1 id_13,
    output supply1 id_14,
    input tri0 id_15,
    input wor id_16,
    input wire id_17,
    output wire id_18,
    input wor id_19,
    input tri id_20,
    output uwire id_21,
    output tri0 id_22,
    input wor id_23,
    input tri1 id_24
);
  assign id_22 = ~id_19;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    output logic id_3,
    inout logic id_4
    , id_11,
    output supply1 id_5,
    output wand id_6,
    input wor id_7,
    output tri0 id_8,
    input wire id_9
);
  always_ff begin : LABEL_0
    #1;
    assign id_6 = id_4;
    id_3 <= 1'b0;
  end
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1,
      id_9,
      id_7,
      id_6,
      id_2,
      id_9,
      id_9,
      id_2,
      id_1,
      id_8,
      id_9,
      id_0,
      id_8,
      id_9,
      id_7,
      id_7,
      id_0,
      id_1,
      id_7,
      id_8,
      id_5,
      id_7,
      id_7
  );
endmodule
