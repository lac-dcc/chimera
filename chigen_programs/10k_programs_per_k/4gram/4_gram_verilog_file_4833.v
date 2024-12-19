// Seed: 994564462
module module_0 (
    input  tri1  id_0,
    output wor   id_1,
    input  tri   id_2,
    input  uwire id_3,
    output tri   id_4
);
  assign id_4 = id_3;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output wire id_0,
    output supply0 id_1,
    output tri1 id_2,
    output logic id_3,
    input wand id_4,
    input uwire id_5,
    input wor id_6,
    input tri0 id_7,
    input supply1 id_8,
    output uwire id_9,
    input tri1 id_10,
    input supply1 id_11
);
  always @(posedge id_11 or posedge id_10 && id_7 && 1) begin : LABEL_0
    release id_1;
  end
  always @(negedge id_4) id_3 = #id_13 1;
  wire id_14;
  tri1 id_15 = id_15;
  supply0 id_16 = id_8;
  supply1 id_17;
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_17,
      id_6,
      id_4,
      id_2
  );
  assign id_17 = id_15;
endmodule
