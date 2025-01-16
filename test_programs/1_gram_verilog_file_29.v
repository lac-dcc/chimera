// Seed: 3152712992
module module_0;
  assign id_1 = id_1 <-> 1 - id_1;
  localparam id_2 = 1;
  id_3(
      id_1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1;
  module_0 modCall_1 ();
  wire id_8;
  assign id_3 = "" == id_1;
endmodule
module module_2 ();
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always
    assume #1  (id_1) begin : LABEL_0
      id_2 <= "";
      id_1 <= id_2;
    end
endmodule
