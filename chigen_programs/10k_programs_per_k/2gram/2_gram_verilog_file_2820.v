// Seed: 3854007084
module module_0;
  assign module_2.id_3 = 0;
  always
    if (1)
      #1
        if ({id_1, 1}) id_1 = 1;
        else begin : LABEL_0
          @(id_1 or posedge (1));
          for (id_1 = 1; id_1 & id_1 & 1 & 1; id_1 = 1'd0) id_1 = 1;
        end
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  tri1 id_0,
    input  tri1 id_1,
    input  tri1 id_2,
    output tri  id_3,
    input  tri0 id_4
);
  assign id_3 = 1;
  module_0 modCall_1 ();
endmodule
