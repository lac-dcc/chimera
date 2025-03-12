// Seed: 4213367274
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4#(
        .id_5(1),
        .id_6((-1)),
        .id_7(-1),
        .id_8(-1),
        .id_9(1)
    ),
    id_10,
    id_11
);
  input logic [7:0] id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign {id_11, {id_6[-1]{id_7}}} = id_9;
endmodule
module module_1 #(
    parameter id_10 = 32'd90,
    parameter id_3  = 32'd47,
    parameter id_4  = 32'd70
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10
);
  inout wire _id_10;
  output wire id_9;
  output wire id_8;
  inout logic [7:0] id_7;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_1,
      id_8,
      id_2
  );
  inout wire id_6;
  input wire id_5;
  input wire _id_4;
  inout wire _id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  if (1) begin : LABEL_0
    always begin : LABEL_1
      $clog2(77);
      ;
    end
  end else wire [1 : id_10  .  id_4] id_11;
  assign id_6 = id_3;
  assign id_7[1] = id_3 | id_5;
  always id_2[id_3] <= -1 & 1 <-> -1;
  assign id_1 = (id_3);
endmodule
