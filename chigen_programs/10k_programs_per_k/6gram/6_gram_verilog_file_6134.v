// Seed: 1317809480
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    input supply0 id_3,
    input wire id_4,
    input wire id_5,
    input uwire id_6,
    input supply0 id_7,
    output supply0 id_8,
    input tri id_9,
    input tri id_10,
    output tri0 id_11
);
  assign id_11 = -1'b0 == -1 < -1;
endmodule
module module_1 #(
    parameter id_8 = 32'd36
) (
    input uwire id_0,
    output uwire id_1,
    output wor id_2,
    input wor id_3,
    output uwire id_4,
    input uwire id_5,
    output uwire id_6,
    input supply0 id_7,
    input tri _id_8,
    inout tri id_9,
    output supply1 id_10
);
  wire [id_8 : 1] id_12;
  assign id_4 = id_3;
  assign id_9 = id_9;
  wire id_13;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_7,
      id_7,
      id_5,
      id_3,
      id_3,
      id_9,
      id_1,
      id_0,
      id_0,
      id_1
  );
  logic id_14;
  specify
    (posedge id_15 => (id_16 +: 1)) = (id_13  : 1  : id_5, id_12 - id_7  : id_9  : 1);
    (id_17 => id_18) = (-1'h0, -1);
    $width(posedge id_19, id_17);
  endspecify
endmodule : SymbolIdentifier
