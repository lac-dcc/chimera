// Seed: 721298391
module module_0 (
    output logic id_0,
    output wand  id_1,
    output uwire id_2,
    input  tri1  id_3,
    output tri1  id_4,
    output wor   id_5
);
  wire id_7;
  always id_0 = #id_8 id_8;
  wire id_9;
  assign module_1.type_30 = 0;
  assign id_7 = !id_3;
endmodule
module module_1 #(
    parameter id_22 = 32'd81,
    parameter id_23 = 32'd99
) (
    input  wire  id_0,
    output wor   id_1,
    output uwire id_2,
    output logic id_3,
    input  tri   id_4,
    output tri1  id_5,
    output wand  id_6,
    output tri0  id_7,
    output tri0  id_8,
    input  logic id_9,
    input  tri0  id_10
    , id_12
);
  wor id_13, id_14, id_15, id_16, id_17;
  wand id_18;
  wire id_19;
  supply0 id_20 = 1;
  if ((id_4) < id_20) begin : LABEL_0
    always id_3 = #1 id_9;
    assign id_18 = 1;
  end else begin : LABEL_0
    wire id_21;
    defparam id_22.id_23 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_6,
      id_2,
      id_10,
      id_1,
      id_13
  );
  assign id_15 = 1;
  wire id_24;
  assign id_6  = 1;
  assign id_15 = id_4;
endmodule
