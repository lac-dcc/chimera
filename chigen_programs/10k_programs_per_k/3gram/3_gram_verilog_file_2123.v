// Seed: 876069519
module module_0;
  reg id_1;
  always_latch #1
    case (id_1)
      id_1: id_1 = #1 id_1;
      id_1: begin
        id_1 = id_1;
      end
      default: begin
        if (1'b0) id_1 <= id_1;
        else begin
          id_1 <= 1;
          id_1 = 1;
        end
        fork : id_2
          id_1 <= 1;
          id_2 = 1 * id_1;
          id_2 <= 1;
          id_2 = id_1;
          id_1 <= id_2;
        join
      end
    endcase
  assign id_1 = id_1;
  wire id_3;
  initial begin : id_4
    id_4 <= 1;
  end
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
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_13;
  assign id_1 = 1;
  wire id_14;
  module_0();
endmodule
