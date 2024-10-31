// Seed: 1985961034
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
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  supply0 id_16;
  wire id_17;
  assign id_1 = id_11;
  wand id_18 = id_16 ^ 1'b0;
  tri0 id_19 = 1'b0;
  specify
    (posedge id_20 => (id_21 +: 1)) = (1'h0 : 1 == id_19  : id_11, 1  : id_11++: 1);
    (id_22 => id_23) = (id_15  : id_21  : 1, 1  : id_3 == 1  : 1);
    $setup(posedge id_24, id_25, 1);
  endspecify
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
    id_10
);
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_11;
  wire id_12, id_13;
  module_0(
      id_12,
      id_12,
      id_8,
      id_5,
      id_12,
      id_13,
      id_9,
      id_13,
      id_11,
      id_8,
      id_10,
      id_11,
      id_6,
      id_8,
      id_8
  );
  wire id_14;
  assign id_13 = id_1[1];
endmodule
