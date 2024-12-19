// Seed: 2326899152
module module_0 (
    input  tri1 id_0,
    output wire id_1,
    output tri1 id_2,
    inout  tri0 id_3
);
  always begin : LABEL_0$display
    ;
    $display;
  end
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    input logic id_2,
    input wire id_3,
    output tri1 id_4,
    output uwire id_5
);
  supply1 id_7;
  logic   id_8;
  assign id_0 = id_8;
  or primCall (id_0, id_3, id_1, id_2, id_8, id_7);
  assign id_4 = 1 ? 1'h0 : id_7;
  assign id_0 = id_2;
  assign id_5 = id_1;
  always_latch id_0 = #1 1;
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_7
  );
  assign modCall_1.type_7 = 0;
endmodule
