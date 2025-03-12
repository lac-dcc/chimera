// Seed: 3981613022
module module_0 #(
    parameter id_12 = 32'd12,
    parameter id_14 = 32'd26,
    parameter id_5  = 32'd86,
    parameter id_7  = 32'd94
) (
    input tri id_0,
    input wire id_1,
    input tri0 id_2,
    input tri id_3,
    input uwire id_4,
    input tri0 _id_5,
    input tri1 id_6,
    output supply1 _id_7,
    input tri0 id_8
);
  always
    if (1) begin : LABEL_0
      if (1)
        assert (id_4);
        else if ((1 == -1'b0)) $unsigned(73);
      ;
    end
  bit id_10;
  wire id_11, _id_12, id_13;
  rpmos (1'd0 + -1, 1, -1, 1);
  always begin : LABEL_1
    id_10 <= 1 - id_8 == -1;
  end
  parameter id_14 = 1 - 1;
  wire id_15;
  wire id_16;
  struct packed {
    logic [-1 : id_14] id_17;
    logic [id_7  |  (  id_5  ) : -1] id_18;
    logic id_19;
  } [!  id_12 : -1] id_20;
  integer id_21;
  parameter id_22 = -1;
  wire id_23;
endmodule
module module_1 #(
    parameter id_14 = 32'd33,
    parameter id_4  = 32'd87,
    parameter id_6  = 32'd88
) (
    output wand  id_0,
    input  wand  id_1,
    output tri   id_2,
    input  wand  id_3,
    input  wire  _id_4
    , id_12,
    output wor   id_5,
    input  wand  _id_6,
    input  tri0  id_7,
    input  tri   id_8,
    input  uwire id_9,
    input  wor   id_10
);
  assign id_12 = 1;
  assign #id_13 id_12 = -1;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_1,
      id_9,
      id_7,
      id_13,
      id_10,
      id_13,
      id_10
  );
  wire [id_4  &  id_6 : -1] _id_14;
  wire id_15;
  assign id_0 = id_13;
  parameter id_16 = 1;
  parameter id_17 = id_16;
  struct packed {
    logic id_18;
    logic id_19;
  } [1 : -1] id_20;
  ;
  wire id_21;
  assign id_5 = id_13 - id_3;
  wire id_22;
  wire [1 : 1] id_23;
  always id_20 <= id_23;
endmodule
