// Seed: 2983007697
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  initial id_1 <= 1;
  tri id_2, id_3;
  always begin : LABEL_0
    if (1)
      if (id_2) begin : LABEL_0
        id_2 = -1 && id_1;
      end else begin : LABEL_0
        id_2 = id_2;
      end
    else $display;
  end
  id_4(
      id_2
  );
  wire id_5 = 1'b0;
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5,
      id_5
  );
endmodule
