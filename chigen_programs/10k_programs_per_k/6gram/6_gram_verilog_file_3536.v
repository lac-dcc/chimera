// Seed: 1439979725
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_12 = 32'd62,
    parameter id_3  = 32'd68
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output supply0 id_6;
  output supply0 id_5;
  output wire id_4;
  input wire _id_3;
  output reg id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_10,
      id_10,
      id_10,
      id_1
  );
  wire _id_12;
  ;
  wire [-1 : 1 'd0] id_13;
  wire id_14;
  always begin : LABEL_0
    if (1) begin : LABEL_1
      id_2 <= ~id_8;
      if (-1 == 1) disable id_15;
    end
  end
  wire id_16;
  assign id_5 = 1;
  struct packed {id_17 id_18;} id_19;
  ;
  logic [(  -1 'b0 ) : 1] id_20;
  wire id_21;
  assign id_6 = id_19 ? -1 : id_13 !== id_20[1 : 1];
  wire id_22;
  wire [id_3 : id_12] id_23;
  assign id_10 = id_19;
  logic id_24;
endmodule
