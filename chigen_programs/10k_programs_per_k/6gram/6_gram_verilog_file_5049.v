// Seed: 3075654701
module module_0 #(
    parameter id_2 = 32'd26,
    parameter id_6 = 32'd59
) ();
  logic [7:0][-1 : 1] id_1;
  wire _id_2;
  logic id_3;
  wire id_4;
  ;
  logic id_5, _id_6;
  always @(posedge id_6) begin : LABEL_0
    assert (-1);
  end
  assign module_1.id_7 = 0;
  logic id_7 = id_5;
  id_8(
      id_4
  );
  integer [-1 : id_2] id_9 = 1;
  wire id_10;
  assign id_1[id_6] = id_7;
  wire id_11;
  assign id_9 = id_8;
  assign id_1 = id_6;
endmodule
module module_1 (
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
    id_11,
    id_12
);
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout reg id_7;
  input wire id_6;
  inout wire id_5;
  module_0 modCall_1 ();
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_13;
  ;
  initial begin : LABEL_0
    id_7 = id_12;
    wait (1'b0);
  end
endmodule
