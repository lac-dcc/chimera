// Seed: 3301686006
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
    id_12
);
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13;
  assign id_1 = 1;
  wire id_14;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7 = id_3;
  wire id_8 = id_3;
  wire id_9 = id_9;
  wire id_10;
  wire id_11;
  module_0(
      id_1, id_7, id_10, id_9, id_7, id_10, id_11, id_8, id_3, id_11, id_11, id_8
  );
  wire id_12;
  always @(posedge 1) begin
    $display(1);
    force id_10 = 1 !== 1;
  end
endmodule
