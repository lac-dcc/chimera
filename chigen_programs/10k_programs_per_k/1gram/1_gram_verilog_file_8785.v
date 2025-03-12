// Seed: 2029960294
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  union packed {logic id_4;} id_5;
  assign module_2.id_8 = 0;
endmodule
module module_1 (
    output wor id_0,
    output supply0 id_1,
    input wire id_2,
    output wire id_3,
    output wor id_4,
    input wor id_5,
    input wire id_6,
    input tri id_7,
    output supply1 id_8
);
  logic id_10;
  ;
  xnor primCall (id_4, id_7, id_5, id_10, id_6, id_2);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10
  );
endmodule
module module_2 #(
    parameter id_8 = 32'd67
) (
    id_1,
    id_2,
    id_3,
    id_4[id_8 : 1],
    id_5,
    id_6,
    id_7#(
        ._id_8(1'b0),
        .id_9 (-1)
    ),
    id_10,
    id_11
);
  input wire id_9;
  output wire _id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_10
  );
  output logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_10 = !id_6;
endmodule
