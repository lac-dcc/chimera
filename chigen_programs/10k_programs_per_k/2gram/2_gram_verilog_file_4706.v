// Seed: 1022378182
module module_0 #(
    parameter id_17 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7#(
        .id_8(id_9#(
            .id_10(id_11),
            .id_12((1))
        ))
    ),
    id_13,
    id_14,
    id_15,
    id_16,
    _id_17
);
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_18;
  assign id_6 = id_13;
  initial begin : LABEL_0
    id_13 <= 1'h0;
  end
  wire id_19;
  assign id_14[id_17 :-1'b0] = 1 && id_18;
endmodule
module module_1 #(
    parameter id_0 = 32'd61
) (
    input  tri   _id_0,
    input  tri   id_1,
    output tri0  id_2,
    output uwire id_3,
    input  wor   id_4,
    input  tri   id_5,
    output tri0  id_6
);
  assign id_3 = id_5;
  logic [id_0 : -1  &&  1] id_8;
  wire id_9;
  assign id_2 = 1 + id_4;
  assign id_9 = id_1;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_8,
      id_9,
      id_8,
      id_8,
      id_9,
      id_8,
      id_8,
      id_8,
      id_8,
      id_9
  );
endmodule
