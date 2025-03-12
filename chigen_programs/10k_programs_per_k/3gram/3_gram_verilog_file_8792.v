// Seed: 1431956903
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
  wire id_9;
endmodule
module module_1 #(
    parameter id_11 = 32'd42,
    parameter id_2  = 32'd30,
    parameter id_4  = 32'd86,
    parameter id_6  = 32'd15,
    parameter id_8  = 32'd49,
    parameter id_9  = 32'd15
) (
    input wire id_0,
    input wire id_1,
    input supply1 _id_2,
    input tri1 id_3
    , _id_11,
    input tri1 _id_4,
    input supply1 id_5,
    output uwire _id_6,
    input wire id_7,
    input uwire _id_8,
    input uwire _id_9
);
  wire [id_11  ==  id_2  %  id_2 : id_8] id_12;
  wire id_13;
  logic [1 'b0 ?  id_4  -  -1 : -1 'b0 : (  -1  )] id_14, id_15;
  struct packed {
    logic [-1 : 1] id_16;
    logic [-1 : id_9  #  (  .  id_9  (  !  id_9  )  )  &  id_6  &  1] id_17;
  } id_18;
  module_0 modCall_1 (
      id_12,
      id_16,
      id_16,
      id_17,
      id_18,
      id_17
  );
  logic id_19 = -1;
  logic id_20;
  ;
  always @(posedge id_2) begin : LABEL_0
    id_14 <= 1;
  end
endmodule
