// Seed: 4088173978
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output wire id_2,
    input supply0 id_3,
    output supply0 id_4,
    output supply0 id_5,
    output wor id_6,
    input tri id_7,
    output tri0 id_8
    , id_14,
    output uwire id_9,
    input uwire id_10
    , id_15,
    output wor id_11,
    input supply0 id_12
);
  wire id_16;
  assign module_1.id_12 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd24,
    parameter id_1 = 32'd90,
    parameter id_6 = 32'd9,
    parameter id_7 = 32'd81,
    parameter id_9 = 32'd19
) (
    input tri1 _id_0,
    input supply1 _id_1,
    output uwire id_2,
    output wor id_3,
    output uwire id_4,
    input tri id_5,
    input uwire _id_6,
    input wor _id_7,
    input tri id_8,
    output tri _id_9,
    input supply0 id_10,
    input tri id_11,
    input tri id_12
);
  logic [1 : id_9] id_14;
  ;
  wire id_15;
  ;
  wire [id_0 : id_6] id_16, id_17, id_18;
  logic id_19;
  ;
  logic [-1 'h0 : -1] id_20, id_21;
  logic id_22;
  logic [id_7 : id_6  /  id_1  (  -1  ,  -1  )] id_23;
  ;
  module_0 modCall_1 (
      id_10,
      id_8,
      id_2,
      id_8,
      id_2,
      id_4,
      id_3,
      id_12,
      id_3,
      id_2,
      id_12,
      id_4,
      id_5
  );
  parameter id_24 = 1, id_25 = -1;
  always @* begin : LABEL_0
    id_14 <= id_21;
    $unsigned(33);
    ;
  end
  wire id_26;
  wire id_27;
  assign id_16 = id_14;
  logic id_28 = id_14 - -1;
endmodule
