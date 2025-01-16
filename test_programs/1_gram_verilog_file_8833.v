// Seed: 102206163
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  tri id_16, id_17, id_18;
  localparam id_19 = 1;
  assign id_12 = -1'b0 + 1 == "" ? -1 : id_8.id_17;
  assign id_13 = id_7;
  assign id_12 = 1 - id_5;
  always id_15 = 1;
  assign id_12 = id_5;
  wire id_20, id_21;
  wire id_22;
  wire id_23;
endmodule
module module_1 (
    inout  wire id_0,
    input  tri1 id_1,
    output wire id_2,
    input  tri  id_3
);
  wire id_5;
  for (id_6 = -1'd0; id_0 < -1; id_5 = id_5) assign id_0 = id_6;
  notif1 primCall (id_0, id_6, id_1);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  assign modCall_1.id_15 = 0;
endmodule
