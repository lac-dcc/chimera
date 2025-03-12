// Seed: 3830784902
module module_0 (
    id_1,
    id_2
);
  inout uwire id_2;
  assign module_2.id_4 = 0;
  inout uwire id_1;
  assign id_2 = id_1;
  assign id_2 = id_1;
  assign id_1 = -1 ? id_2 : id_1 ? 1 : -1;
endmodule
module module_1;
  wire id_1;
  parameter id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
module module_2 (
    input tri id_0,
    output supply1 id_1,
    input wire id_2,
    input tri1 id_3,
    input wire id_4
);
  assign id_1 = id_0;
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6
  );
  id_7 :
  assert property (@(posedge id_3) id_3)
  else $signed(99);
  ;
endmodule
