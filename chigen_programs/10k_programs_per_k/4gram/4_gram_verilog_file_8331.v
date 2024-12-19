// Seed: 662161723
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign module_2.id_7 = 0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input tri0 id_2,
    input tri0 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
module module_2 (
    input tri id_0,
    input supply0 id_1,
    input tri0 id_2,
    output supply0 id_3,
    output supply1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  supply0 id_7;
  id_8 :
  assert property (@(posedge id_7) id_1)
  else $display(id_1, (id_2), id_1 + 1'h0, 1, id_7, 1, 1 - 1);
endmodule
