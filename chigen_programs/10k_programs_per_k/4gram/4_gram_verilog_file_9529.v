// Seed: 192352124
module module_0 (
    input uwire id_0,
    output uwire id_1,
    input supply0 id_2,
    input tri id_3,
    input tri id_4,
    input supply1 id_5
);
  assign id_1 = 1'b0;
  wire  id_7;
  wire  id_8;
  uwire id_9 = 1'd0;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    input wand id_2,
    input uwire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_3,
      id_3,
      id_1
  );
  wire id_6;
  assign id_0 = 1;
  always @(1) begin : LABEL_0
    id_6 = id_5;
  end
  wire id_7;
endmodule
