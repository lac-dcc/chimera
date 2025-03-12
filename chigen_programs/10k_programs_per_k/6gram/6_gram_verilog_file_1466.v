// Seed: 31783479
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input wand id_2,
    input tri0 id_3,
    input tri1 id_4,
    output wor id_5,
    input tri id_6,
    output supply1 id_7
);
  always @(id_4 or posedge {id_6 == id_6{1}}) force id_7[1-1'b0 : 1'd0] = -1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri   id_0,
    input  wand  id_1,
    input  wire  id_2,
    output logic id_3
);
  always @(posedge !id_1 or negedge 1) begin : LABEL_0
    id_3 <= -1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0
  );
endmodule
