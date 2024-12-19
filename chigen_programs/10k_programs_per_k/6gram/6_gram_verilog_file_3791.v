// Seed: 2462179004
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = 1;
  wor id_8 = 1'h0;
  assign id_6 = id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  specify
    (id_6 => id_7) = 1;
    (id_8 => id_9) = 0;
    specparam id_10 = 1;
  endspecify
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_1
  );
  assign modCall_1.id_7 = 0;
  always @(posedge 1 or id_7) begin : LABEL_0
    force id_5 = id_6;
  end
endmodule
