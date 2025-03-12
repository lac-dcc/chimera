// Seed: 3482788439
module module_0 (
    input  supply0 id_0,
    output logic   id_1
);
  always id_1 = #1 id_0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wire id_0,
    output logic id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply0 id_4,
    output tri1 id_5,
    input wire id_6
);
  reg id_8;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign id_1 = id_8;
  reg id_9;
  ;
  and primCall (id_5, id_0, id_6, id_2, id_4, id_8, id_3);
  initial begin : LABEL_0
    id_1 <= ({-1, -1'b0});
    id_8 = id_4 == id_3;
    id_9 <= id_3;
  end
endmodule
