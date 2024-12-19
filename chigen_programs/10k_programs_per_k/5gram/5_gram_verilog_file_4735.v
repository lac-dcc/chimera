// Seed: 4176501030
module module_0 (
    output supply0 id_0,
    input wand id_1,
    input uwire id_2,
    input wire id_3
);
  initial begin : LABEL_0
    #1 id_0 = 1;
  end
endmodule
module module_1 (
    input  wire  id_0,
    output tri   id_1,
    input  tri   id_2,
    output tri0  id_3,
    input  uwire id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_4
  );
  assign modCall_1.type_6 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  id_7(
      .id_0(1'b0), .id_1(1)
  );
  wire id_8;
  id_9 :
  assert property (@(posedge 1) 1)
  else $display(1 >= 1);
  module_2 modCall_1 (
      id_4,
      id_2,
      id_2
  );
endmodule
