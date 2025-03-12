// Seed: 3208272043
module module_0 (
    output supply0 id_0,
    input wire id_1,
    output tri0 id_2,
    input tri id_3,
    input tri1 id_4,
    input uwire id_5
);
  wire id_7;
  assign id_7 = 1;
  assign module_1.id_2 = 0;
  parameter id_8 = 1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd80
) (
    output logic id_0,
    output uwire id_1,
    input  tri0  _id_2,
    input  wire  id_3,
    input  tri   id_4
);
  reg id_6;
  assign id_1 = id_4 !== id_2;
  assign id_6 = id_4;
  reg [id_2 : 1] id_7;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_4,
      id_3,
      id_4
  );
  always @(-1 == {id_4, id_3} or posedge id_2) begin : LABEL_0
    fork
      id_6 = id_6;
      #({id_7,
        id_4 == 1,
        id_7 ==? id_2,
        1,
        -1
      })
      begin : LABEL_1
        id_0 <= -1;
      end
    join
    id_7 <= -1;
  end
  wire id_8;
endmodule
