// Seed: 1910278725
module module_0 (
    input wand id_0,
    input supply0 id_1,
    output wand id_2,
    input tri id_3,
    input tri1 id_4
);
  wire id_6;
  assign module_1.type_9 = 0;
  wire id_7;
endmodule
module module_1 (
    inout wand id_0,
    inout tri1 id_1,
    output wand id_2,
    input uwire id_3,
    output tri1 id_4,
    input wire id_5,
    input tri1 id_6,
    output supply1 id_7
);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_0,
      id_6
  );
  assign id_2 = id_0;
endmodule
module module_2 ();
  logic [7:0] id_2;
  assign id_1 = 1;
  id_3 :
  assert property (@(posedge id_2[1]) 1'h0 ^ id_1)
  else
    #id_4 begin : LABEL_0
      id_4 = ~1 - 1;
    end
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  module_2 modCall_1 ();
  always id_2 = id_3;
endmodule
