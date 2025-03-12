// Seed: 2316242659
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout supply0 id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = ((id_2)) == 1'd0;
endmodule
module module_1 #(
    parameter id_4 = 32'd95
) (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2
  );
  output wire id_1;
  wire _id_4;
  wire [(  id_4  ) : 1] id_5;
endmodule
module module_0 #(
    parameter id_1 = 32'd76,
    parameter id_5 = 32'd41
) (
    _id_1,
    id_2,
    id_3,
    module_2,
    _id_5,
    id_6
);
  input wire id_6;
  inout wire _id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire _id_1;
  parameter id_7 = -1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6
  );
  parameter id_8 = id_7;
  logic id_9;
  ;
  wire [-1 : ""] id_10;
  assign id_10 = id_9[-1'b0 : id_1-1'd0];
  logic [id_5 : -1  >= ""] id_11 = id_1;
  wire id_12;
  ;
  id_13 :
  assert property (@(posedge (1)) id_8)
  else $clog2(4);
  ;
  wire id_14;
  ;
endmodule
