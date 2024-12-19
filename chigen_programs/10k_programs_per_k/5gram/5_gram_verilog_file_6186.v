// Seed: 1096355417
module module_0;
  wire id_2;
  assign module_2.id_11 = 0;
endmodule
module module_1;
  assign id_1 = 1;
  assign id_1 = id_1++;
  module_0 modCall_1 ();
  wire id_2;
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    access,
    id_8,
    id_9,
    module_2
);
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 ();
  always @(posedge id_8 or posedge 1) begin : LABEL_0
    id_11 <= id_5[1];
    id_8 += id_4++;
    release id_9#(.id_8(id_8 == id_9[1'h0+1] + 1));
  end
endmodule
