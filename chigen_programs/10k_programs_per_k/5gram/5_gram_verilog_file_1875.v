// Seed: 3880332903
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    output wire id_2,
    output wand id_3,
    input supply0 id_4,
    output tri1 id_5
);
  wire id_7;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wire id_0,
    output logic id_1,
    output uwire id_2,
    input uwire id_3,
    input supply0 id_4,
    input wire id_5
);
  assign id_1 = id_3 == -1 ? -1 : id_5 == -1'b0;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_0,
      id_5,
      id_2
  );
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_1 <= -1'd0;
    end
  end
endmodule
