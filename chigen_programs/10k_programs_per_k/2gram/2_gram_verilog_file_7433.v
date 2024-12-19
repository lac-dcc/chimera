// Seed: 774400977
module module_0 ();
  final
    #1 begin : LABEL_0
      id_2 <= id_1;
    end
  wire id_4;
endmodule
module module_1 (
    output wire id_0,
    input supply1 id_1,
    input supply1 id_2,
    input uwire id_3,
    input uwire id_4,
    input tri id_5,
    input tri id_6,
    input tri0 id_7
);
  nor primCall (id_0, id_1, id_2, id_3, id_4, id_5, id_6, id_7);
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  initial @(posedge id_1) id_1 <= 1;
  module_0 modCall_1 ();
endmodule
