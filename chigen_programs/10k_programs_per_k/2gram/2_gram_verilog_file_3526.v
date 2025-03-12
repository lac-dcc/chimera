// Seed: 1027467958
module module_0 (
    input  tri   id_0,
    output wire  id_1,
    output tri   id_2,
    input  tri0  id_3,
    output uwire id_4,
    input  tri0  id_5
);
  wire id_7;
  ;
endmodule
module module_1 (
    input tri id_0,
    output uwire id_1,
    input supply1 id_2,
    input tri id_3,
    input tri0 id_4,
    input tri id_5,
    output tri1 id_6,
    output wire id_7,
    output uwire id_8
);
  assign id_8 = ((id_4)) && 1'b0 && 1;
  assign id_7 = (-1);
  nor primCall (id_7, id_2, id_10, id_4, id_3);
  task id_10;
    begin : LABEL_0
      return -1'b0;
      id_10 <= 1;
    end
  endtask
  module_0 modCall_1 (
      id_5,
      id_7,
      id_1,
      id_4,
      id_8,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
