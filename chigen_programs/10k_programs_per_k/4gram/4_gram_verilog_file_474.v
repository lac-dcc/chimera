// Seed: 2585028839
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    input tri1 id_3
);
  assign id_0 = 1;
endmodule
module module_1 (
    output wire id_0,
    output wire id_1,
    input wire id_2,
    input wire id_3,
    output tri0 id_4,
    output supply0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input wor id_8,
    output tri0 id_9,
    output supply1 id_10,
    input wor id_11,
    input supply1 id_12,
    input wand id_13,
    output wor id_14,
    input wor id_15,
    input uwire id_16,
    input wand id_17,
    input uwire id_18,
    input tri0 id_19,
    input wor id_20,
    output supply1 id_21
);
  wire id_23;
  always @(1'd0 or posedge 1) begin : LABEL_0
    id_21 = id_2 - id_19 == 1;
    wait ("");
  end
  wire id_24;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_14,
      id_18,
      id_13,
      id_13
  );
  assign modCall_1.id_3 = 0;
endmodule
