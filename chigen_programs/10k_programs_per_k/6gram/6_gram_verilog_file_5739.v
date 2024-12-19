// Seed: 1496914702
module module_0 #(
    parameter id_11 = 32'd83,
    parameter id_12 = 32'd86
) (
    input wand id_0,
    output supply1 id_1,
    input tri1 id_2,
    input wor id_3,
    output tri id_4,
    input tri id_5,
    input supply1 id_6,
    input wand id_7
    , id_10,
    output wire id_8
);
  defparam id_11.id_12 = 1;
endmodule
module module_0 (
    input wand id_0,
    output uwire id_1,
    input tri1 id_2,
    output tri0 id_3,
    input supply1 id_4,
    output tri id_5,
    input uwire id_6,
    input wand id_7,
    input uwire id_8,
    output tri id_9,
    output tri1 id_10,
    output wand module_1,
    output logic id_12,
    input supply1 id_13,
    output tri0 id_14,
    input tri1 id_15,
    input wor id_16
);
  reg  id_18;
  wire id_19;
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_12 <= id_7 - id_8;
      disable id_20;
      id_18 = id_8 - id_13 ^ id_13;
    end else id_18 <= 1;
  end
  module_0 modCall_1 (
      id_4,
      id_10,
      id_6,
      id_4,
      id_1,
      id_6,
      id_4,
      id_15,
      id_9
  );
  assign modCall_1.id_8 = 0;
endmodule
