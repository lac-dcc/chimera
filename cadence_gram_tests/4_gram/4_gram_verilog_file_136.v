// Seed: 3605457827
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
    id_11
);
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  supply0 id_12 = id_5;
  specify
    $width(posedge id_13 &&& id_5, !id_9);
    (posedge id_14 => (id_15  : id_14)) = ($realtime : 1'b0 : 1'h0, id_9  : id_12  : -1);
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
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_9 = id_12;
  wire id_13;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_13,
      id_5,
      id_12,
      id_6,
      id_14,
      id_4,
      id_2,
      id_13
  );
  wire id_15;
endmodule
