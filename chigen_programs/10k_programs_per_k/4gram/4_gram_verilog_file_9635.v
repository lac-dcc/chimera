// Seed: 1586288988
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  time id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2,
      id_3
  );
endmodule
module module_2 #(
    parameter id_19 = 32'd79,
    parameter id_20 = 32'd21
) (
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
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  id_15 :
  assert property (@(posedge 1'b0 >= 1 - 1) id_15)
  else $display;
  supply1 id_16;
  assign id_3 = id_16;
  always @(posedge id_16 or 1);
  module_0 modCall_1 (
      id_16,
      id_9,
      id_15,
      id_11,
      id_14
  );
  wire id_17;
  for (id_18 = 1; id_11; id_10 = id_14) begin : LABEL_0
    defparam id_19.id_20 = id_13;
  end
endmodule
