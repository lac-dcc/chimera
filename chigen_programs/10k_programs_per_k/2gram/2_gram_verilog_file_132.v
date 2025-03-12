// Seed: 1858013731
module module_0 #(
    parameter id_1 = 32'd82
) (
    _id_1,
    id_2
);
  inout logic [7:0] id_2;
  inout wire _id_1;
  assign id_2 = id_1;
  generate
    assign id_2 = ~id_1;
  endgenerate
  assign id_2[id_1] = id_2;
endmodule
module module_1 #(
    parameter id_0 = 32'd71,
    parameter id_2 = 32'd13,
    parameter id_6 = 32'd58
) (
    input supply0 _id_0,
    input wand id_1,
    input uwire _id_2#(.id_4((1)))
);
  integer id_5[1  -  id_0 : id_2];
  ;
  localparam id_6 = -1;
  assign id_5 = id_6;
  assign id_4 = id_2;
  assign id_5[-1 : id_2] = -1;
  if (-1 && -1) begin : LABEL_0
    logic id_7;
    defparam id_6.id_6 = 1;
  end
  module_0 modCall_1 (
      id_6,
      id_5
  );
endmodule
