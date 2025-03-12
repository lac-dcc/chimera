// Seed: 1306810840
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  input logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_10;
  wire  id_11;
  assign id_10 = id_5;
  assign id_10 = id_3;
endmodule
module module_0 #(
    parameter id_7 = 32'd92
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    module_1,
    id_8
);
  input wire id_8;
  inout wire _id_7;
  output wire id_6;
  inout wire id_5;
  input logic [7:0] id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  tri1 id_9;
  wire id_10;
  case ((-1))
    "": begin : LABEL_0
      wire id_11[-1 : id_7];
      begin : LABEL_1
        wire id_12;
      end
    end
    default:
    begin : LABEL_2
      assign id_10 = -1;
      assign id_9  = id_4[-1'b0] >= id_4 && -1'd0;
    end
  endcase
  wire id_13;
  module_0 modCall_1 (
      id_13,
      id_5,
      id_10,
      id_9,
      id_9,
      id_5,
      id_4,
      id_10,
      id_13
  );
  assign id_6 = id_7;
endmodule
