// Seed: 4000764160
module module_0 (
    output logic   id_0,
    input  supply0 id_1
);
  initial begin : LABEL_0
    case ("")
      id_1: id_0 = -1'h0 == 1;
      -1'b0: id_0 = 1;
      -1'b0: id_0 = id_1;
      default: id_0 = -1;
    endcase
    id_0 <= ~^id_1;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    output wire  id_1,
    output tri1  id_2,
    input  uwire id_3,
    output tri   id_4
);
  initial id_0 = id_3;
  module_0 modCall_1 (
      id_0,
      id_3
  );
endmodule
