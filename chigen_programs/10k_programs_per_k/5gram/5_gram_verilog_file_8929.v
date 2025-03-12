// Seed: 2349319559
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
    id_11
);
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  assign module_1.id_10 = 0;
  output wire id_1;
  logic id_12;
endmodule
module module_1 #(
    parameter id_23 = 32'd50,
    parameter id_24 = 32'd62,
    parameter id_3  = 32'd28
) (
    input tri1 id_0,
    input wire id_1,
    output tri1 id_2,
    input tri0 _id_3,
    inout supply0 id_4,
    input tri id_5,
    input wire id_6,
    output tri id_7,
    output tri id_8
    , id_18,
    input tri1 id_9,
    input supply1 id_10,
    input supply0 id_11,
    output wand id_12,
    output uwire id_13,
    input supply1 id_14,
    output tri0 id_15,
    input wor id_16
);
  wire id_19;
  localparam  id_20  =  1  ,  id_21  =  id_21  ,  id_22  =  id_1  ,  id_23  =  {  id_20  [  id_3  ]  {  id_16  }  }  ,  id_24  =  id_23  ,  id_25  =  {
    -1, 1
  };
  module_0 modCall_1 (
      id_18,
      id_19,
      id_18,
      id_18,
      id_18,
      id_19,
      id_19,
      id_19,
      id_19,
      id_18,
      id_19
  );
  defparam id_24.id_23 =
  id_12++
  ;
  xor primCall (
      id_8,
      id_21,
      id_6,
      id_22,
      id_18,
      id_0,
      id_5,
      id_10,
      id_11,
      id_25,
      id_4,
      id_9,
      id_24,
      id_14,
      id_16,
      id_1
  );
endmodule
