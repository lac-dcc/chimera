// Seed: 1592364188
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    .id_20(id_6),
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  input wire id_18;
  output wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  integer id_21, id_22, id_23;
  generate
    assign id_12 = 'd0;
  endgenerate
  assign id_22 = id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_6 :
  assert property (@(posedge 1) id_2)
  else $display(id_1,, id_3, 1 | 1, 1);
  generate
    for (id_7 = id_5; id_6; id_1 = 1) begin : id_8
      wire id_9;
    end
  endgenerate
  module_0(
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_2,
      id_2,
      id_3,
      id_6,
      id_1,
      id_3,
      id_7,
      id_1,
      id_2,
      id_7,
      id_2,
      id_6,
      id_3
  );
endmodule
