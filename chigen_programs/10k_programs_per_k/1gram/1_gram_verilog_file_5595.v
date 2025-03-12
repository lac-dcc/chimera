// Seed: 3505148336
module module_0;
  logic id_1;
  ;
  module_2 modCall_1 ();
endmodule
module module_1;
  parameter id_1 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 ();
  id_1 :
  assert property (@(-1) id_1) id_1 <= id_1 - 1;
  assign module_4.id_4 = 0;
endmodule
module module_3 (
    output uwire id_0,
    input  wire  id_1
);
  assign id_0 = id_1 ? id_1 : id_1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_4 (
    input supply1 id_0,
    input wire id_1,
    input supply0 id_2,
    input supply1 id_3,
    output logic id_4,
    output wire id_5,
    input supply0 id_6,
    input uwire id_7,
    output wand id_8,
    input supply0 id_9,
    input supply0 id_10,
    input tri id_11,
    output tri1 id_12
);
  id_14 :
  assert property (@(posedge id_10) id_9)
    case (id_3)
      (id_11): id_14 <= id_1;
      id_2: id_4 <= id_14;
    endcase
  and primCall (id_12, id_14, id_2, id_3, id_6, id_7, id_9);
  module_2 modCall_1 ();
endmodule
