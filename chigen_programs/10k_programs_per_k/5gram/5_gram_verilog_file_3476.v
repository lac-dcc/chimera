// Seed: 3550069392
module module_0 (
    output wor id_0,
    output tri1 id_1,
    input wand id_2,
    input uwire id_3,
    input wor id_4,
    output wor id_5,
    output supply0 id_6,
    output supply1 id_7
);
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    output tri0 id_2,
    input wire id_3,
    input tri1 id_4
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
  timeprecision 1ps;
endmodule
module module_2 (
    input wire id_0
    , id_11,
    input wire id_1,
    output logic id_2,
    output tri0 id_3,
    input wor id_4,
    input tri0 id_5,
    input supply1 id_6,
    output wire id_7,
    output wire id_8,
    input tri0 id_9
);
  module_0 modCall_1 (
      id_3,
      id_7,
      id_1,
      id_9,
      id_9,
      id_3,
      id_8,
      id_8
  );
  assign id_11 = 1'b0;
  wire id_12;
  wire id_13;
  ;
  nand primCall (id_8, id_6, id_0, id_9, id_4, id_11, id_1, id_5);
  always_latch @(posedge id_6 or posedge id_0) begin : LABEL_0
    id_2 <= -1'b0;
  end
endmodule
