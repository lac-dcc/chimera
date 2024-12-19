// Seed: 1117594154
module module_0;
  wor id_2 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always #1 begin : LABEL_0
    if (1)
      if (id_2) id_3 <= 1'b0 - id_2;
      else begin : LABEL_0
        id_3 = 1;
        id_3 = id_1;
        if (1) begin : LABEL_0
          id_3 = 1;
        end
        id_3 = id_2;
        $display(id_2);
      end
  end
  module_0 modCall_1 ();
  assign modCall_1.type_5 = 0;
  assign id_3 = 1 | id_1;
endmodule
