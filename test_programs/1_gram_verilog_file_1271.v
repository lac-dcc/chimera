// Seed: 2474663727
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  specify
    (id_9 *> id_10) = (id_3 + id_3);
  endspecify
  bit id_11, id_12;
  always_ff begin : LABEL_0
    @(posedge 1) id_11 <= -1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_6 :
  assert  property  (  @  (  posedge  id_3  or  posedge  id_6  [  -1  ]  or  id_3  or  posedge  id_3  or  posedge  id_3  )  id_6  )  begin :LABEL_0
    id_2 = id_6;
  end
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_7,
      id_1,
      id_7,
      id_1,
      id_7,
      id_7
  );
endmodule
