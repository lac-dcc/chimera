// Seed: 4130997921
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
endmodule
module module_1 #(
    parameter id_0  = 32'd21,
    parameter id_1  = 32'd19,
    parameter id_10 = 32'd84,
    parameter id_11 = 32'd37,
    parameter id_3  = 32'd98,
    parameter id_5  = 32'd24
) (
    input  tri  _id_0,
    output tri1 _id_1,
    input  tri0 id_2,
    output tri0 _id_3
);
  wire _id_5;
  logic [7:0] id_6;
  logic [id_3 : 1 'b0 +  (  id_0  )] id_7, id_8 = id_5;
  wire  id_9;
  logic _id_10;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9
  );
  parameter id_11 = 1 ? -1 : 1;
  logic id_12;
  assign id_6[id_10] = id_10;
  id_13 :
  assert property (@(posedge id_10) id_6 == id_0)
  else $signed(id_11);
  ;
  wire id_14;
  localparam id_15 = id_11;
  defparam id_11.id_11 = -1'b0;
endmodule
