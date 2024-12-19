// Seed: 3187714052
module module_0;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output supply1 id_0,
    output supply1 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wire id_4
);
  specify
    (id_6 => id_7) = (!1, id_6);
    (id_8 => id_9) = 1;
    (id_10 => id_11) = 1;
  endspecify
  module_0 modCall_1 ();
  wire id_12;
  wire id_13;
  assign id_11 = id_7;
  wire id_14;
  assign id_8#(.id_13(1)) = id_10;
  always @(posedge 1) begin : LABEL_0
    id_8 <= id_4 + 1'h0;
    id_15;
    id_8 <= id_8 != id_6;
  end
endmodule
