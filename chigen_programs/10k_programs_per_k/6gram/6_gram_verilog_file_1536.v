// Seed: 3859129495
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_6, id_7;
  always @(1'b0 ^ id_7 or id_2) begin : LABEL_0
    id_2 = 1;
    id_5 = 1 == id_5;
    id_7 <= 1'h0;
    $display;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_2;
  wire id_5;
  specify
    (id_6 => id_7) = 1;
  endspecify
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_1,
      id_6
  );
endmodule
