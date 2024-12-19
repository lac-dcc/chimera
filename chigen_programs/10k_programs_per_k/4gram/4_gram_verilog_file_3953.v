// Seed: 862539821
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1 - !id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_5 <= id_2[1'b0 : 1];
  end
  wire id_7;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_7
  );
  always
    if (1) id_3 <= 1;
    else begin : LABEL_0
      if (id_3) id_5 = id_3;
      else begin : LABEL_0
        id_4 = new[id_6] (1 == 1);
      end
    end
endmodule
