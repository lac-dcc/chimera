// Seed: 100279759
module module_0 (
    output wire id_0,
    input supply1 id_1,
    input supply0 id_2,
    output supply0 id_3,
    output wire id_4,
    input tri1 id_5,
    output supply0 id_6,
    input uwire id_7,
    input supply1 id_8
);
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    output wor id_2,
    input wor id_3,
    output supply1 id_4,
    inout supply1 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_3 #(
    parameter id_5 = 32'd94
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output logic [7:0] id_9;
  output wire id_8;
  inout wire id_7;
  module_2 modCall_1 (
      id_12,
      id_7,
      id_7,
      id_7,
      id_7,
      id_10,
      id_11,
      id_8,
      id_2,
      id_8,
      id_2
  );
  input wire id_6;
  and primCall (id_2, id_12, id_1, id_7, id_6);
  input wire _id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_9[id_5] = id_7;
endmodule
