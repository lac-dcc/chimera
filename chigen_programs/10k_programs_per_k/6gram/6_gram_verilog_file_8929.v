// Seed: 1062002805
module module_0 (
    output wire id_0,
    input wand id_1,
    output tri0 id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    input wire id_6
    , id_8
);
  logic   id_9;
  integer id_10 = -1'd0;
endmodule
module module_1 (
    input tri1 id_0,
    output wand id_1,
    input wand id_2,
    output uwire id_3,
    output supply0 id_4,
    input supply0 id_5
    , id_8,
    output logic id_6
);
  always @(posedge -1) begin : LABEL_0
    id_6 <= 1;
    fork
      id_9(1, -1'b0);
    join_none
    id_6 = id_8;
    disable id_10;
  end
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_0,
      id_0,
      id_5,
      id_5
  );
endmodule
