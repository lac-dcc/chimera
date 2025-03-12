// Seed: 275853069
module module_0 (
    id_1
);
  input wire id_1;
  wire id_2;
endmodule
module module_1 #(
    parameter id_1 = 32'd26
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  not primCall (id_4, id_3);
  inout wire _id_1;
  module_0 modCall_1 (id_4);
  tri [id_1 : {  1  ,  -1 'b0 }] id_5 = 1;
endmodule
module module_2 (
    input supply0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    output logic id_4,
    input supply0 id_5
);
  bit  id_7;
  wire id_8;
  wire id_9;
  always begin : LABEL_0
    id_7 = id_1;
    fork
      id_4 <= 1;
      id_10;
    join
  end
  module_0 modCall_1 (id_8);
endmodule
