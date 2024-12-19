// Seed: 4138766601
module module_0 (
    input tri0 id_0
    , id_2
);
  initial begin : LABEL_0$display
    ;
  end
  assign module_2.id_2 = 0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1
    , id_5,
    input wor id_2,
    output supply1 id_3
);
  reg id_6, id_7;
  wire id_8;
  wire id_9;
  wire id_10;
  module_0 modCall_1 (id_1);
  always @(posedge id_5 or posedge 1) id_5 <= id_7;
  nand primCall (id_0, id_9, id_5, id_2);
endmodule
module module_2 (
    output supply0 id_0,
    input supply0 id_1,
    output supply0 id_2,
    output supply1 id_3
    , id_8,
    input tri id_4,
    input wire id_5,
    output logic id_6
);
  initial begin : LABEL_0
    id_6 <= id_4 & 1;
    fork
      id_9;
    join
  end
  module_0 modCall_1 (id_4);
endmodule
