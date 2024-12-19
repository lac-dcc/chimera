// Seed: 2572056169
module module_0 (
    input tri id_0,
    output tri1 id_1,
    input tri id_2,
    input uwire id_3,
    input supply0 id_4
);
  wire id_6;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    input wand id_2,
    output logic id_3,
    input supply1 id_4,
    input tri0 id_5,
    output uwire id_6,
    output tri1 id_7,
    output wire id_8,
    output wor id_9,
    input wire id_10,
    output logic id_11,
    output tri0 id_12,
    input wire id_13,
    output tri0 id_14,
    input tri1 id_15,
    input wor id_16,
    input wand id_17
);
  always @(id_16 or negedge 1 - id_17) begin : LABEL_0
    id_11 <= 1 !=? 1'b0;
  end
  module_0 modCall_1 (
      id_4,
      id_9,
      id_17,
      id_2,
      id_2
  );
  assign modCall_1.id_2 = 0;
  id_19 :
  assert property (@(posedge 1) id_0)
  else id_3 <= 1;
  wire id_20;
  xnor primCall (id_8, id_4, id_15, id_17, id_0, id_1, id_10, id_16, id_5);
endmodule
