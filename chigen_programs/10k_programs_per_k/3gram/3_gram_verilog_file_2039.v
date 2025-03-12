// Seed: 3722685618
module module_0 (
    output supply1 id_0,
    input wor id_1
);
  wire id_3;
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3,
    input wor id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_0,
      id_4
  );
endmodule
module module_2 #(
    parameter id_13 = 32'd99,
    parameter id_3  = 32'd21
) (
    inout tri1 id_0,
    output uwire id_1,
    input tri0 id_2,
    input wor _id_3,
    input supply0 id_4,
    input wand id_5,
    input wire id_6,
    input supply0 id_7,
    input supply1 id_8,
    output uwire id_9,
    input wand id_10,
    input wor id_11,
    input tri0 id_12,
    input tri0 _id_13,
    output uwire id_14,
    input tri0 id_15,
    output logic id_16
    , id_21,
    output wand id_17,
    input tri id_18,
    output tri0 id_19
);
  assign id_0 = id_5;
  module_0 modCall_1 (
      id_0,
      id_10
  );
  always  @  ( $realtime ,  posedge  id_5  &&  -1 'b0 ,  id_3  or  posedge  id_13  ==  id_2  or  negedge  -1  ,  posedge  ~  -1  or  posedge  (  id_12  )  )
    id_16 = id_7;
  struct packed {struct packed {logic id_22;} [~  id_3 : id_13] id_23;} id_24;
  wire id_25;
  assign id_24 = id_21 - id_24.id_22[1];
endmodule
