// Seed: 1528553133
module module_0;
  reg id_2;
  always @(negedge id_1)
    if (id_2)
      #1 begin : LABEL_0
        if ('b0 & id_2) id_1 = "" + id_2;
        else if (id_2) id_2 <= 1;
      end
    else begin : LABEL_0
      if (1) id_2 <= id_2;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1[1] = 1;
  module_0 modCall_1 ();
  assign id_1 = id_3;
endmodule
