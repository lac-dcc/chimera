// Seed: 2242339421
module module_0 #(
    parameter id_0 = 32'd94
) (
    output uwire _id_0
);
  struct packed {
    struct packed {id_2 id_3;} [id_0 : 1] id_4;
    logic [id_0 : id_0] id_5;
    logic [id_0 : 1] id_6;
  } id_7;
  id_8(
      1
  );
  uwire id_9 = -1'd0;
  assign id_7.id_5 = id_9;
  wire id_10;
endmodule
module module_1 #(
    parameter id_1  = 32'd83,
    parameter id_10 = 32'd23,
    parameter id_3  = 32'd36,
    parameter id_4  = 32'd57,
    parameter id_7  = 32'd58,
    parameter id_8  = 32'd26
) (
    _id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire _id_4;
  output wire _id_3;
  inout wire id_2;
  output wire _id_1;
  wire _id_7;
  wire _id_8;
  ;
  assign id_7 = id_7;
  wire [id_8 : id_7] id_9;
  generate
    logic [id_1 : id_3] _id_10 = -1'b0;
  endgenerate
  wire [id_10 : id_4] id_11;
  module_0 modCall_1 (id_7);
endmodule
