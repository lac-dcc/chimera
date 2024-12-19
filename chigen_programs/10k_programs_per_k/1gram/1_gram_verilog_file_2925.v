// Seed: 4023176884
module module_0 ();
  module_2 modCall_1 ();
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1
);
  wire id_3, id_4;
  xor primCall (id_0, id_1, id_3, id_4, id_5);
  wire id_5;
  module_0 modCall_1 ();
  wire id_6;
endmodule
module module_2 ();
  wire id_1;
  assign module_3.type_7 = 0;
endmodule
module module_3 (
    output supply1 id_0,
    input wire id_1
);
  wand id_3, id_4;
  if ({1, (1) == 1, id_3 && 1}) wire id_5;
  else begin : LABEL_0
    begin : LABEL_0
      assign id_3 = id_4;
    end
  end
  module_2 modCall_1 ();
  wire id_6;
endmodule
