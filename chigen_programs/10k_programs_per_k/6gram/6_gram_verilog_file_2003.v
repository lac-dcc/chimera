// Seed: 1796418029
module module_0;
  wire id_2;
  tri1 id_3;
  supply1 id_4, id_5;
  for (id_6 = 1; id_1; id_1 = id_4) begin : LABEL_0
    for (id_7 = id_3; 1; id_6 = id_3) begin : LABEL_0
      assign id_1 = 1'b0 || 1'b0;
    end
  end
  wire id_8;
  supply1 id_9 = 1;
  reg id_10;
  wire id_11;
  always
    if (id_4) begin : LABEL_0
      assume ((1));
    end else id_10 <= !id_10 == 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  logic [7:0] id_5;
  integer id_6;
  module_0 modCall_1 ();
  wire id_7;
  assign id_5[1] = id_2 ? id_1 : 1;
endmodule
