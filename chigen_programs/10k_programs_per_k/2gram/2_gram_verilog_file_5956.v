// Seed: 4073948138
module module_0 (
    input wire id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3
);
  wire  id_5;
  logic id_6 [-1 : 1 'd0];
endmodule
module module_1 (
    output tri1 id_0,
    output uwire id_1,
    input supply1 id_2,
    input wand id_3,
    input tri1 id_4,
    output supply1 id_5,
    input wand id_6,
    output logic id_7
);
  initial begin : LABEL_0
    id_7 <= id_2;
    case (id_3)
      id_3: assign id_0 = -1;
      id_3 - id_3 ==? 1: #1;
    endcase
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_4,
      id_2
  );
  assign modCall_1.id_2 = 0;
  assign id_1 = -1'b0;
  always assume #1  (id_2);
endmodule
