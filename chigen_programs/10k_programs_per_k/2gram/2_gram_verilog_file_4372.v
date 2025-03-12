// Seed: 4198920327
module module_0 (
    output tri id_0,
    input tri id_1,
    output supply0 id_2
    , id_18,
    input supply1 id_3,
    output wire id_4,
    input wire id_5,
    input tri1 id_6,
    input supply1 id_7,
    input uwire id_8,
    input uwire id_9,
    input uwire id_10,
    input wor id_11,
    output wor id_12,
    output uwire id_13
    , id_19,
    input uwire id_14,
    input tri id_15,
    output wand id_16
);
endmodule
module module_1 #(
    parameter id_2 = 32'd10,
    parameter id_3 = 32'd64,
    parameter id_6 = 32'd38,
    parameter id_8 = 32'd23
) (
    input tri id_0,
    output logic id_1,
    input tri1 _id_2,
    input supply0 _id_3,
    output wand id_4,
    output supply0 id_5,
    input wand _id_6,
    output tri0 id_7,
    output tri0 _id_8
);
  wire [-1 'b0 : id_8] id_10;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_0,
      id_7,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_4,
      id_4,
      id_0,
      id_0,
      id_7
  );
  assign modCall_1.id_6 = 0;
  always
    if (1 + -1)
      @* begin : LABEL_0
        id_1 <= id_6;
      end
  wire id_11;
  wire [id_2 : -1 'b0 ||  id_3] id_12;
  logic [id_6 : -1] id_13;
  ;
  not primCall (id_7, id_10);
  assign id_10 = id_0;
  wire id_14;
  wire [(  -1  ) : -1] id_15;
endmodule
