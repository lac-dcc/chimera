// Seed: 2857581863
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(*) begin
    if (id_2)
      case (1)
        1: assign id_4 = id_1;
        default: id_4 = id_1;
      endcase
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge {id_5{1}}) begin
    id_4 <= id_2;
  end
  module_0(
      id_2, id_5, id_5, id_4
  );
endmodule
