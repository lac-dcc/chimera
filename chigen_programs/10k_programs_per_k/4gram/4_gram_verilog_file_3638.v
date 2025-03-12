// Seed: 1221663917
module module_0 #(
    parameter id_4 = 32'd36
) (
    input  tri1  id_0,
    output uwire id_1
    , _id_4,
    output wor   id_2
);
  logic id_5;
  ;
  struct packed {
    struct packed {
      logic [-1  /  1 : 1] id_6;
      logic [-1 'b0 : -1 'b0] id_7;
    } [id_4 : -1] id_8;
  } [-1 : 1] id_9 = -1;
  wire id_10;
  reg id_11;
  always @(posedge 1) begin : LABEL_0
    id_11 = 1;
  end
  id_12 :
  assert property (@(posedge (id_4)) id_9.id_7)
  else $clog2(62);
  ;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    inout supply1 id_5,
    input wire id_6,
    input uwire id_7,
    input supply0 id_8,
    input wor id_9,
    output tri0 id_10,
    output uwire id_11,
    input wand id_12,
    input tri1 id_13,
    output supply0 id_14
    , id_25,
    input tri0 id_15,
    input wire id_16,
    output wire id_17,
    output uwire id_18,
    output tri id_19,
    input tri id_20,
    input tri0 id_21
    , id_26,
    input tri1 id_22,
    output tri0 id_23
);
  assign id_10 = id_12;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule
