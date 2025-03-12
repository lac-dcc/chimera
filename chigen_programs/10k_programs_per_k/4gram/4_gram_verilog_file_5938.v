// Seed: 2508978200
module module_0 #(
    parameter id_16 = 32'd64
) (
    output tri0 id_0,
    input tri id_1,
    input wire id_2,
    input wand id_3,
    output tri0 id_4,
    input wire id_5,
    input wand id_6,
    input wire id_7,
    input wor id_8,
    input supply0 id_9,
    input wand id_10,
    input wand id_11,
    input supply1 id_12,
    input supply0 id_13,
    input wand id_14,
    output supply1 id_15,
    input supply1 _id_16,
    input tri id_17,
    output wire id_18,
    output wor id_19
);
  always @(posedge -1) begin : LABEL_0
    return id_13 * (id_3);
  end
  assign module_1.id_1 = 0;
  real [id_16 : ( "" )  &&  -1  &&  -1] \id_21 ;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd50,
    parameter id_5 = 32'd25,
    parameter id_6 = 32'd85,
    parameter id_8 = 32'd53
) (
    input supply1 _id_0,
    input supply1 id_1,
    output tri0 id_2,
    output supply0 id_3
);
  wire [(  id_0  ) : id_0] _id_5;
  wire _id_6 = id_6;
  assign id_3 = id_6;
  logic [7:0][id_0 : -1] id_7;
  localparam id_8 = (1);
  assign id_7 = id_0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_8,
      id_1,
      id_3,
      id_2
  );
  logic id_9;
  ;
  logic [id_5  #  (  .  id_5  (  id_8  )  ) : 1] id_10[1 'b0 : 1];
  ;
  assign id_7[id_6] = -1;
endmodule
