// Seed: 951224463
module module_0 (
    id_1,
    id_2,
    id_3
);
  output uwire id_3;
  output wire id_2;
  input wire id_1;
  specify
    (negedge id_4 => (id_5 +: 1)) = (id_5 == id_1, 1'b0 : -1'b0 : -1'h0);
    (id_6 => id_7) = 1;
  endspecify
  wire id_8;
  assign id_3 = 1 && id_1;
endmodule
module module_1 ();
  wire id_1;
  ;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout reg id_7;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6
  );
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    release id_6;
    id_7 = "";
  end
endmodule
