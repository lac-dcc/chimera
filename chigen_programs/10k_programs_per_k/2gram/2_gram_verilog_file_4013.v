// Seed: 54141917
module module_0 (
    output supply1 id_0,
    output logic id_1,
    input tri1 id_2,
    input wire id_3
);
  always @(negedge (id_3)) begin : LABEL_0
    id_1 <= id_2 ? -1 : 1;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd39,
    parameter id_2 = 32'd59
) (
    input  uwire _id_0,
    input  wire  id_1,
    input  wand  _id_2,
    input  tri0  id_3,
    output logic id_4,
    output wand  id_5,
    input  wand  id_6,
    input  wand  id_7
);
  always
  fork
    id_4 = -1;
  join
  wire [id_0 : id_2] id_9;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_7,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
