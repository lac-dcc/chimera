// Seed: 1211929310
module module_0 (
    input tri id_0,
    input tri id_1,
    output logic id_2,
    input wor module_0,
    input uwire id_4,
    input wor id_5,
    input uwire id_6,
    output supply0 id_7,
    input logic id_8,
    input uwire id_9,
    input wand id_10,
    input supply0 id_11,
    input supply0 id_12
    , id_20,
    output supply1 id_13,
    input supply0 id_14,
    input tri0 id_15,
    output logic id_16,
    output uwire id_17,
    output tri id_18
);
  assign id_18 = id_0;
  assign module_1.id_6 = 0;
  initial begin : LABEL_0
    id_2  <= id_8;
    id_16 <= 1;
  end
  assign id_17 = id_8 == 1;
endmodule
module module_1 (
    output logic id_0,
    input  tri0  id_1,
    input  tri   id_2,
    input  logic id_3,
    input  tri1  id_4,
    output tri1  id_5,
    output wire  id_6
);
  always @(posedge 1) begin : LABEL_0
    id_0 = #id_8 id_3;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_4,
      id_4,
      id_1,
      id_6,
      id_3,
      id_1,
      id_4,
      id_4,
      id_1,
      id_6,
      id_2,
      id_2,
      id_0,
      id_6,
      id_5
  );
endmodule
