// Seed: 3033609903
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
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_1 = 1'b0;
    $display(id_10, 1);
    id_3 = id_6;
  end
  assign module_1.id_2 = 0;
endmodule
module module_0 (
    input  logic id_0,
    output logic id_1,
    output logic id_2
);
  logic id_4, id_5;
  logic id_6;
  assign id_5 = id_0 && id_0;
  assign id_2 = 1'h0;
  always
    case (1)
      1'b0: id_4 = id_6;
      id_0: id_5 <= id_0;
      id_4: module_1 <= 1;
      1 == 1: id_5 = 1;
      1: id_6 <= 1'b0;
      1: id_1 <= id_5;
      1: id_1 = 1;
      default: begin : LABEL_0
        id_2 <= id_6;
        `define pp_7 0
        id_4 <= `pp_7;
        id_5 <= 1;
        $display(id_6 != `pp_7, 1);
        id_2 = 1;
        `pp_7 <= id_0 + 1;
      end
    endcase
  wire id_8;
  wire id_9;
  reg id_10, id_11;
  always id_11 <= #id_9 1'b0;
  and primCall (id_1, id_8, id_0, id_6, id_5, id_10, id_4, id_11, id_9);
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_9,
      id_9,
      id_8,
      id_9,
      id_9,
      id_8,
      id_9,
      id_8
  );
endmodule
