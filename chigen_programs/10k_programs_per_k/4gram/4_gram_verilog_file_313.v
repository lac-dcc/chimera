// Seed: 738608228
module module_0;
  supply0 id_1;
  rpmos (1, id_2 - 1, 1, 1, 1'b0, ~id_3, 1);
  supply1 id_4;
  assign id_1 = 1'b0;
  wire id_5;
  assign {id_4++, "" === id_3} = 1;
  assign id_2 = id_4;
  final $display;
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
    id_9
);
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = 1'b0;
  module_0();
  always
  fork
    $display(1'b0, 1 - 1);
    id_8 <= {1, 1, id_4, id_4, 1, id_3, $display(1'b0)};
  join : id_10
  xor (id_1, id_3, id_4, id_5, id_6, id_7);
  final begin
    id_8 <= id_7;
    id_1 <= 1;
    if (id_1) id_5 <= 1;
    else id_8 <= !id_4;
  end
  wire id_11;
endmodule
