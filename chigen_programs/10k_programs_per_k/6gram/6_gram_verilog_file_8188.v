// Seed: 2670468898
module module_0;
  always @* id_1 <= 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0();
  reg id_7;
  reg id_8 = id_8;
  logic [7:0] id_9;
  initial begin
    id_8 = 1;
    case (id_9[1'd0] + 1)
      1 == id_4: id_6 = 1;
      1: begin
        fork
          id_10;
          $display(id_8, id_7);
        join
      end
      id_8: begin
        id_6 <= id_7;
        id_8 = id_6;
        $display(1, ~id_3);
      end
    endcase
    wait (id_6);
  end
endmodule
