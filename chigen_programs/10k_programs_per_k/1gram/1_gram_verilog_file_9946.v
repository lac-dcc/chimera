// Seed: 3453919674
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output uwire id_2,
    output supply0 id_3,
    input wire id_4,
    output wand id_5,
    input tri1 id_6,
    input uwire id_7
);
  wire id_9;
endmodule
module module_1 #(
    parameter id_7 = 32'd23
) (
    input tri1 id_0,
    input wand id_1,
    input uwire id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri id_5,
    output tri1 id_6,
    output supply0 _id_7
);
  wire id_9;
  struct packed {
    logic id_10;
    logic id_11;
    id_12 id_13;
    logic id_14;
    logic id_15[1 : (  -1 'b0 )];
  } id_16;
  wire id_17;
  wire id_18;
  wire id_19["" : id_7  -  -1];
  ;
  id_20 :
  assert property (@(posedge 1) 1) begin : LABEL_0
    id_16.id_15 = id_20;
    #1 id_16.id_11 = id_16.id_15;
  end
  module_0 modCall_1 (
      id_0,
      id_4,
      id_6,
      id_6,
      id_1,
      id_6,
      id_5,
      id_2
  );
endmodule
