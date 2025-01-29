// Seed: 486475971
module module_0 (
    id_1
);
  output wire id_1;
  parameter id_2 = -1'b0;
  assign (strong0, supply1) id_1 = id_2;
  assign module_2.type_38 = 0;
  integer id_3, id_4;
  parameter module_0 = id_4;
  wire id_6;
  genvar id_7;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3, id_4, id_5, id_6;
  wire id_7, id_8;
  nand primCall (id_2, id_7, id_6, id_1, id_5, id_4);
  module_0 modCall_1 (id_3);
endmodule
module module_2 (
    input tri0 id_0,
    input wand id_1,
    input logic id_2,
    output wor id_3,
    input tri0 id_4,
    input logic id_5,
    input uwire id_6,
    input supply1 id_7,
    output logic id_8
);
  assign id_3 = -1 < id_0;
  supply1 id_10;
  logic   id_11;
  assign id_3 = -1;
  parameter id_12 = 1;
  assign id_11 = 1;
  pmos (.id_0(1));
  id_13(
      1'b0, {id_10}, id_10
  );
  wire id_14;
  wire id_15;
  logic id_16, id_17;
  wire id_18;
  localparam id_19 = 1;
  id_20(
      1, 1, id_19 ^ 1 ? 1 : id_17 | 1 > -1, id_11, id_5, id_16
  ); id_21(
      .id_0(-1), .id_1(1), .id_2(-1), .id_3(id_3)
  );
  generate
    string id_22, id_23, id_24;
  endgenerate
  if (id_12) wire id_25, id_26;
  else string id_27;
  supply1 id_28;
  wire id_29;
  wire id_30;
  id_31 :
  assert property (@(posedge 1'h0) 1) id_8 <= 1;
  id_32(
      -1, 1, id_8, 1 + id_17, id_31
  );
  assign id_3 = ~1'b0;
  module_0 modCall_1 (id_14);
  always_comb id_28 = -1'd0 - -1;
  id_33(
      "", id_24
  );
  wire id_34, id_35, id_36;
endmodule
