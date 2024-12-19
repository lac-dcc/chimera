// Seed: 3877106277
module module_0 (
    input uwire id_0,
    output uwire id_1,
    input wire id_2,
    input supply0 id_3,
    input uwire id_4,
    output wire id_5,
    input wire id_6,
    output tri1 id_7,
    input tri id_8,
    input supply1 id_9,
    input tri0 id_10,
    output wire id_11,
    input tri0 id_12,
    input wire id_13,
    output supply1 id_14,
    input wor id_15
    , id_25,
    output supply0 id_16,
    output tri0 id_17,
    input tri1 id_18,
    output wand id_19
    , id_26,
    input tri id_20,
    output supply0 id_21,
    input tri id_22,
    input tri0 id_23
);
  assign id_25 = 1;
  always @(posedge 1 or id_20) $display(1, id_9);
  wire id_27;
  wire id_28;
  wire id_29;
  wire id_30;
  assign id_7 = 1'b0;
  supply0 id_31 = 1'd0;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    input uwire id_2,
    output wor id_3,
    output uwire id_4,
    output wor id_5,
    output supply0 id_6,
    output logic id_7,
    input supply1 id_8,
    input tri id_9,
    output tri0 id_10,
    input tri id_11,
    output tri1 id_12,
    input wire id_13,
    output wire id_14,
    inout wire id_15,
    input tri id_16,
    input tri0 id_17,
    input supply0 id_18,
    input wor id_19,
    output tri1 id_20,
    input supply0 id_21,
    input tri1 id_22,
    input tri1 id_23,
    output wor id_24,
    input supply1 id_25,
    input wor id_26,
    input wire id_27,
    input uwire id_28,
    input supply0 id_29,
    input tri0 id_30,
    output tri0 id_31,
    output wire id_32
);
  always @(id_28 or 1 + id_2) begin : LABEL_0
    if (1) id_7 <= 1;
    else assume (id_29 >= id_19);
  end
  module_0 modCall_1 (
      id_19,
      id_31,
      id_21,
      id_15,
      id_9,
      id_10,
      id_19,
      id_14,
      id_26,
      id_11,
      id_16,
      id_31,
      id_27,
      id_0,
      id_1,
      id_16,
      id_15,
      id_3,
      id_26,
      id_24,
      id_9,
      id_15,
      id_25,
      id_15
  );
endmodule
