// Seed: 2987692714
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    input wire id_2,
    output uwire id_3,
    output wire id_4,
    input wand id_5,
    input tri0 id_6
);
  assign id_3 = id_5;
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input supply1 id_6,
    output logic id_7,
    input tri id_8,
    input logic id_9,
    output logic id_10,
    input wor id_11,
    input wand id_12,
    output logic id_13,
    input supply0 id_14,
    input wor id_15,
    input wand id_16,
    input supply1 id_17,
    input tri1 id_18,
    output uwire id_19,
    output supply1 id_20
);
  wire id_22;
  always @(posedge id_22) begin : LABEL_0
    if (1) disable id_23;
    else begin : LABEL_0
      id_7  <= id_9;
      id_10 <= 1;
      assert (!id_6);
      id_13 <= 1;
    end
  end
  module_0 modCall_1 (
      id_18,
      id_0,
      id_11,
      id_20,
      id_20,
      id_2,
      id_14
  );
  assign modCall_1.id_5 = 0;
endmodule
