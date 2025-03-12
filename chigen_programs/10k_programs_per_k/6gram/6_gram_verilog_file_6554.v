// Seed: 1879983480
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    output supply0 id_4,
    input tri1 id_5,
    input wand id_6,
    output wire id_7
);
  wire  id_9;
  logic id_10;
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    output supply0 id_2,
    input supply1 id_3,
    output wire id_4,
    input supply1 id_5,
    input supply0 id_6,
    output uwire id_7,
    output wire id_8,
    input wand id_9,
    input wand id_10,
    input supply1 id_11,
    input tri id_12,
    input uwire id_13,
    input supply1 id_14,
    input uwire id_15,
    output logic id_16,
    output wor id_17,
    input tri1 id_18,
    input supply0 id_19,
    input wand id_20,
    input wand id_21,
    input wor id_22,
    input tri0 id_23,
    input uwire id_24,
    input wor id_25,
    input uwire id_26,
    output wor id_27
);
  module_0 modCall_1 (
      id_8,
      id_25,
      id_25,
      id_18,
      id_4,
      id_21,
      id_3,
      id_17
  );
  assign modCall_1.id_3 = 0;
  wire id_29;
  always @(posedge id_9) begin : LABEL_0
    if (1) id_16 <= id_18 == -1;
    else begin : LABEL_1
      wait (1'b0);
      id_1 = 1;
    end
  end
endmodule
