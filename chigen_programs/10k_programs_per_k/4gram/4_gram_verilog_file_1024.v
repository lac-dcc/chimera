// Seed: 3461520210
module module_0 (
    output wand id_0
    , id_5,
    input tri id_1,
    output supply1 id_2,
    input wand id_3
);
  assign id_0 = id_1;
  wire id_6 = id_5;
  assign module_2.type_6 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wire id_4,
    input uwire id_5
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_1
  );
endmodule
module module_2 (
    input logic id_0,
    input tri1 module_2,
    input supply0 id_2,
    input wire id_3,
    output uwire id_4,
    output tri1 id_5
    , id_12,
    output wor id_6,
    output tri0 id_7,
    input wand id_8,
    input supply0 id_9,
    output logic id_10
);
  always @(1 or id_2) begin : LABEL_0
    id_10 <= id_0;
  end
  id_13 :
  assert property (@(posedge id_8) 1)
  else $display(1'd0 == id_3, id_13);
  module_0 modCall_1 (
      id_5,
      id_3,
      id_4,
      id_8
  );
endmodule
