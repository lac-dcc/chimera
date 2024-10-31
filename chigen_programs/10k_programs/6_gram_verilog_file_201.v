// Seed: 85887169
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  supply0  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ;
  assign id_31 = 1;
  wire id_34;
  assign id_18 = 1'b0;
endmodule
module module_1 (
    input  logic id_0,
    input  wor   id_1,
    input  logic id_2,
    output logic id_3,
    output tri0  id_4,
    output logic id_5
);
  always @(posedge id_1) begin
    id_3 <= id_2;
  end
  wire id_7;
  xor (id_4, id_10, id_8, id_9, id_2);
  specify
    (id_8 => id_9) = (1  : 1'b0 : id_2);
    if ("") (negedge id_10 => (id_11 +: 1 ^ 1'b0)) = (~id_11, id_10);
  endspecify
  always id_5 <= #1 id_0;
  module_0(
      id_11, id_7, id_7
  );
endmodule
