// Seed: 2868202574
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
  output wire id_2;
  assign module_1.id_7 = 0;
  output wire id_1;
  wire id_6 = id_5;
endmodule
module module_1 #(
    parameter id_12 = 32'd24,
    parameter id_4  = 32'd72,
    parameter id_5  = 32'd22
) (
    output wire id_0,
    output tri1 id_1,
    output logic id_2,
    input tri1 id_3
    , _id_12,
    input uwire _id_4,
    input wor _id_5,
    input wire id_6,
    input wand id_7,
    input uwire id_8,
    input wire id_9,
    input supply0 id_10
);
  parameter id_13 = 1;
  parameter id_14 = id_13 == -1;
  always @(posedge id_5) begin : LABEL_0
    id_2 = 1'b0;
  end
  parameter id_15 = id_14[-1'b0&&id_5-:id_12&&id_4];
  module_0 modCall_1 (
      id_15,
      id_15,
      id_15,
      id_13,
      id_13
  );
  localparam id_16 = id_14;
  wire id_17;
  assign id_1 = -1;
endmodule
