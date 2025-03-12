// Seed: 3742744965
module module_0 ();
  wire id_1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  tri1  id_1
);
  initial begin : LABEL_0
    if (-1'b0) begin : LABEL_1
      id_0 <= id_1;
      if (1)
        if (1) begin : LABEL_2
          id_0 = 1;
        end else begin : LABEL_3
          id_0 <= id_1;
        end
      if (1) id_0 = id_1;
    end
    if (1 | 1) id_0 = 1;
    else id_0 = -1'b0;
    `define pp_3 0
  end
  module_0 modCall_1 ();
endmodule
