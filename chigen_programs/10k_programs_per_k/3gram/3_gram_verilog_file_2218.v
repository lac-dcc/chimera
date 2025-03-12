// Seed: 1888465078
module module_0 (
    input supply1 id_0,
    input tri id_1,
    output wand id_2,
    input uwire id_3
);
  always disable id_5;
endmodule
module module_1 (
    input tri0 id_0,
    output supply1 id_1,
    output uwire id_2,
    output supply0 id_3,
    input wire id_4,
    output tri1 id_5,
    output wand id_6,
    input uwire id_7,
    input tri1 id_8,
    input supply1 id_9,
    output tri1 id_10,
    output supply0 id_11,
    input supply1 id_12,
    output supply0 id_13,
    input supply0 id_14,
    output logic id_15,
    output uwire id_16,
    input tri id_17,
    output wor id_18,
    input tri0 id_19,
    inout tri1 id_20,
    output logic id_21,
    input wand id_22,
    input tri0 id_23,
    input tri0 id_24,
    input tri0 id_25,
    input wor id_26,
    input tri id_27,
    input tri0 id_28,
    output tri id_29,
    input supply1 id_30,
    output uwire id_31
);
  wire id_33;
  wire id_34;
  module_0 modCall_1 (
      id_4,
      id_19,
      id_1,
      id_14
  );
  assign modCall_1.id_2 = 0;
  always @(posedge 1) begin : LABEL_0
    id_15 <= #1  (id_24);
  end
  always_latch @(posedge -1) id_21 = id_24;
endmodule
