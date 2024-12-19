// Seed: 1710506301
module module_0 (
    id_1
);
  output wire id_1;
  uwire id_3;
  id_4 :
  assert property (@(negedge id_4) 1)
  else begin : LABEL_0
    #1 begin : LABEL_0
      if (id_3) begin : LABEL_0
        `define pp_5 0
      end
    end
    id_4 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  module_0 modCall_1 (id_4);
endmodule
module module_2 (
    output wire id_0,
    input tri1 id_1,
    input supply0 id_2
);
  wire id_4;
endmodule
module module_3 (
    input wire id_0,
    output supply1 id_1,
    input uwire id_2
);
  assign id_1 = id_0;
  module_2 modCall_1 (
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.type_5 = 0;
endmodule
