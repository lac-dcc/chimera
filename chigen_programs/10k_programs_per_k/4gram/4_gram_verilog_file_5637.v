// Seed: 3490324609
module module_0;
  generate
    if (1) logic id_1;
    else begin : LABEL_0
      initial $clog2(97);
      ;
    end
  endgenerate
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd29
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7
);
  inout wire _id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  or primCall (id_1, id_2, id_3, id_4, id_6);
  module_0 modCall_1 ();
  integer id_8 = id_6;
  logic   id_9 = id_8[1'b0];
  assign id_6 = id_1[id_7 : !-1];
  assign id_5 = id_6;
endmodule
