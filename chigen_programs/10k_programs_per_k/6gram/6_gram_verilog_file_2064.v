// Seed: 379360387
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout uwire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5 = -1;
  wire [-1 : 1] id_6;
  logic id_7 = 1'b0;
  assign id_3 = 1;
  wire  id_8;
  logic id_9;
  ;
  always id_7 = #(-1) id_6;
endmodule
module module_1 #(
    parameter id_2  = 32'd47,
    parameter id_24 = 32'd24
) (
    id_1,
    _id_2,
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
  output wire id_14;
  output wire id_13;
  output wire id_12;
  inout logic [7:0] id_11;
  inout tri1 id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  inout wire _id_2;
  inout wire id_1;
  logic [7:0][-1 'b0 : 1]
      id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, _id_24, id_25, id_26, id_27;
  module_0 modCall_1 (
      id_1,
      id_10,
      id_6,
      id_8,
      id_14
  );
  assign id_10 = 1 ? id_11[-1] : -1 ? 1 : id_21[id_2+id_24 :-1];
  assign id_4[""] = id_3 ? -1'b0 : id_17;
  assign id_20 = id_5;
endmodule
