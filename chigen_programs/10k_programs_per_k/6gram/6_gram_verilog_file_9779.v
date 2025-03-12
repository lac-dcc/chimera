// Seed: 3591369545
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_5;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_5
  );
  output wire id_2;
  output wire id_1;
  wire id_6;
endmodule
module module_2 #(
    parameter id_0 = 32'd82
) (
    input tri1 _id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wire id_4,
    output wor id_5,
    input tri1 id_6,
    output wor id_7
);
  logic [id_0 : 1] id_9, id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_9
  );
  assign id_10 = -1;
  xnor primCall (id_7, id_4, id_6);
endmodule
