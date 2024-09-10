// Seed: 2404043307
module module_0 #(
    parameter id_32 = 32'd8,
    parameter id_4  = 32'd76,
    parameter id_44 = 32'd78,
    parameter id_46 = 32'd88,
    parameter id_8  = 32'd84,
    parameter id_9  = 32'd3
) (
    input logic id_1,
    input id_2,
    input logic id_3,
    input _id_4,
    output id_5,
    input logic id_6,
    output id_7,
    input _id_8,
    input _id_9,
    input id_10,
    output reg id_11,
    output id_12,
    output logic id_13,
    input logic id_14,
    input id_15,
    input logic id_16,
    input id_17,
    output reg id_18,
    input reg id_19,
    input logic id_20,
    input logic id_21,
    output id_22,
    output id_23,
    output logic id_24,
    input id_25,
    input id_26,
    input id_27,
    input id_28,
    output id_29
);
  logic id_30;
  reg   id_31;
  assign id_18[id_4[1'b0]] = 1;
  logic _id_32 = 1;
  assign id_15[id_8[1 : 1]] = 1;
  pullup (id_29[1], (id_6[1]), 1, 1'h0);
  assign id_27[1] = 1;
  reg id_33;
  reg id_34, id_35, id_36;
  logic id_37;
  defparam id_38.id_39 = 1;
  logic id_40;
  assign id_1 = id_16;
  type_64(
      1, 1, "" != 1'h0
  );
  reg id_41, id_42, id_43, _id_44, id_45, _id_46, id_47;
  always @(*) begin
    wait (1'b0);
    id_34 <= 1;
    id_19 <= id_38;
    if (id_16) begin
      id_3 = id_4[id_46[id_32]];
      case (1'b0)
        1'b0: begin
          id_12 = id_26;
        end
        1: id_5 <= 'h0;
        id_2[1 : id_9] * 1: id_6 = 1;
        1: id_43 = 1;
        1: begin
          id_29 = id_15;
        end
        1'b0: begin
          if (1'b0) begin
            #1 id_32 = id_25[id_44 : 1];
            if (id_46 & {id_22{1}}) begin
              id_9 = 1;
            end else id_10 <= id_11;
          end
        end
        id_13: id_32 <= #1 id_31;
      endcase
    end else id_47 <= id_25;
  end
  initial begin
    id_43 <= id_8;
    id_18 <= 1;
    id_33 <= id_44;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd56,
    parameter id_9 = 32'd1
) (
    input  id_1,
    output id_2
);
  task _id_3(input id_4, input int id_5, input id_6, input id_7, input integer id_8);
    begin
      id_4 <= 1'h0;
      SystemTFIdentifier(1, id_8 == 1);
      #1 id_5 <= 1;
      id_4 <= id_6;
      #_id_9 SystemTFIdentifier(id_9);
      id_6 <= id_7[(id_9)-1 : 1];
      id_8 <= id_7 >> 1;
      id_8 = 1;
    end
  endtask
  logic id_10;
  assign id_1 = 1'b0;
  logic id_11;
  assign id_10 = 1;
  assign id_3  = id_8[id_3];
  initial if (id_8) id_8 <= 1;
endmodule
