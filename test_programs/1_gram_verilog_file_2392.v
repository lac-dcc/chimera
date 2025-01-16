// Seed: 2724763968
module module_0 (
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
    id_13,
    id_14
);
  output wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_9 <= id_2;
  assign module_1.id_20 = 0;
  tri1 id_15;
  assign id_1 = 1;
  parameter id_16 = 1;
  assign id_15 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input wire id_2,
    input tri1 id_3,
    input supply0 id_4,
    output wor id_5,
    output wand id_6,
    output tri0 id_7,
    input tri1 id_8,
    input wor id_9,
    input tri0 id_10,
    output uwire id_11,
    input supply1 id_12,
    output tri id_13,
    input tri0 id_14,
    input wire id_15,
    input tri id_16,
    input wand id_17
);
  assign id_6 = id_17;
  parameter id_19 = 1;
  supply1 id_20, id_21, id_22, id_23;
  module_0 modCall_1 (
      id_19,
      id_19,
      id_19,
      id_19,
      id_19,
      id_19,
      id_19,
      id_19,
      id_19,
      id_19,
      id_19,
      id_19,
      id_19,
      id_19
  );
  assign id_7 = id_4;
  id_24 :
  assert  property  (  @  (  posedge  -1  or  posedge  id_20  or  id_20  or  posedge  -1  or  id_0  or  posedge  id_17  ==  1  ==?  1  )  -1 'b0 )
    $display(id_12 !== id_8);
endmodule
