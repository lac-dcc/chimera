// Seed: 1010252600
module module_0 (
    output tri id_0,
    output tri0 id_1,
    input tri1 id_2,
    input uwire id_3,
    input uwire id_4,
    input wire id_5,
    input supply1 id_6,
    input supply1 id_7,
    input tri id_8,
    input tri0 id_9,
    input tri0 id_10,
    input supply1 id_11,
    input supply0 id_12
);
  always disable id_14;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1
);
  always @(id_0) id_1 <= 1;
  assign id_1 = 1;
  supply0 id_3;
  wand id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_0,
      id_4
  );
  always @(posedge id_0) if (id_0) id_3 = id_4 + 1;
  always_comb @(1 or posedge 1) begin : LABEL_0
    if (id_0) begin : LABEL_0
      if (1 + 1) disable id_5;
      id_4 = id_0;
      `define pp_6 0
      id_1 <= 1;
      #1;
    end else id_4 = id_4;
  end
endmodule
