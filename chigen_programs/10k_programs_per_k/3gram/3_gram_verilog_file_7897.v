// Seed: 1279116755
module module_0 (
    input  wire  id_0,
    input  wand  id_1,
    output uwire id_2
    , id_8,
    input  wor   id_3,
    output uwire id_4,
    output wire  id_5,
    input  tri1  id_6
);
  assign id_4 = -1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output wire id_0,
    input supply1 id_1,
    inout logic id_2,
    input tri1 id_3,
    output logic id_4
    , id_7,
    input uwire id_5
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_3,
      id_0,
      id_0,
      id_1
  );
  always @(negedge id_5) begin : LABEL_0
    id_4 = id_3;
    id_2 <= id_7;
  end
  assign #id_8 id_2 = {id_7[""], -1};
endmodule
