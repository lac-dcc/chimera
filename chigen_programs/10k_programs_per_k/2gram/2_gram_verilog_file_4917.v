// Seed: 1928365692
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output supply1 id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd45
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  input wire _id_2;
  inout wire id_1;
  parameter [1 : id_2] id_6 = 1;
  assign id_4 = id_1;
endmodule
module module_2 #(
    parameter id_6 = 32'd92,
    parameter id_7 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output reg id_16;
  inout logic [7:0] id_15;
  input wire id_14;
  inout tri id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire _id_7;
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_10 = id_12;
  logic id_17;
  ;
  wire id_18;
  assign #(id_4) id_10 = -1'b0;
  id_19 :
  assert property (@(posedge 1) id_15)
  else begin : LABEL_0
    if (-1'b0) @(1 + id_15[id_7]) id_16 <= 1;
  end
  assign id_13 = 1;
  logic [id_6 : 1 'b0] id_20;
  module_0 modCall_1 (
      id_20,
      id_17,
      id_18
  );
endmodule
