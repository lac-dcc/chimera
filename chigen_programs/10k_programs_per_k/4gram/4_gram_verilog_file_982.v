// Seed: 3659205649
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = {id_6 - 1, 1, id_7, 1, id_9, id_8, module_0[1], 1, 1};
  initial id_2 = id_10 & 1;
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    module_1,
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
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_14 = id_9;
  xnor (id_8, id_5, id_9, id_6, id_12, id_10, id_1, id_7, id_4, id_14);
  module_0(
      id_1, id_9, id_6, id_14, id_10, id_14, id_7, id_14, id_6, id_5
  );
  for (id_15 = (id_12[1'b0] !=? 1); id_10; id_1 = id_6) begin
    assign id_8[1] = 1;
    tri id_16 = id_13++ ? id_1 : 1;
  end
endmodule
