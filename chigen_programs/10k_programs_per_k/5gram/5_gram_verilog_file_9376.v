// Seed: 2276160289
module module_0 (
    input  wor  id_0,
    input  wor  id_1,
    output tri  id_2,
    input  tri0 id_3
);
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    output wor id_2,
    output uwire id_3,
    input supply0 id_4,
    input logic id_5,
    output logic id_6,
    input tri1 id_7,
    output wor id_8
);
  tri1 id_10;
  always_comb @(1 or posedge id_7) begin
    id_6 <= #1 id_5;
    #1 begin
      id_1 <= 1;
    end
    id_2 = id_4;
  end
  case (id_5)
    1:
    always #1 begin
      id_3  = 1;
      id_10 = 1;
      assume #1  (1);
      else;
    end
    id_10: supply0 id_11 = 1 && id_7;
  endcase
  supply0 id_12;
  module_0(
      id_10, id_10, id_8, id_4
  );
  always @(posedge id_12) id_3 -= id_12;
  wire id_13;
  always @(posedge id_7 or posedge id_0) id_10 = id_7;
  wire id_14;
endmodule
