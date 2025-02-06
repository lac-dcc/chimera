// Seed: 2373800028
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  input wire id_24;
  output wire id_23;
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    input wand id_2,
    output tri0 id_3,
    output wor id_4,
    input wand id_5,
    input supply0 id_6,
    input supply0 id_7,
    output tri1 id_8,
    input wor id_9,
    output wire id_10,
    output tri0 id_11,
    input tri0 id_12,
    input supply1 id_13,
    output wor id_14,
    output wand id_15,
    input tri0 id_16,
    input wor id_17,
    input uwire id_18,
    output wand id_19
);
  supply0 id_21;
  module_0 modCall_1 (
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21
  );
  wire id_22;
  assign id_10 = (id_2);
  id_23(
      .id_0(-1), .id_1(id_9 ^ 1), .id_2($realtime), .id_3(), .id_4(-1), .id_5()
  );
  tri id_24;
  assign id_21 = 1;
  assign id_19 = 1;
  wor id_25;
  specify
    (  negedge  id_26  =>  (  id_27  : $realtime )  )  =  (  id_24  : $realtime :  id_17  ,  -1 'h0 : $realtime : $realtime )  ;
    $width(negedge id_28, id_25, id_6, id_29);
  endspecify
endmodule
