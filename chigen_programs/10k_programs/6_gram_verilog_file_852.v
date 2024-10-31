// Seed: 2595907718
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    input uwire id_2,
    input tri id_3,
    input supply1 id_4,
    input tri0 id_5,
    output tri1 id_6,
    output logic id_7
);
  always @(posedge (1'b0)) begin
    id_7 <= id_3 > id_5 - {1'b0{1 + id_2}};
  end
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    input logic id_2,
    input wor id_3,
    input wire id_4,
    input supply1 id_5,
    output wor id_6,
    output supply1 id_7,
    output supply1 id_8,
    output wire id_9,
    output logic id_10,
    output uwire id_11,
    output uwire id_12
);
  initial
    #(1)
      case ((id_0))
        1: id_8 = id_4;
        default: begin
          id_10 <= id_2;
        end
      endcase
  module_0(
      id_11, id_11, id_5, id_5, id_0, id_4, id_7, id_10
  );
endmodule
