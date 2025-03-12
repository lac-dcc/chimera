// Seed: 3857468667
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
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = id_10;
endmodule
module module_1 #(
    parameter id_5 = 32'd4,
    parameter id_7 = 32'd33
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    _id_7
);
  inout wire _id_7;
  output reg id_6;
  input wire _id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
  input logic [7:0] id_2;
  output wire id_1;
  always
  fork
    logic [id_7 : id_5] id_8;
    #(-1);
    begin : LABEL_0
      case (-1'b0 != id_8)
        default: begin : LABEL_1
          if (1 === -1) id_6 <= -1;
          else $clog2(92);
          ;
        end
      endcase
    end
  join : SymbolIdentifier
endmodule
