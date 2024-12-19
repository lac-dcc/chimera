// Seed: 819793997
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6, id_7, id_8, id_9, id_10, id_11;
  wire id_12;
  wire id_13;
  wire id_14;
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
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_6 = id_4;
  always @(id_9 == 1 or posedge 1) begin : LABEL_0
    case (id_1)
      1: id_2 <= 1'b0;
      id_4: id_2 = 1;
      1: begin : LABEL_0
        id_6 <= 1 / 1;
      end
      1'b0:
      if (1'h0) begin : LABEL_0
        id_10 <= #1 1;
      end else id_2 <= 1;
    endcase
  end
  module_0 modCall_1 (
      id_7,
      id_3,
      id_5,
      id_9
  );
  id_11 :
  assert property (@(posedge 1) 1)
  else $display(1'b0, 1);
  assign id_2 = id_4;
endmodule
