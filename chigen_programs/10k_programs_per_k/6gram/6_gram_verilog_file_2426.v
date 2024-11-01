// Seed: 3224120599
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4[1] = id_2;
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
    id_11
);
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [7:0] id_12;
  module_0(
      id_8, id_4, id_8, id_12, id_6, id_4, id_4
  );
  always
    case (1)
      id_3: id_5 = 1;
      {1{id_10(id_6, 1)}} : id_12 = id_11;
      1'b0: id_9 = id_10;
      default: begin
        id_12[""] <= 1'd0;
      end
    endcase
endmodule
