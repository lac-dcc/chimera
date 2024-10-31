// Seed: 712133489
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
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_17(
      .id_0(id_4), .id_1(1), .id_2(1 + 1 - 1'd0), .id_3(1), .id_4(1)
  );
endmodule
program module_1 (
    input logic id_0,
    input logic id_1,
    input logic id_2,
    input tri   id_3
);
  always_latch
    case (1'b0)
      1: id_5 = id_1;
      id_2:
      repeat (1)
        case (1'b0 - 1 == id_0)
          id_2 !=? 1: id_5 = id_1;
          id_2: $display(1, 1);
          default: id_5 <= "";
        endcase
      default: id_5 <= id_2;
    endcase
  reg id_6;
  assign id_5 = 1'b0;
  wire id_7;
  initial begin
    id_6 <= id_0;
    id_6 <= 1 && (id_6);
  end
  module_0(
      id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7
  );
endprogram
