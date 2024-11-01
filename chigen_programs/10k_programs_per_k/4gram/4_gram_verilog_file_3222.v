// Seed: 2918818715
module module_0 ();
  wire id_1;
  wire id_2;
  wire id_3;
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
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always
    repeat (id_6)
      @(id_6 or id_13) begin
        id_9 = "";
        case (id_11 - 1)
          1: id_8 <= 1'd0;
          default: id_11 <= id_11;
        endcase
        fork
          id_2 = id_2;
          disable id_15;
        join_any
      end
  uwire id_16 = 1;
  module_0();
endmodule
