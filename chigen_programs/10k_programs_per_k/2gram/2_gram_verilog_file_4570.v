// Seed: 3460626942
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input tri id_4
);
  wire id_6;
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    output tri id_2,
    input tri0 id_3,
    output supply0 id_4,
    output wor id_5,
    input supply1 id_6,
    input uwire id_7,
    output wor id_8
    , id_11,
    input supply1 id_9
);
  initial begin : LABEL_0
  end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_7
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 #(
    parameter id_13 = 32'd87
) (
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
  input wire id_11;
  output wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  parameter id_12 = 1'b0;
  parameter id_13 = id_12;
  assign {id_3, -1, id_9[-1'b0&&-1&&-1&&id_13]} = -1;
endmodule
module module_3 #(
    parameter id_13 = 32'd29
) (
    id_1#(
        .id_2(id_3),
        .id_4(id_5),
        .id_6(-1'h0),
        .id_7(1 / 1)
    ),
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_6;
  output logic [7:0] id_5;
  module_2 modCall_1 (
      id_11,
      id_6,
      id_10,
      id_9,
      id_9,
      id_1,
      id_10,
      id_10,
      id_8,
      id_10,
      id_10
  );
  output wire id_4;
  output wire id_3;
  input logic [7:0] id_2;
  inout wire id_1;
  assign id_5[1] = -1;
  tri0 _id_13 = 1;
  wire id_14;
  always begin : LABEL_0
    $unsigned(66);
    ;
  end
  assign id_8 = id_1;
  specify
    (id_15 => id_16) = (1  : (-1) ^ id_13  : id_2[-1] == id_8[id_13 : 'h0], id_14);
    (id_17[1] => id_18) = 1;
    $setup(posedge id_19, id_20, ~-1);
    $setup(negedge id_21, id_22, id_17);
  endspecify
endmodule
