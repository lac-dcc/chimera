// Seed: 2769333163
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3[1] = id_2;
  xnor (id_1, id_5, id_2, id_4);
  module_0(
      id_4, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  tri1 id_4;
  final $display(1);
  module_0(
      id_3, id_4
  );
  logic [7:0] id_5;
  always_ff @(1) id_5 += 1;
  initial begin
    case (id_4)
      id_2, 1: id_1 = id_5;
      id_4:
      #(id_4) begin
        id_1 = (id_5[1]);
      end
      default: id_4 = 1;
    endcase
  end
  wire id_6;
  assign id_4 = 1;
endmodule
