// Seed: 3149121143
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_7) begin : LABEL_0
    assume (id_4) $signed(63);
    ;
  end
  assign id_8 = id_6;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd26
) (
    id_1,
    _id_2
);
  inout wire _id_2;
  output wire id_1;
  wand [id_2 : 1] id_3 = 1, id_4 = id_3, id_5 = id_2;
  assign id_4 = id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4,
      id_3
  );
endmodule
