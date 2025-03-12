// Seed: 2671975689
module module_0 (
    input uwire id_0,
    input wor id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wire id_4,
    output supply0 id_5,
    input tri0 id_6,
    output supply1 id_7,
    input wand id_8,
    input tri1 id_9
);
  logic id_11;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    input  wand id_0,
    output tri  id_1,
    output tri1 id_2
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_7 = 0;
  logic id_4;
  ;
  wire id_5;
endmodule
module module_2 (
    output wor id_0,
    input wire id_1,
    input wire id_2,
    output logic id_3,
    input wand id_4,
    output tri0 id_5,
    input tri1 id_6,
    output tri0 id_7,
    output supply0 id_8,
    input tri id_9,
    input supply1 id_10,
    output tri0 id_11
);
  wire id_13;
  ;
  always @(posedge id_9)
    if (1) id_3 <= id_4;
    else if (1'b0 ^ 1) begin : LABEL_0
      $signed(16);
      ;
    end
  module_0 modCall_1 (
      id_2,
      id_10,
      id_1,
      id_4,
      id_2,
      id_8,
      id_9,
      id_7,
      id_10,
      id_9
  );
  assign id_7 = {1'b0, id_10, id_1};
endmodule
