// Seed: 2313618350
module module_0 (
    input supply1 id_0,
    input tri0 id_1
    , id_13,
    input tri id_2,
    input supply0 id_3,
    output supply1 id_4,
    input uwire id_5,
    output tri0 id_6,
    input wand id_7,
    output tri0 id_8,
    output uwire id_9,
    output supply0 id_10,
    input uwire id_11
    , id_14
);
  wire id_15;
  always @(posedge 1) begin : LABEL_0
    disable id_16;
  end
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    input wor id_2,
    input wire id_3,
    input supply1 id_4,
    input tri1 id_5,
    input uwire id_6,
    input wand id_7,
    output tri0 id_8,
    input uwire id_9,
    input tri id_10,
    input wor id_11,
    input supply1 id_12,
    input tri0 id_13,
    output tri id_14,
    output logic id_15,
    input supply1 id_16,
    input tri id_17,
    input tri0 id_18,
    input tri id_19,
    output wire id_20,
    input logic id_21,
    output tri0 id_22,
    output tri1 id_23,
    input wire id_24,
    input wand id_25,
    output tri id_26,
    input tri id_27,
    output wire id_28,
    input uwire id_29
    , id_33,
    input wor id_30,
    input wor id_31
);
  always @(1) begin : LABEL_0
    assign id_20 = id_33;
    id_22 = id_3;
    if (id_25) begin : LABEL_0
      id_8 = id_4;
    end else id_15 <= id_21;
  end
  nor primCall (
      id_20,
      id_5,
      id_16,
      id_6,
      id_1,
      id_2,
      id_3,
      id_17,
      id_0,
      id_24,
      id_19,
      id_4,
      id_27,
      id_33,
      id_21,
      id_30,
      id_10,
      id_7,
      id_11,
      id_13
  );
  module_0 modCall_1 (
      id_4,
      id_29,
      id_7,
      id_27,
      id_20,
      id_10,
      id_22,
      id_5,
      id_26,
      id_23,
      id_26,
      id_29
  );
  assign modCall_1.id_5 = 0;
  wire id_34;
  always repeat (1) id_33 <= id_29 == id_7;
endmodule
