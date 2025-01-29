// Seed: 933816315
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_5;
  assign id_3 = -1;
  localparam id_6 = 1;
  wire id_7;
  module_2 modCall_1 ();
endmodule
module module_1 (
    output tri1 id_0,
    output tri1 id_1
);
  wire id_4;
  wand id_5 = 1'b0, id_6, id_7;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_4,
      id_5,
      id_4
  );
  assign id_6 = id_6;
  and primCall (id_0, id_4, id_7, id_6, id_5);
endmodule
module module_2 ();
  always #1
    if (1) begin : LABEL_0
      id_1 = -1;
    end
endmodule
