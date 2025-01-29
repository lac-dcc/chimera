// Seed: 2264937332
module module_0 #(
    parameter id_9 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = id_2;
  always_latch
    case (1)
      id_1: $display();
      id_2: id_3 = id_1 - 1'b0;
    endcase
  id_8(
      .id_0(1'b0 + id_1), .id_1(-1), .id_2(id_4 - 1), .id_3(-1 <-> 1'b0), .id_4(id_3)
  ); defparam id_9 = 1;
  assign module_1.type_10 = 0;
  wire id_10;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input tri0 id_2,
    output wor id_3,
    input tri1 id_4,
    input tri1 id_5,
    input uwire id_6,
    input tri1 id_7,
    output tri0 id_8,
    input supply1 id_9,
    input wor id_10,
    input supply1 id_11,
    input supply1 id_12,
    output supply1 id_13,
    input uwire id_14,
    input tri id_15,
    id_18,
    input tri1 id_16
);
  integer id_19;
  integer id_20 (
      .id_0(-1),
      .id_1(id_14),
      .id_2(-1'h0),
      .id_3(1)
  );
  wire id_21, id_22;
  wire id_23;
  module_0 modCall_1 (
      id_21,
      id_23,
      id_21,
      id_21,
      id_21,
      id_23,
      id_22
  );
  assign id_22 = id_22;
  assign id_18 = -1;
endmodule
