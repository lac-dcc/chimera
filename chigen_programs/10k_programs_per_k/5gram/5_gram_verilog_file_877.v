// Seed: 1683987173
module module_0 (
    input supply1 id_0,
    input supply1 id_1
);
  wire id_3;
  ;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1
    , id_5,
    input  uwire id_2,
    input  wand  id_3
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0
  );
endmodule
module module_2 (
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
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  assign id_1[-1] = 1;
  assign id_5 = id_3;
  assign id_2 = id_3;
endmodule
module module_0 #(
    parameter id_18 = 32'd19
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    module_3,
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
    _id_18,
    id_19,
    id_20,
    id_21
);
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  inout wire _id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output logic [7:0] id_12;
  output wire id_11;
  output wire id_10;
  module_2 modCall_1 (
      id_12,
      id_11,
      id_13,
      id_4,
      id_10,
      id_5,
      id_3
  );
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_12[(-1)] = 1;
  logic [1 : -1] id_22;
  specify
    (negedge id_23 => (id_24 +: {-1{id_4}})) = (1, id_17 - id_6[id_18] : -1  : 1'b0);
  endspecify
endmodule
