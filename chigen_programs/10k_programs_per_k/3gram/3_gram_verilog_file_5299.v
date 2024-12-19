// Seed: 1759598975
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input uwire id_2,
    output supply1 id_3,
    output wand id_4,
    output wand id_5,
    input supply0 id_6,
    input wand id_7,
    output tri1 id_8,
    output wire id_9,
    input wor id_10,
    output wire id_11,
    input tri0 id_12,
    output wire id_13
);
  wire id_15;
  wire id_16;
  tri  id_17 = 1;
  wire id_18;
  assign module_1.id_3 = 0;
  wire id_19;
  tri0 id_20;
  assign id_5 = 1;
  wire id_21;
  always @(id_20 or id_21) begin : LABEL_0
    #1;
  end
  wor id_22;
  id_23(
      .id_0(1), .id_1(id_1), .id_2(id_19)
  );
  if (id_22) begin : LABEL_0
    wire id_24;
  end
  wire id_25;
endmodule
module module_1 #(
    parameter id_11 = 32'd90,
    parameter id_12 = 32'd95
) (
    inout wire id_0,
    input wor id_1,
    input supply0 id_2,
    output wor id_3,
    output wor id_4,
    input wor id_5,
    output tri0 id_6,
    input wand id_7,
    input wor id_8,
    input tri0 id_9
);
  assign id_6 = id_9;
  defparam id_11.id_12 = 1'b0;
  tri0 id_13 = id_0;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_3,
      id_13,
      id_13,
      id_7,
      id_13,
      id_6,
      id_3,
      id_1,
      id_0,
      id_2,
      id_6
  );
  tri0 id_14 = id_5;
endmodule
