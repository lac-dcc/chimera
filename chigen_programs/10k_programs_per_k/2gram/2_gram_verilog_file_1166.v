// Seed: 1574222293
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    output supply0 id_5,
    output wor id_6,
    input wire id_7,
    output tri id_8,
    input wor id_9,
    input tri1 id_10,
    input tri id_11,
    output wand id_12
);
  wire id_14;
  wire id_15;
  wire id_16;
  assign id_4 = id_7;
  assign module_1.type_26 = 0;
endmodule
module module_1 (
    input logic id_0,
    input tri id_1,
    output logic id_2,
    input tri id_3,
    input supply0 id_4,
    output uwire id_5,
    input uwire id_6,
    input supply1 id_7,
    input wire id_8,
    input wire id_9
);
  generate
    assign id_2 = (id_0);
  endgenerate
  reg  id_11;
  tri1 id_12;
  wire id_13, id_14, id_15, id_16;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5,
      id_12,
      id_4,
      id_5,
      id_12,
      id_3,
      id_8,
      id_12
  );
  wire id_17;
  wire id_18;
  always #1;
  always begin : LABEL_0
    id_2  <= 1'h0;
    id_11 <= 1'b0;
  end
  assign id_5 = id_12;
  wire id_19;
  wire id_20;
endmodule
