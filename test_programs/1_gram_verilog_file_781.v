// Seed: 3990549896
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4#(
        .id_5(-1),
        .id_6(1)
    ),
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_14 = !id_13 == id_2;
  initial begin : LABEL_0
    id_13 = 1;
  end
  assign id_13 = id_13 ? -1'h0 : id_8;
  parameter id_15 = -1;
  assign id_7 = (id_13 | id_2);
  assign id_3 = 1;
endmodule
module module_1 (
    output uwire   id_0,
    output supply1 id_1
);
  tri1 id_3;
  supply1 id_4;
  tri1 id_5, id_6 = id_4, id_7, id_8 = 1, id_9;
  assign id_0 = id_3;
  id_10(
      id_5, id_7, id_7, -1'b0
  );
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_7,
      id_7,
      id_9,
      id_7,
      id_11,
      id_10,
      id_8,
      id_10,
      id_10,
      id_10
  );
  assign modCall_1.id_2 = 0;
  wire id_12;
  wire id_13, id_14, id_15;
endmodule
