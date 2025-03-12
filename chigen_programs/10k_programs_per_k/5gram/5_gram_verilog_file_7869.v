// Seed: 1609784329
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    output tri0 id_0,
    output wand id_1
);
  wire id_3;
  buf primCall (id_0, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 #(
    parameter id_2 = 32'd99
) (
    id_1,
    _id_2
);
  inout wire _id_2;
  inout logic [7:0] id_1;
  wire id_3;
  always @(id_3 or ~id_2)
    if (-1) begin : LABEL_0
      $unsigned(7);
      ;
    end else begin : LABEL_1
      deassign id_1;
    end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
