// Seed: 4031563038
module module_0 (
    output tri1 id_0,
    output wand id_1,
    input tri0 id_2,
    input wand id_3
    , id_13,
    output uwire id_4,
    input supply0 id_5,
    output supply0 id_6,
    output supply1 id_7,
    output wire id_8,
    input wand id_9,
    output wor id_10,
    input supply1 id_11
);
  assign id_6 = id_2 == -1'b0;
  timeunit 1ps;
  assign module_1.id_2 = 0;
  wire id_14;
endmodule
module module_1 (
    input tri id_0,
    output wire id_1,
    output tri1 id_2,
    output supply1 id_3,
    output logic id_4,
    input wand id_5
    , id_9,
    output tri id_6,
    output wor id_7
);
  wire [1 : -1 'b0] id_10;
  always @(posedge id_10 or -1) begin : LABEL_0
    id_4 = #1 -1;
  end
  module_0 modCall_1 (
      id_6,
      id_7,
      id_5,
      id_5,
      id_1,
      id_5,
      id_6,
      id_1,
      id_1,
      id_5,
      id_1,
      id_0
  );
endmodule
