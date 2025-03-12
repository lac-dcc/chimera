// Seed: 2309918407
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  localparam id_5 = "";
  wire id_6;
  wire id_7;
  ;
  always @(negedge id_7) id_3 -= id_5;
  always @(*) begin : LABEL_0
    assume (id_2);
    cover (id_6);
  end
  parameter id_8 = id_5;
endmodule
module module_1 (
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
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  inout logic [7:0] id_16;
  input wire id_15;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_3,
      id_1
  );
  output wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(id_13 or ~id_12) id_16[1 : 1] += id_10;
endmodule
