// Seed: 2116787913
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input wand id_2,
    input wor id_3,
    input tri1 id_4,
    output tri1 id_5,
    input wand id_6,
    input wor id_7,
    input wire id_8,
    output tri1 id_9,
    output tri1 id_10,
    output tri id_11,
    input tri0 id_12,
    input wor id_13,
    input tri id_14
    , id_21,
    input tri id_15,
    input uwire id_16,
    input tri0 id_17,
    output tri0 id_18,
    output wand id_19
);
  wand id_22 = 1;
  wire id_23;
  assign id_19 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1,
    input  tri   id_2,
    input  logic id_3,
    input  tri1  id_4,
    output logic id_5,
    output wand  id_6
);
  always @(1 or posedge id_1, posedge id_4 or negedge id_4) begin : LABEL_0
    id_0 = 1;
    $display();
    id_5 <= id_3;
    disable id_8;
  end
  module_0 modCall_1 (
      id_8,
      id_2,
      id_4,
      id_1,
      id_4,
      id_6,
      id_1,
      id_2,
      id_8,
      id_0,
      id_0,
      id_8,
      id_1,
      id_8,
      id_2,
      id_2,
      id_8,
      id_8,
      id_8,
      id_6
  );
endmodule
