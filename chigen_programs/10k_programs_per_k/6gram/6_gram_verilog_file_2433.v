// Seed: 820052014
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_2;
  assign id_3 = 1;
  assign id_1 = id_1;
  supply0 id_7;
  assign id_7 = id_4 ? id_4 : (1'b0 == 1) ? 1 : 1 == 1'b0;
  wire id_8;
  supply1 id_9;
  specify
    (id_10 => id_11) = (1  : id_7  : id_3, 1'b0 : id_6  : id_5);
    (negedge id_12 => (id_13 +: id_6)) = (id_9  : 1  : 1'h0, 1);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_9 = 0;
endmodule
