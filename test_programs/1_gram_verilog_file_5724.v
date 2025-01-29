// Seed: 4058114347
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
    id_15
);
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_16(
      .id_0(id_1.id_1),
      .id_1(-1),
      .id_2(id_10),
      .id_3(-1),
      .id_4({id_9{id_7}}),
      .id_5(id_14),
      .id_6(1),
      .id_7(id_12)
  ); id_17 :
  assert  property  (  @  (  posedge  -1  or  posedge  id_5  or  posedge  id_5  )  id_12  ?  (  id_5  )  :  id_17  ?  -1 'b0 :  id_14  )  ;
  wire id_18;
  always deassign id_9;
  wire id_19, id_20, id_21, id_22;
endmodule
module module_1 (
    output wor id_0,
    output supply1 id_1,
    input wire id_2,
    input supply1 id_3,
    output supply1 id_4
);
  assign id_4 = 1;
  parameter id_6 = {-1'b0, 1, 1'h0, -1};
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
  wire id_8;
endmodule
