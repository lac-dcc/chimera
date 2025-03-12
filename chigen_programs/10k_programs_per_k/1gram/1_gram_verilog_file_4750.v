// Seed: 347006423
module module_0 (
    id_1
);
  input wire id_1;
  assign module_1.id_5 = 0;
  generate
    struct packed {
      integer id_2;
      logic   id_3;
      logic   id_4;
    } id_5;
  endgenerate
  assign id_5.id_4 = "" << 1;
  assign id_5 = -1;
  final id_5 = 1;
  logic id_6 = 1'd0;
  wire id_7, id_8, id_9;
endmodule
module module_1 #(
    parameter id_0 = 32'd92
) (
    input wor  _id_0,
    inout wire id_1
);
  logic id_3;
  module_0 modCall_1 (id_3);
  wire [-1 : id_0] id_4;
  always begin : LABEL_0
    assert (id_0)
      #id_5 begin : LABEL_1
        begin : LABEL_2
        end
        $clog2(59);
        ;
      end
  end
  logic id_6;
endmodule
