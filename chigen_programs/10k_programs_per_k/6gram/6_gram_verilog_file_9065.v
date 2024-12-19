// Seed: 1973126220
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
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge 1) begin : LABEL_0
    case (1'd0)
      id_2: id_11 = 1;
      1: id_1 = id_3;
      default: ;
    endcase
    wait (1'd0);
    begin : LABEL_0
      id_4 <= id_9 ? 1'h0 : 1;
    end
  end
endmodule
module module_1;
  wor id_1;
  reg id_2;
  reg id_3 = id_1 && 1 == 1'b0;
  logic [7:0] id_4;
  always @(id_1 or posedge 1)
    if (1) id_2 <= id_3;
    else id_4[1 : 1] <= id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
