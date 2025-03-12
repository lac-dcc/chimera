// Seed: 2248837461
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input supply1 id_2
);
  localparam id_4 = -1'b0;
  module_2 modCall_1 ();
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    output uwire id_2,
    output wand id_3,
    output supply0 id_4,
    input wire id_5,
    input wor id_6
);
  assign id_4 = 1 * id_5;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6
  );
  assign id_0 = id_5 ? id_6 & 1 : -1;
endmodule
module module_2 ();
  wire id_1;
  logic [7:0] id_2 = id_2[-1];
  always_ff @(negedge id_2 or 1) begin : LABEL_0
    return id_2;
  end
  assign module_0.id_0 = 0;
endmodule
