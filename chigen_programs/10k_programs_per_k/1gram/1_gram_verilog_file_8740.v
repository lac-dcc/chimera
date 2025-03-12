// Seed: 3111760759
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input wor id_2,
    input uwire id_3,
    input tri0 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input supply0 id_7,
    output wire id_8,
    output supply0 id_9,
    input supply0 id_10,
    input wand id_11
);
endmodule
program module_1 #(
    parameter id_0 = 32'd39
) (
    output supply1 _id_0,
    input supply0 id_1,
    input wor id_2,
    input wire id_3,
    input supply1 id_4,
    output supply0 id_5,
    output logic id_6,
    input tri1 id_7,
    output logic id_8,
    input uwire id_9
);
  reg id_11;
  wand id_12, id_13;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_9,
      id_1,
      id_1,
      id_5,
      id_4,
      id_7,
      id_5,
      id_5,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  wire id_14[(  1 'b0 ) : id_0];
  assign id_6 = id_7;
  logic id_15, id_16;
  logic id_17;
  assign id_6 = 1;
  logic id_18;
  initial disable id_19[1 : 1-1];
  assign id_12 = 1 && id_14;
  logic \id_20 , id_21 = id_13;
  wire id_22;
  wire id_23 [-1 'b0 : -1];
  for (id_24 = id_13; id_15 - 1; id_8 = id_18)
  always begin : LABEL_0
    begin : LABEL_1
      begin : LABEL_2
        id_18 <= -1'h0;
        id_6 = (\id_20 | -1);
        id_11 <= "";
      end
    end
    $unsigned(55);
    ;
  end
endprogram
