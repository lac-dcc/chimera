// Seed: 404455606
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input supply0 id_2,
    input wand id_3,
    input wire id_4
);
  supply0 id_6;
  module_2 modCall_1 ();
  assign id_6 = 1;
  assign module_1.id_0 = 0;
  wire id_7;
endmodule
module module_1 (
    output uwire id_0,
    output tri0  id_1,
    output wor   id_2
);
  tri0 id_4;
  assign id_2 = id_4;
  wire id_5, id_6;
  specify
    specparam id_7 = id_4;
  endspecify
  module_0 modCall_1 (
      id_4,
      id_4,
      id_7,
      id_4,
      id_4
  );
endmodule
module module_2 #(
    parameter id_2 = 32'd32,
    parameter id_3 = 32'd22
);
  always @(posedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  generate
    defparam id_2.id_3 = 1;
    genvar id_4;
  endgenerate
endmodule
