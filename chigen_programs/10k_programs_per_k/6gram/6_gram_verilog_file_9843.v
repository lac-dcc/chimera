// Seed: 2341792762
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    input wor id_2,
    input wor id_3,
    input supply1 id_4,
    output tri0 id_5,
    output uwire id_6,
    output wire id_7,
    output tri id_8
);
  assign id_8 = id_1;
  assign id_7 = 1;
  assign module_1.id_20 = 0;
endmodule
module module_1 #(
    parameter id_19 = 32'd57,
    parameter id_20 = 32'd44
) (
    input tri0 id_0,
    output tri0 id_1,
    input logic id_2,
    input supply0 id_3,
    input wand id_4,
    output wor id_5,
    input tri1 id_6,
    input tri0 id_7,
    input tri1 id_8,
    input supply1 id_9,
    output tri0 id_10,
    input wand id_11,
    output logic id_12,
    input wor id_13,
    output wire id_14,
    input supply1 id_15,
    input tri1 id_16,
    output wor id_17
);
  defparam id_19.id_20 = 1; id_21(
      .id_0(1'b0), .id_1(1)
  );
  wire id_22;
  always @(negedge 1) begin : LABEL_0
    id_12 <= 1;
  end
  module_0 modCall_1 (
      id_14,
      id_16,
      id_8,
      id_4,
      id_9,
      id_5,
      id_17,
      id_10,
      id_17
  );
  wire id_23;
  wire id_24;
  wire id_25;
  always force id_12 = id_2;
  always force id_5 = 1'b0;
endmodule
