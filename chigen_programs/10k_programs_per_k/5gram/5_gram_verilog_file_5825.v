// Seed: 3002822084
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
    id_14
);
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_15 = id_1;
  assign id_11 = id_1;
  wire id_16;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin
    wait (1);
  end
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_2, id_3, id_5, id_4, id_2, id_3, id_2, id_4, id_4
  );
  final $display(id_4);
  wire id_6;
  buf (id_4, id_2);
endmodule
