// This program was cloned from: https://github.com/SteffenReith/TT06_PiMac
// License: Apache License 2.0

// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : PiMAC
// Git hash  : 82e1b4b4426cb20a6f387f1686876bda014c9247

`timescale 1ns/1ps

module PiMAC (
  input  wire [3:0]    a,
  input  wire [3:0]    b,
  input  wire [3:0]    c,
  output wire [7:0]    result,
  input  wire          clk,
  input  wire          reset
);

  wire       [4:0]    _zz_nodes_1_ACC_1;
  wire       [5:0]    _zz_nodes_2_ACC_2;
  wire       [6:0]    _zz_nodes_3_ACC_3;
  reg        [3:0]    nodes_3_B;
  reg        [3:0]    nodes_3_A;
  reg        [6:0]    nodes_3_ACC_2;
  wire       [7:0]    nodes_3_ACC_3;
  reg        [3:0]    nodes_2_B;
  reg        [3:0]    nodes_2_A;
  reg        [5:0]    nodes_2_ACC_1;
  wire       [6:0]    nodes_2_ACC_2;
  reg        [3:0]    nodes_1_B;
  reg        [3:0]    nodes_1_A;
  reg        [4:0]    nodes_1_ACC_0;
  wire       [5:0]    nodes_1_ACC_1;
  wire       [4:0]    nodes_0_ACC_0;
  wire       [3:0]    nodes_0_C;
  wire       [3:0]    nodes_0_B;
  wire       [3:0]    nodes_0_A;

  assign _zz_nodes_1_ACC_1 = ({1'd0,nodes_1_A} <<< 1'd1);
  assign _zz_nodes_2_ACC_2 = ({2'd0,nodes_2_A} <<< 2'd2);
  assign _zz_nodes_3_ACC_3 = ({3'd0,nodes_3_A} <<< 2'd3);
  assign nodes_0_A = a;
  assign nodes_0_B = b;
  assign nodes_0_C = c;
  assign nodes_0_ACC_0 = ({1'b0,nodes_0_C} + {1'b0,(nodes_0_B[0] ? nodes_0_A : 4'b0000)});
  assign nodes_1_ACC_1 = ({1'b0,nodes_1_ACC_0} + {1'b0,(nodes_1_B[1] ? _zz_nodes_1_ACC_1 : 5'h00)});
  assign nodes_2_ACC_2 = ({1'b0,nodes_2_ACC_1} + {1'b0,(nodes_2_B[2] ? _zz_nodes_2_ACC_2 : 6'h00)});
  assign nodes_3_ACC_3 = ({1'b0,nodes_3_ACC_2} + {1'b0,(nodes_3_B[3] ? _zz_nodes_3_ACC_3 : 7'h00)});
  assign result = nodes_3_ACC_3;
  always @(posedge clk) begin
    nodes_1_A <= nodes_0_A;
    nodes_1_B <= nodes_0_B;
    nodes_1_ACC_0 <= nodes_0_ACC_0;
    nodes_2_A <= nodes_1_A;
    nodes_2_B <= nodes_1_B;
    nodes_2_ACC_1 <= nodes_1_ACC_1;
    nodes_3_A <= nodes_2_A;
    nodes_3_B <= nodes_2_B;
    nodes_3_ACC_2 <= nodes_2_ACC_2;
  end


endmodule
