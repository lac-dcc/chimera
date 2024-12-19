// Seed: 3495760617
module module_0 #(
    parameter id_15 = 32'd57,
    parameter id_16 = 32'd8
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  if (id_5) begin : LABEL_0
    wire id_14;
  end else begin : LABEL_0
    defparam id_15.id_16 = 1;
  end
  wire id_17;
  assign module_1.type_9 = 0;
  assign id_8 = id_12;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input tri0 id_2,
    output tri1 id_3
);
  wire id_5;
  or primCall (id_3, id_0, id_6, id_5);
  assign id_3 = id_0;
  wire id_6 = id_6;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  supply0 id_7;
  assign id_7 = 1;
  wire id_8;
  assign id_3 = 1;
endmodule
