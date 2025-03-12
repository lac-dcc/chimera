// Seed: 1469217195
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input uwire id_2,
    output supply0 id_3,
    input wand id_4,
    input supply1 id_5,
    input tri1 id_6,
    input uwire id_7,
    input tri id_8,
    output uwire id_9,
    input wand id_10,
    input supply0 id_11,
    input wire id_12,
    input wor id_13,
    input tri0 id_14,
    input wand id_15,
    input tri0 id_16,
    output wand id_17,
    output tri id_18,
    input uwire id_19,
    output tri0 id_20,
    output supply1 id_21,
    output wire id_22,
    output supply1 id_23,
    input tri id_24,
    input uwire id_25,
    output tri id_26,
    input tri1 id_27,
    input uwire id_28,
    output tri1 id_29,
    input wor id_30,
    input supply0 id_31,
    output wand id_32
);
  logic id_34;
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    input wand id_2,
    output tri0 id_3,
    input tri0 id_4,
    output wand id_5,
    output tri1 id_6,
    input wand id_7,
    input uwire id_8,
    output supply1 id_9,
    input wand id_10,
    input wor id_11,
    input supply0 id_12,
    output logic id_13,
    input uwire id_14
    , id_21,
    inout wire id_15,
    output uwire id_16,
    output logic id_17,
    input wand id_18,
    output wand id_19
);
  assign id_6 = 1;
  wire id_22;
  always @(posedge id_11 == -1) begin : LABEL_0
    id_13 <= id_8;
    id_17 <= 1;
    id_13 <= id_0;
    if (1 == ~(-1'h0)) begin : LABEL_1
      @(posedge !id_10);
      assert (id_10);
    end else id_1 <= id_21 ? id_11 : 1;
  end
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_19,
      id_14,
      id_11,
      id_4,
      id_11,
      id_18,
      id_9,
      id_4,
      id_8,
      id_2,
      id_0,
      id_8,
      id_15,
      id_10,
      id_5,
      id_16,
      id_18,
      id_3,
      id_16,
      id_15,
      id_3,
      id_4,
      id_0,
      id_16,
      id_0,
      id_0,
      id_5,
      id_12,
      id_7,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
