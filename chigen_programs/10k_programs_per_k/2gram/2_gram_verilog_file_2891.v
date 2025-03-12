// Seed: 1495214084
module module_0 (
    output wand id_0,
    output wire id_1
);
endmodule
module module_1 (
    output uwire   id_0,
    output uwire   id_1,
    output supply0 id_2,
    input  uwire   id_3
);
  logic id_5;
  ;
  module_0 modCall_1 (
      id_0,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output supply0 id_0,
    output wand id_1
    , id_3
);
  module_0 modCall_1 (
      id_0,
      id_1
  );
endmodule
module module_3 (
    output wor   id_0,
    output uwire id_1
);
  assign id_1 = -1;
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_4 (
    input wire id_0
);
  logic id_2;
  ;
endmodule
module module_5 #(
    parameter id_5 = 32'd77
) (
    input uwire   id_0,
    input uwire   id_1,
    input supply0 id_2,
    input supply0 id_3
);
  _id_5 :
  assert property (@(posedge 1'b0) 1'h0)
  else;
  module_4 modCall_1 (id_2);
  wire [id_5 : 1] id_6;
  assign id_5 = id_1;
endmodule
